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

public partial class Home_Room_OnlinePay_99Bill_Send : RoomPageBase
{
    #region Web ������������ɵĴ���

    protected override void OnLoad(EventArgs e)
    {
        isRequestLogin = true;

        RequestLoginPage = this.Request.Url.AbsoluteUri;

        isAllowPageCache = false;

        base.OnLoad(e);
    }

    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            double payMoney = Shove._Convert.StrToDouble(Shove._Web.Utility.GetRequest("PayMoney"), 0);
            string bankPay = Shove._Web.Utility.GetRequest("bankPay");
            string buyID = Shove._Web.Utility.GetRequest("BuyID");
            SystemOptions so = new SystemOptions();

            //����Ա�ͻ�Ա�ĳ�ֵ����ͽ�һ��
            if (_User.Competences.CompetencesList.IndexOf(Competences.Administrator) > 0)
            {
                if (payMoney < 0.01)
                {
                    Response.Write("<script type=\"text/javascript\">alert(\"��������ȷ�ĳ�ֵ�����ύ��лл��\"); window.close();</script>");

                    return;
                }
            }
            else
            {
                if (payMoney < 0.01)
                {
                    Response.Write("<script type=\"text/javascript\">alert(\"��������ȷ�ĳ�ֵ�����ύ��лл��\"); window.close();</script>");

                    return;
                }
            }


            //��������
            double formalitiesFeesScale = so["OnlinePay_99Bill_PayFormalitiesFeesScale"].ToDouble(0) / 100;
            double formalitiesFees = Math.Round(payMoney * formalitiesFeesScale, 2);

            if (formalitiesFeesScale > 0.09)//�����ѱ�������
            {
                PF.GoError(ErrorNumber.DataReadWrite, "�����ѱ�������", this.GetType().BaseType.FullName);
                return;
            }
            //���ĳ�ֵ��
            payMoney += formalitiesFees;

            long newPayNumber = -1;
            string returnDescription = "";
            //�����ڲ���ֵ���
            if (DAL.Procedures.P_GetNewPayNumber(_Site.ID, _User.ID, "99Bill_" + bankPay, (payMoney - formalitiesFees), formalitiesFees, ref newPayNumber, ref returnDescription) < 0)
            {
                PF.GoError(ErrorNumber.DataReadWrite, "���ݿⷱæ��������", this.GetType().BaseType.FullName);

                return;
            }

            if ((newPayNumber < 0) || (returnDescription != ""))
            {
                PF.GoError(ErrorNumber.Unknow, returnDescription, this.GetType().BaseType.FullName);

                return;
            }

            //��Ǯ�ӿ��������
            string inputCharset = "";
            string pageUrl = "";
            string bgUrl = "";
            string version = "";
            string language = "";
            string signType = "";
            string merchantAcctId = "";

            string payerName = "";
            string payerContactType = "";
            string payerContact = "";
            string orderId = "";
            string orderAmount = "";
            string orderTime = "";
            string productName = "";

            string productNum = "";
            string productId = "";
            string productDesc = "";
            string ext1 = "";

            string ext2 = "";
            string payType = "";
            string bankId = "";
            string redoFlag = "";
            string pid = "";
            string signMsg = "";


            //�����������Կ
            ///���ִ�Сд.�����Ǯ��ϵ��ȡ
            string key = so["OnlinePay_99Bill_MD5Key"].Value.ToString();

            //�ַ���.�̶�ѡ��ֵ����Ϊ�ա�
            ///ֻ��ѡ��1��2��3.
            ///1����UTF-8; 2����GBK; 3����gb2312
            ///Ĭ��ֵΪ1
            inputCharset = "1";

            //����֧�������ҳ���ַ.��[bgUrl]����ͬʱΪ�ա������Ǿ��Ե�ַ��
            ///���[bgUrl]Ϊ�գ���Ǯ��֧�����Post��[pageUrl]��Ӧ�ĵ�ַ��
            ///���[bgUrl]��Ϊ�գ�����[bgUrl]ҳ��ָ����<redirecturl>��ַ��Ϊ�գ���ת��<redirecturl>��Ӧ�ĵ�ַ
            pageUrl = "";

