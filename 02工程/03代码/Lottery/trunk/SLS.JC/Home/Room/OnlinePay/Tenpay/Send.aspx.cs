using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using System.IO;

public partial class Home_Room_OnlinePay_Tenpay_Send : RoomPageBase
{

    private string bargainor_id = "";                                                               // �̻��ţ��滻Ϊ���ѵ��̻��ţ�

    private string key = "";                                                                        // �̻�KEY���滻Ϊ���ѵ�KEY��

    private string paygateurl = "https://www.tenpay.com/cgi-bin/v1.0/pay_gate.cgi";                 // �Ƹ�֧ͨ������URL

    private string return_url = "";                                                                 // ֧���������ҳ��,�Ƽ�ʹ��ip��ַ�ķ�ʽ(�255���ַ�)

    private const int cmdno = 1;                                                                    // ֧������.1

    private int fee_type = 1;                                                                       // ��������,������ֻ֧�� 1:�����

    private string date = DateTime.Now.ToString("yyyyMMdd");

    private string sp_billno = "";                                                                  //�̻�������,10λ������

    private long total_fee = 0;                                                                     // �������,�Է�Ϊ��λ

    private string transaction_id = "";                                                             // ���׵���,�̻���(10)+֧������(8)+�̻�������(10,����Ļ���0)=28λ.

    private string desc = "";                                                                       // ��Ʒ����

    private string attach = "";                                                                     // ָ���ʶ,ÿ��ָ���������ֶ�,�Ƹ�ͨ�ڴ�����ɺ��ԭ������.

    private string purchaser_id = "";                                                               // ��ҲƸ�ͨ�ʺ�

    private string spbill_create_ip = "";                                                           // �û�ip(���ڷ�������������)


    double Money = 0;                                                                               //��ֵ���
    string bankPay = "0";                                                                           //��ֵ����
    SystemOptions so = new SystemOptions();

    protected void Page_Load(object sender, EventArgs e)
    {

        bool OnlinePay_Alipay_Status_ON = so["OnlinePay_Tenpay_Status_ON"].ToBoolean(false);

        Money = Shove._Convert.StrToDouble(Shove._Web.Utility.GetRequest("PayMoney"), 0);
        bankPay = Shove._Web.Utility.GetRequest("bankPay");

    
        if (!IsPostBack)
        {
            //����Ա�ͻ�Ա�ĳ�ֵ����ͽ�һ��
            if (_User.Competences.CompetencesList.IndexOf(Competences.Administrator) > 0)
            {
                if (Money < 0.01)
                {
                    Response.Write("<script type=\"text/javascript\">alert(\"��������ȷ�ĳ�ֵ�����ύ��лл��\"); window.close();</script>");

                    return;
                }
            }
            else
            {
                if (Money < 1)
                {
                    Response.Write("<script type=\"text/javascript\">alert(\"��������ȷ�ĳ�ֵ�����ύ��лл��\"); window.close();</script>");

                    return;
                }
            }

            //Money = 0.01;
            

            //��������
            double FormalitiesFeesScale = so["OnlinePay_Tenpay_PayFormalitiesFeesScale"].ToDouble(0) / 100;
            double FormalitiesFees = Math.Round(Money * FormalitiesFeesScale, 2);

            //���ĳ�ֵ��
            Money += FormalitiesFees;

            //�����̻���
            bargainor_id = so["OnlinePay_Tenpay_UserNumber"].Value.ToString();

            //�����̻�key
            key = so["OnlinePay_Tenpay_MD5Key"].Value.ToString();

            //��Ʒ����
            desc = HttpUtility.UrlEncode("Ԥ����", Encoding.GetEncoding("GBK"));

            //��Ʒ�ܽ��,�Է�Ϊ��λ������������ԪΪ��λ��.
            total_fee = long.Parse((Money * 100).ToString());

            //����ʺ�
            purchaser_id = "";

            //�̻��ص�url
            return_url = Shove._Web.Utility.GetUrl() + "/Home/Room/OnlinePay/Tenpay/Receive.aspx";

            //���ױ�ʶ(�û�ID+ͶעID+��ֵ��ʽ���)
            attach = Shove._Security.Encrypt.EncryptString(PF.GetCallCert(), _User.ID.ToString() + "|" + bankPay + "|" + Shove._Web.Utility.GetRequest("BuyID"));
            
            double PayMoney = Convert.ToDouble(Money.ToString());
            long NewPayNumber = -1;
            string ReturnDescription = "";

            //�����ڲ���ֵ���
            if (DAL.Procedures.P_GetNewPayNumber(_Site.ID, _User.ID, "TENPAY_" + bankPay, (PayMoney - FormalitiesFees), FormalitiesFees, ref NewPayNumber, ref ReturnDescription) < 0)
            {
                PF.GoError(ErrorNumber.DataReadWrite, "���ݿⷱæ��������", this.GetType().BaseType.FullName);

                return;
            }

            if ((NewPayNumber < 0) || (ReturnDescription != ""))
            {
                PF.GoError(ErrorNumber.Unknow, ReturnDescription, this.GetType().BaseType.FullName);

                return;
            }

            //�̻������ţ��ڲ���ֵ��ţ�
            sp_billno = NewPayNumber.ToString();

            //ؔ��ͨ���׺�,�豣֤�˶�����ÿ��Ψһ,�в����ظ���
            transaction_id = CreatePayNumber(NewPayNumber);

            //�û�IP(��ͣ)
            spbill_create_ip = "";// Page.Request.UserHostAddress;

            #region ��֤�����Ƿ���ȫ

            if (string.IsNullOrEmpty(bankPay) || string.IsNullOrEmpty(desc) || string.IsNullOrEmpty(bargainor_id) || string.IsNullOrEmpty(transaction_id) || string.IsNullOrEmpty(sp_billno) || string.IsNullOrEmpty(return_url) || string.IsNullOrEmpty(attach))
            {
                Response.Write("<script type=\"text/javascript\">alert(\"��������ȫ���޷���ֵ��\"); window.close();</script>");

                return;
            }

            #endregion


            string url = "";
            if (!GetPayUrl(out url))
            {
                Response.Write("<script type=\"text/javascript\">alert(\"" + url + "\"); window.close();</script>");

                return;
            }
            else
            {

                this.Response.Write("<script language='javascript'>window.top.location.href='" + url + "'</script>");
            }

        }
    }

