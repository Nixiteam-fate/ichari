using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
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

using com.unionpay.upop.sdk;

public partial class Home_Room_OnlinePay_ChinaUnion_Send : RoomPageBase
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

        //bool OnlinePay_Alipay_Status_ON = so["OnlinePay_Tenpay_Status_ON"].ToBoolean(false);

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
            double FormalitiesFeesScale = so["OnlinePay_ChinaUnion_CommissionScale"].ToDouble(0) / 100;
            double FormalitiesFees = Math.Round(Money * FormalitiesFeesScale, 2);

            //���ĳ�ֵ��
            Money += FormalitiesFees;

            //�����̻���
            bargainor_id = so["OnlinePay_ChinaUnion_UserName"].Value.ToString();

            //�����̻�key
            key = so["OnlinePay_ChinaUnion_MD5"].Value.ToString();

            //��Ʒ����
            desc = HttpUtility.UrlEncode("Ԥ����", Encoding.GetEncoding("GBK"));

            //��Ʒ�ܽ��,�Է�Ϊ��λ������������ԪΪ��λ��.
            total_fee = long.Parse((Money * 100).ToString());

            //����ʺ�
            purchaser_id = "";

            //�̻���̨�ص�url
            return_url = Shove._Web.Utility.GetUrl() + "/Home/Room/OnlinePay/ChinaUnion/Receive.aspx";
            
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


            //string url = "";
            //if (!GetPayUrl(out url))
            //{
            //    Response.Write("<script type=\"text/javascript\">alert(\"" + url + "\"); window.close();</script>");

            //    return;
            //}
            //else
            //{

            //    this.Response.Write("<script language='javascript'>window.top.location.href='" + url + "'</script>");
            //}

            UPOPSrv.LoadConf(Server.MapPath("conf.xml.config"));
            var srv = new FrontPaySrv(GenParams());
            Response.ContentEncoding = srv.Charset;
            Response.Write(srv.CreateHtml());

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

    private Dictionary<string, string> GenParams()
    {
        var dict = new Dictionary<string, string>();
        // �������ͣ�ǰֻ̨֧��CONSUME �� PRE_AUTH
        dict.Add("transType", UPOPSrv.TransType.CONSUME);
        // ��ƷURL
        dict.Add("commodityUrl",string.Empty);
        // ��Ʒ����
        dict.Add("commodityName","Ԥ����");
        // ��Ʒ���ۣ���Ϊ��λ
        dict.Add("commodityUnitPrice",Money.ToString());
        // ��Ʒ����
        dict.Add("commodityQuantity","1");
        // �����ţ�����Ψһ
        dict.Add("orderNumber",sp_billno);
        // ���׽��
        dict.Add("orderAmount", total_fee.ToString());
        // ����
        dict.Add("orderCurrency",UPOPSrv.CURRENCY_CNY);
        // ����ʱ��
        dict.Add("orderTime",DateTime.Now.ToString("yyyyMMddHHmmss"));
        // �û�IP
        dict.Add("customerIp",Request.UserHostAddress);
        // ǰ̨�ص�URL
        var redirectUrl = Shove._Web.Utility.GetUrl() + "/Home/Room/OnlinePay/Ok.aspx";
        dict.Add("frontEndUrl",redirectUrl);
        // ��̨�ص�URL��ǰ̨����ʱ��Ϊ�գ�
        dict.Add("backEndUrl",return_url);

        return dict;
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