            //����������֧������ĺ�̨��ַ.[bgUrl]��[pageUrl]����ͬʱΪ�ա������Ǿ��Ե�ַ��
            ///��Ǯͨ�����������ӵķ�ʽ�����׽�����͵�[bgUrl]��Ӧ��ҳ���ַ�����̻�������ɺ������<result>���Ϊ1��ҳ���ת��<redirecturl>��Ӧ�ĵ�ַ��
            ///�����Ǯδ���յ�<redirecturl>��Ӧ�ĵ�ַ����Ǯ����֧�����post��[pageUrl]��Ӧ��ҳ�档
            bgUrl = Shove._Web.Utility.GetUrl() + "/Home/Room/OnlinePay/99Bill/Receive.aspx";

            //���ذ汾.�̶�ֵ
            ///��Ǯ����ݰ汾�������ö�Ӧ�Ľӿڴ������
            ///������汾�Ź̶�Ϊv2.0
            version = "v2.0";

            //��������.�̶�ѡ��ֵ��
            ///ֻ��ѡ��1��2��3
            ///1�������ģ�2����Ӣ��
            ///Ĭ��ֵΪ1
            language = "1";

            //ǩ������.�̶�ֵ
            ///1����MD5ǩ��
            ///��ǰ�汾�̶�Ϊ1
            signType = "1";

            //����������˻���
            ///���¼��Ǯϵͳ��ȡ�û���ţ��û���ź��01��Ϊ����������˻��š�
            merchantAcctId = so["OnlinePay_99Bill_UserNumber"].Value.ToString();

            //֧��������
            ///��Ϊ���Ļ�Ӣ���ַ�
            payerName = _User.Name;

            //֧������ϵ��ʽ����.�̶�ѡ��ֵ
            ///ֻ��ѡ��1
            ///1����Email
            payerContactType = "1";

            //֧������ϵ��ʽ
            ///ֻ��ѡ��Email���ֻ���
            payerContact = "";

            //�̻�������
            ///����ĸ�����֡���[-][_]���
            orderId = newPayNumber.ToString();//�ڲ���ֵ���

            //�������
            ///�Է�Ϊ��λ����������������
            ///�ȷ�2������0.02Ԫ
            ///��Ʒ�ܽ��,�Է�Ϊ��λ������������ԪΪ��λ��.
            long total_fee = long.Parse((payMoney * 100).ToString());//!!!!!!!!!!!!!!!!!!!!!------ע�ⵥλ�Ƿ�----!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            orderAmount = total_fee.ToString();

            //�����ύʱ��
            ///14λ���֡���[4λ]��[2λ]��[2λ]ʱ[2λ]��[2λ]��[2λ]
            ///�磻20080101010101
            orderTime = DateTime.Now.ToString("yyyyMMddHHmmss");

            //��Ʒ����
            ///��Ϊ���Ļ�Ӣ���ַ�
            productName = "����Ԥ����";

            //��Ʒ����
            ///��Ϊ�գ��ǿ�ʱ����Ϊ����
            productNum = "1";

            //��Ʒ����
            ///��Ϊ�ַ���������
            productId = "200599";

            //��Ʒ����
            productDesc = "";

            //��չ�ֶ�1
            ///��֧��������ԭ�����ظ��̻�
            ///���ױ�ʶ(�û�ID+ͶעID+��ֵ��ʽ���)
            string attachInfo = Shove._Security.Encrypt.EncryptString(PF.GetCallCert(), _User.ID.ToString() + "|" + bankPay + "|" + buyID);
            ext1 = attachInfo;

            //��չ�ֶ�2
            ///��֧��������ԭ�����ظ��̻�
            ext2 = "";

            //֧����ʽ.�̶�ѡ��ֵ
            ///ֻ��ѡ��00��10��11��12��13��14
            ///00�����֧��������֧��ҳ����ʾ��Ǯ֧�ֵĸ���֧����ʽ���Ƽ�ʹ�ã�10�����п�֧��������֧��ҳ��ֻ��ʾ���п�֧����.11���绰����֧��������֧��ҳ��ֻ��ʾ�绰֧����.12����Ǯ�˻�֧��������֧��ҳ��ֻ��ʾ��Ǯ�˻�֧����.13������֧��������֧��ҳ��ֻ��ʾ����֧����ʽ��.14��B2B֧��������֧��ҳ��ֻ��ʾB2B֧��������Ҫ���Ǯ���뿪ͨ����ʹ�ã�
            payType = "00";

