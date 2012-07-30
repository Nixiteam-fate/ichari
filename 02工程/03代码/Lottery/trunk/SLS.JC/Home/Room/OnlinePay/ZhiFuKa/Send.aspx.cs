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
using System.Xml;

public partial class Home_Room_OnlinePay_ZhiFuKa_Send : RoomPageBase
{

    private string customerid = "";                                                                 // �̻��ţ��滻Ϊ���ѵ��̻��ţ�

    private string sdcustomno = "";                                                                 // �̻�ϵͳ���ɵĶ�����

    double ordermoney = 0;                                                                          //��ֵ���

    string cardno = "";                                                                          //��ֵ����(֧�����������п�)

    string faceno = "";                                                                       //����ֵ���

    string cardnum = "";                                                                            //�㿨����

    string cardpass = "";                                                                           //�㿨����

    private string remarks = "3gcpw";                                                              // �̻���ע

    private string mark = "";                                                                       // �̻��Զ��壬ԭ������.

    private string noticeurl = Shove._Web.Utility.GetUrl() + "/Home/Room/OnlinePay/ZhiFuKa/Receive.aspx"; // ֪ͨ�̻�֧��������̻�ϵͳ��ַ

    private string key = "";                                                                        // �̻�KEY���滻Ϊ���ѵ�KEY��

    private string paygateurl = "http://202.75.218.94/gateway/zfgateway.asp";                       // ֧������URL

    private string state = "0000";
    private string errcode = "0000";
    private string errmsg = "0000";


    SystemOptions so = new SystemOptions();