    #region Web ������������ɵĴ���

    protected override void OnLoad(EventArgs e)
    {
        isRequestLogin = true;

        RequestLoginPage = this.Request.Url.AbsoluteUri;

        isAllowPageCache = false;

        base.OnLoad(e);
    }

    #endregion

    #region �ڲ�����

    /// <summary>
    /// ��ȡ֧��ҳ��URL
    /// </summary>
    /// <param name="url">�������������,��֧��URL,����������ؼ�,�Ǵ�����Ϣ</param>
    /// <returns>����ִ���Ƿ�ɹ�</returns>
    private bool GetPayUrl(out string url)
    {
        try
        {
            string sign = GetPaySign();

            url =paygateurl+"?cmdno=" + cmdno + "&date=" + date + "&bank_type=" + bankPay + "&desc=" + desc + "&purchaser_id=" + purchaser_id + "&bargainor_id="
                + bargainor_id + "&transaction_id=" + transaction_id + "&sp_billno=" + sp_billno + "&total_fee=" + total_fee
                + "&fee_type=" + fee_type + "&return_url=" + return_url + "&attach=" + UrlEncode(attach);

            if (spbill_create_ip != "")
            {
                url += "&spbill_create_ip=" + spbill_create_ip;
            }
            url += "&sign=" + sign;

            return true;
        }
        catch (Exception err)
        {
            url = "����URLʱ����,������Ϣ:" + err.Message;
            return false;
        }
    }

    /// <summary>
    /// ��ȡ֧��ǩ��
    /// </summary>
    /// <returns>���ݲ����õ�ǩ��</returns>
    private string GetPaySign()
    {
        string sign_text = "cmdno=" + cmdno + "&date=" + date + "&bargainor_id=" + bargainor_id
            + "&transaction_id=" + transaction_id + "&sp_billno=" + sp_billno + "&total_fee="
            + total_fee + "&fee_type=" + fee_type + "&return_url=" + return_url + "&attach=" + UrlEncode(attach);
        if (spbill_create_ip != "")
        {
            sign_text += "&spbill_create_ip=" + spbill_create_ip;
        }
        sign_text += "&key=" + key;

        return GetMD5(sign_text);
    }

    /// <summary>
    /// ��ȡ��д��MD5ǩ�����
    /// </summary>
    /// <param name="encypStr"></param>
    /// <returns></returns>
    private string GetMD5(string encypStr)
    {
        string retStr;
        MD5CryptoServiceProvider m5 = new MD5CryptoServiceProvider();

        //����md5����
        byte[] inputBye;
        byte[] outputBye;

        //ʹ��GB2312���뷽ʽ���ַ���ת��Ϊ�ֽ����飮
        inputBye = Encoding.GetEncoding("GB2312").GetBytes(encypStr);

        outputBye = m5.ComputeHash(inputBye);

        retStr = System.BitConverter.ToString(outputBye);
        retStr = retStr.Replace("-", "").ToUpper();
        return retStr;
    }

    /// <summary>
    /// ����һ�����׺�
    /// </summary>
    /// <param name="Number"></param>
    /// <returns></returns>
    private string CreatePayNumber(long Number)
    {
        string number = Number.ToString().PadLeft(10, '0');

        number = number.Substring(number.Length - 10);

        return bargainor_id + date + number;
    }

    /// <summary>
    /// ���ַ�������URL����
    /// </summary>
    /// <param name="instr">��������ַ���</param>
    /// <returns>������</returns>
    private string UrlEncode(string instr)
    {
        if (instr == null || instr.Trim() == "")
            return "";
        else
        {
            return instr.Replace("%", "%25").Replace("=", "%3d").Replace("&", "%26").
                Replace("\"", "%22").Replace("?", "%3f").Replace("'", "%27").Replace(" ", "%20");
        }
    }

    /// <summary>
    /// ���ַ�������URL����
    /// </summary>
    /// <param name="instr">��������ַ���</param>
    /// <returns>������</returns>
    private string UrlDecode(string instr)
    {
        if (instr == null || instr.Trim() == "")
            return "";
        else
        {
            return instr.Replace("%3d", "=").Replace("%26", "&").Replace("%22", "\"").Replace("%3f", "?")
                .Replace("%27", "'").Replace("%20", " ").Replace("%25", "%");
        }
    }

    #endregion

}