            //���д���
            ///ʵ��ֱ����ת������ҳ��ȥ֧��,ֻ��payType=10ʱ�������ò���
            ///�������μ� �ӿ��ĵ����д����б�
            bankId = "";

            if (bankPay != "KQ")
            {
                //֧����ʽ.�̶�ѡ��ֵ
                ///ֻ��ѡ��00��10��11��12��13��14
                ///00�����֧��������֧��ҳ����ʾ��Ǯ֧�ֵĸ���֧����ʽ���Ƽ�ʹ�ã�10�����п�֧��������֧��ҳ��ֻ��ʾ���п�֧����.11���绰����֧��������֧��ҳ��ֻ��ʾ�绰֧����.12����Ǯ�˻�֧��������֧��ҳ��ֻ��ʾ��Ǯ�˻�֧����.13������֧��������֧��ҳ��ֻ��ʾ����֧����ʽ��.14��B2B֧��������֧��ҳ��ֻ��ʾB2B֧��������Ҫ���Ǯ���뿪ͨ����ʹ�ã�
                payType = "10";

                //���д���
                ///ʵ��ֱ����ת������ҳ��ȥ֧��,ֻ��payType=10ʱ�������ò���
                ///�������μ� �ӿ��ĵ����д����б�
                bankId = bankPay;
            }

            //ͬһ������ֹ�ظ��ύ��־
            ///�̶�ѡ��ֵ�� 1��0
            ///1����ͬһ������ֻ�����ύ1�Σ�0��ʾͬһ��������û��֧���ɹ���ǰ���¿��ظ��ύ��Ρ�Ĭ��Ϊ0����ʵ�ﹺ�ﳵ�������̻�����0�������Ʒ���̻�����1
            redoFlag = "1";

            //��Ǯ�ĺ��������˻���
            ///��δ�Ϳ�Ǯǩ���������Э�飬����Ҫ��д������
            pid = "";


            #region ��֤�����Ƿ���ȫ
            if (string.IsNullOrEmpty(merchantAcctId) || string.IsNullOrEmpty(ext1) || string.IsNullOrEmpty(orderId))
            {
                Response.Write("<script type=\"text/javascript\">alert(\"��������ȫ���޷���ֵ��\"); window.close();</script>");

                return;
            }
            #endregion

            //���ɼ���ǩ����
            ///����ذ�������˳��͹�����ɼ��ܴ���
            String signMsgVal = "";
            signMsgVal = appendParam(signMsgVal, "inputCharset", inputCharset);
            signMsgVal = appendParam(signMsgVal, "pageUrl", pageUrl);
            signMsgVal = appendParam(signMsgVal, "bgUrl", bgUrl);
            signMsgVal = appendParam(signMsgVal, "version", version);
            signMsgVal = appendParam(signMsgVal, "language", language);
            signMsgVal = appendParam(signMsgVal, "signType", signType);
            signMsgVal = appendParam(signMsgVal, "merchantAcctId", merchantAcctId);
            signMsgVal = appendParam(signMsgVal, "payerName", payerName);
            signMsgVal = appendParam(signMsgVal, "payerContactType", payerContactType);
            signMsgVal = appendParam(signMsgVal, "payerContact", payerContact);
            signMsgVal = appendParam(signMsgVal, "orderId", orderId);
            signMsgVal = appendParam(signMsgVal, "orderAmount", orderAmount);
            signMsgVal = appendParam(signMsgVal, "orderTime", orderTime);
            signMsgVal = appendParam(signMsgVal, "productName", productName);
            signMsgVal = appendParam(signMsgVal, "productNum", productNum);
            signMsgVal = appendParam(signMsgVal, "productId", productId);
            signMsgVal = appendParam(signMsgVal, "productDesc", productDesc);
            signMsgVal = appendParam(signMsgVal, "ext1", ext1);
            signMsgVal = appendParam(signMsgVal, "ext2", ext2);
            signMsgVal = appendParam(signMsgVal, "payType", payType);
            signMsgVal = appendParam(signMsgVal, "bankId", bankId);
            signMsgVal = appendParam(signMsgVal, "redoFlag", redoFlag);
            signMsgVal = appendParam(signMsgVal, "pid", pid);
            signMsgVal = appendParam(signMsgVal, "key", key);