    protected void Page_Load(object sender, EventArgs e)
    {

        bool OnlinePay_ZhiFuKa_Status_ON = so["OnlinePay_ZhiFuKa_Status_ON"].ToBoolean(false);

        ordermoney = Shove._Convert.StrToDouble(Shove._Web.Utility.GetRequest("ordermoney"), 0);
        cardno = Shove._Web.Utility.GetRequest("cardno");
        faceno = Shove._Web.Utility.GetRequest("faceno");
        cardnum = Shove._Web.Utility.GetRequest("cardnum");
        cardpass = Shove._Web.Utility.GetRequest("cardpass");

        string errorMessage = "";


        if (!IsPostBack)
        {

            //�����̻���
            customerid = so["OnlinePay_ZhiFuKa_UserNumber"].Value.ToString();

            //�����̻�key
            key = so["OnlinePay_ZhiFuKa_MD5Key"].Value.ToString();

            //���ױ�ʶ(�û�ID+ͶעID) ����
            mark = Shove._Security.Encrypt.EncryptString(PF.GetCallCert(), _User.ID.ToString() + "|" + Shove._Web.Utility.GetRequest("BuyID"));

            long NewPayNumber = -1;
            string ReturnDescription = "";

            try
            {

                //�����ڲ���ֵ���
                if (DAL.Procedures.P_GetNewPayNumber(_Site.ID, _User.ID, "51ZFK_"+cardno,ordermoney , 0, ref NewPayNumber, ref ReturnDescription) < 0)
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
                sdcustomno = NewPayNumber.ToString();


                #region ��֤�����Ƿ���ȫ

                if (string.IsNullOrEmpty(cardno) || string.IsNullOrEmpty(remarks) || string.IsNullOrEmpty(customerid) || string.IsNullOrEmpty(sdcustomno) || string.IsNullOrEmpty(mark) || string.IsNullOrEmpty(noticeurl) || string.IsNullOrEmpty(key) || string.IsNullOrEmpty(cardnum) || string.IsNullOrEmpty(cardpass) || string.IsNullOrEmpty(faceno))
                {
                    errorMessage ="��������ȫ���޷���ֵ��";

                    Response.Write("<script type=\"text/javascript\"> window.top.location.href='" + Shove._Web.Utility.GetUrl() + "/Home/Room/OnlinePay/Fail.aspx?errMsg="+errorMessage+"';</script>");
                  
                    return;
                }

                #endregion

                string url = "";
                if (!GetPayUrl(out url))
                {
                    errorMessage =url;

                    Response.Write("<script type=\"text/javascript\"> window.top.location.href='" + Shove._Web.Utility.GetUrl() + "/Home/Room/OnlinePay/Fail.aspx?errMsg=" + errorMessage + "';</script>");
                 

                    return;
                }
                else
                {

                    GetResponseContents(GetHtml(url, "GB2312", 200));

                    if (state == "1")
                    {

                        new Log("OnlinePay").Write("����֧������ֵ�����Ѿ��ύ���ȴ����֪ͨ��֧���ţ�" + sdcustomno);


                        errorMessage = "����֧������ֵ�����Ѿ��ύ���ȴ����֪ͨ��֧���ţ�" + sdcustomno;

                        Response.Write("<script type=\"text/javascript\"> window.top.location.href='" + Shove._Web.Utility.GetUrl() + "/Home/Room/OnlinePay/OK.aspx?errMsg=" + errorMessage + "';</script>");

                        return;
                    }



                    new Log("OnlinePay").Write("����֧������ֵ�����ύʧ�ܣ�������code=" + errcode + "�� msg=" + errmsg + "�� ֧���ţ�" + sdcustomno);

                    errorMessage = "����֧������ֵ�����ύʧ�ܣ�������code=" + errcode + "�� msg=" + errmsg + "�� ֧���ţ�" + sdcustomno + "��";

                    Response.Write("<script type=\"text/javascript\"> window.top.location.href='" + Shove._Web.Utility.GetUrl() + "/Home/Room/OnlinePay/Fail.aspx?errMsg=" + errorMessage + "';</script>");
                 
                    return;

                }
            }
            catch (Exception ex)
            {

                new Log("OnlinePay").Write(ex.Message);

                PF.GoError(ErrorNumber.Unknow, ReturnDescription, this.GetType().BaseType.FullName);

                return;

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

            url = paygateurl + "?customerid=" + customerid + "&sdcustomno=" + sdcustomno + "&ordermoney=" + ordermoney + "&cardno=" + cardno + "&faceno=" + faceno + "&cardnum="
                + cardnum + "&cardpass=" + cardpass + "&noticeurl=" + noticeurl + "&remarks=" + remarks
                + "&mark=" + mark + "&sign=" + sign;

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

        string sign_text = "customerid=" + customerid + "&sdcustomno=" + sdcustomno + "&noticeurl=" + noticeurl
            + "&mark=" + mark + "&key=" + key;

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

    // ��ȡ Url ���ص� Html ��
    public string GetHtml(string Url, string encodeing, int TimeoutSeconds)
    {
        HttpWebRequest request = null;
        HttpWebResponse response = null;
        StreamReader reader = null;
        try
        {
            request = (HttpWebRequest)WebRequest.Create(Url);
            request.UserAgent = "www.svnhost.cn";
            if (TimeoutSeconds > 0)
            {
                request.Timeout = 1000 * TimeoutSeconds;
            }
            request.AllowAutoRedirect = false;

            response = (HttpWebResponse)request.GetResponse();

            if (response.StatusCode == HttpStatusCode.OK)
            {
                reader = new StreamReader(response.GetResponseStream(), System.Text.Encoding.GetEncoding(encodeing));
                string html = reader.ReadToEnd();
                return html;
            }
            else
            {
                return "";
            }
        }
        catch (SystemException)
        {
            return "";
        }
    }

    //��ȡ���������б�
    private void GetResponseContents(string messageXml)
    {
        System.Xml.XmlDocument XmlDoc = new XmlDocument();
        System.Xml.XmlNodeList nodes = null;

        //�Ȼ�ȡ�����̵��������
        try
        {
            XmlDoc.Load(new StringReader(messageXml));
            nodes = XmlDoc.GetElementsByTagName("item");
        }
        catch { }

        if (nodes != null && nodes.Count > 0)
        {
            foreach (XmlNode item in nodes)
            {
                if (item.Attributes["name"] != null)
                {
                    switch (item.Attributes["name"].Value)
                    {
                        case "state":
                            state = item.Attributes["value"].Value;
                            break;
                        case "errcode":
                            errcode = item.Attributes["value"].Value;
                            break;
                        case "errmsg":
                            errmsg = item.Attributes["value"].Value;
                            break;
                        case "mark":
                            mark = item.Attributes["value"].Value;
                            break;

                    }
                }

            }

        }

    }

    #endregion

}