            //�����web.config�ļ��������˱��뷽ʽ������<globalization requestEncoding="utf-8" responseEncoding="utf-8"/>����δ����Ĭ��Ϊutf-8����
            //��ô��inputCharset��ȡֵӦ�������õı��뷽ʽ��һ�£�
            //ͬʱ��GetMD5()�����������ݵı��뷽ʽҲ������˱���һ�¡�
            signMsg = GetMD5(signMsgVal, "utf-8").ToUpper();



            //���ɵ��ýӿڵ�URL
            string requestURL = "";
            ///�������������ֵ��
            requestURL = appendParam(requestURL, "inputCharset", inputCharset);
            requestURL = appendParam(requestURL, "pageUrl", pageUrl);
            requestURL = appendParam(requestURL, "bgUrl", bgUrl);
            requestURL = appendParam(requestURL, "version", version);
            requestURL = appendParam(requestURL, "language", language);
            requestURL = appendParam(requestURL, "signType", signType);
            requestURL = appendParam(requestURL, "merchantAcctId", merchantAcctId);
            requestURL = appendParam(requestURL, "payerName", HttpUtility.UrlEncode(payerName));
            requestURL = appendParam(requestURL, "payerContactType", payerContactType);
            requestURL = appendParam(requestURL, "payerContact", payerContact);
            requestURL = appendParam(requestURL, "orderId", orderId);
            requestURL = appendParam(requestURL, "orderAmount", orderAmount);
            requestURL = appendParam(requestURL, "orderTime", orderTime);
            requestURL = appendParam(requestURL, "productName", HttpUtility.UrlEncode(productName));
            requestURL = appendParam(requestURL, "productNum", productNum);
            requestURL = appendParam(requestURL, "productId", productId);
            requestURL = appendParam(requestURL, "productDesc", productDesc);
            requestURL = appendParam(requestURL, "ext1", ext1);
            requestURL = appendParam(requestURL, "ext2", ext2);
            requestURL = appendParam(requestURL, "payType", payType);
            requestURL = appendParam(requestURL, "bankId", bankId);
            requestURL = appendParam(requestURL, "redoFlag", redoFlag);
            requestURL = appendParam(requestURL, "pid", pid);

            requestURL = "https://www.99bill.com/gateway/recvMerchantInfoAction.htm?" + requestURL + "&signMsg=" + signMsg;
            new Log("OnlinePay").Write("��Ǯ��ֵ����" + requestURL);

            this.Response.Write("<script language='javascript'>window.top.location.href='" + requestURL + "'</script>");

        }
    }


    //=====================================================================================
    //���ܺ�����������ֵ��Ϊ�յĲ�������ַ���
    string appendParam(string returnStr, string paramId, string paramValue)
    {
        if (returnStr != "")
        {
            if (paramValue != "")
            {

                returnStr += "&" + paramId + "=" + paramValue;
            }
        }
        else
        {
            if (paramValue != "")
            {
                returnStr = paramId + "=" + paramValue;
            }
        }

        return returnStr;
    }
    //���ܺ�����������ֵ��Ϊ�յĲ�������ַ���������
    //���ܺ��������ַ������б����ʽת����������MD5���ܣ�Ȼ�󷵻ء���ʼ
    private static string GetMD5(string dataStr, string codeType)
    {
        System.Security.Cryptography.MD5 md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
        byte[] t = md5.ComputeHash(System.Text.Encoding.GetEncoding(codeType).GetBytes(dataStr));
        System.Text.StringBuilder sb = new System.Text.StringBuilder(32);
        for (int i = 0; i < t.Length; i++)
        {
            sb.Append(t[i].ToString("x").PadLeft(2, '0'));
        }
        return sb.ToString();
    }
    //���ܺ��������ַ������б����ʽת����������MD5���ܣ�Ȼ�󷵻ء�����
}
