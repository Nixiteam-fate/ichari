<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChallengeRanking.aspx.cs" Inherits="Challenge_ChallengeRanking" %>
<%@ Register Src="../Home/Room/UserControls/WebHead.ascx" TagName="WebHead" TagPrefix="uc1" %>
<%@ Register Src="../Home/Room/UserControls/WebFoot.ascx" TagName="WebFoot" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>��̨_���а�</title>
 <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
 <link rel="stylesheet" type="text/css" href="Style/ring.css"/>
</head>
<body>
<form id="form1" runat="server">
<uc1:WebHead ID="WebHead1" runat="server" />
<div class="wrap"> 
    <!--��̨main-->
    <div class="main_ring">
        <div class="explain_nav">
            <ul>
                <li class="w88"><a href="Default.aspx">���뾺��</a></li>
                <li class="w88"><a href="ChallengeSchemeList.aspx">�����б�</a></li>
                <li class="curr"><a href="ChallengeRanking.aspx">���а�</a></li>
                <li class="w88"><a href="ChallengeHelp.aspx">�淨����</a></li>
            </ul>
        </div>
        <div class="explain_cont">
            <h1 class="explain_ico"></h1>
            <dl>
                1���û�����ѡ��2����ѡ����Ͷע���û�ƾΨһ��ʵ����ÿ������ύ1�����·�����<br />
                2���û����뾺��ǰ������ֻ����룬Ϊ�ջ򲻾�Ψһ�Ծ������ύ���·�����<br />
                3�����̸���������ĵľ���ʤƽ���淨�趨����̨���°��ս��С�<br />
                4��ÿ�»�������ǰ15�����û��������վ�ṩ���ֽ�����&nbsp;&nbsp;<span><a href="/Challenge/ChallengeHelp.aspx">[�����淨]</a></span><br />
                <span class="c_999">��ע���û���¼��ɽ����κ���̨����ҳ��Ͷעѡ������޸ģ���ͨ�����Ͷע���ܣ�������ʵ��Ͷע����</span>
                <div style="width:100%; height:5px"></div>    
            </dl>
            <div class="cl"></div>
        </div>
        <!--���а�-->
        <div class="ring_topnav">
            <ul id="myTab0">
                <li class="active" onclick="nTabs(this,0);">�����а�</li>
				<li style="display:none" class="normal" onclick="nTabs(this,1);">��60���</li>				
            </ul>
            <div class="fansearch"><span>����������</span>
                
                <asp:TextBox runat="server" ID="tbUserName" Text="�����û���" Width="130px" Height="17px" ForeColor="Gray" onfocus="if(this.value=='�����û���')this.value='';" onblur="if(this.value=='')this.value='�����û���';"></asp:TextBox>
                <span class="dtd" style="text-align:left">
                    <asp:Button ID="btnFile" class="btn_ringso"  name="dropMonth" runat="server" Text="�� ѯ" onclick="btnFile_Click" />                
                </span>
            </div>
        </div>
        <div class="TabContent">
			<div id="myTab0_Content0">
                <div class="ringtab" style="margin-top:0;">
                    <table class="table_c1" cellspacing="1" cellpadding="0" width="100%" align="center" border="0">
                        <tbody>
                            <tr class="tre">
                                <td width="5%">����</td>
                                <td width="10%">�û���</td>
                                <td width="9%">Ͷע����</td>
                                <td width="9%">���г���</td>
                                <td width="10%">������</td>
                                <td width="10%">2��1�н�</td>
                                <td width="10%">����</td>
                                <td width="8%">�������</td>
                                <td width="10%">��ʷս��</td>
                            </tr>
                            <asp:Repeater runat="server" ID ="gRanking">
                                <ItemTemplate>
                                               <%
                   if (state)
                   { 
                    %>
                          <tr class="sk1">    
                                         <%
                                             state = false;
                   }
                   else { 
                        %>
                            
                        <tr class="sk2" >    
                        
                        <%
                            state = true;
                   }
                        %>   
                                        <td><%# DataBinder.Eval(Container.DataItem, "Ranking")%></td>
                                        <td><a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "ID")%>','��ʷս��',470,660)" class="dl">
                                            <%# DataBinder.Eval(Container.DataItem, "Name")%></a>
                                        </td>
                                        <td><%# DataBinder.Eval(Container.DataItem, "BetCount")%></td>
                                        <td><%# DataBinder.Eval(Container.DataItem, "WinCount")%></td>
                                        <td><%# DataBinder.Eval(Container.DataItem, "Scale")%>%</td>
                                        <td><%# DataBinder.Eval(Container.DataItem, "sumMoney")%></td>
                                        <td><%# DataBinder.Eval(Container.DataItem, "Score")%></td>
                                        <td><span class="bred2">��<%# Shove._Convert.StrToDouble(DataBinder.Eval(Container.DataItem, "TotalWinMoney").ToString(),0.00).ToString("F2")%></span></td>
                                        <td><a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "ID")%>','��ʷս��',470,660)" class="dl">�鿴</a></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                           
                        </tbody>
                    </table>
                </div>
            </div>
            <!---->
        </div>
    </div>
    <!--��̨sider-->
    <div class="side_ring"> 
        <!--��̨����-->
        <div class="notice_ring">
            <div class="side_nav">
                <h2>��̨����</h2>
            </div>
            <div class="notice_ring_list">
                <ul>
                    <%=newsHTML %>
                </ul>
            </div>
        </div>
            <!--�ҵ���̨-->
            <asp:Panel ID="pUserDetails" runat="server">
                <div style="height:10px;"></div>
                <div class="notice_ring">
                    <div class="side_nav">
                        <h2>
                            �ҵ���̨</h2>
                    </div>
                    <div class="eyed_boy_cont">
                        <table width="100%" border="0" align="center" class="game_hot">
                            <tbody>
                                <asp:Repeater runat="server" ID="gUserDetails">
                                    <ItemTemplate>
                                        <table width="100%" cellspacing="4" border="0" height="115">
                                            <tr style="height:25px;">
                                                <td width="100%" colspan="2">
                                                    &nbsp;&nbsp;<img src="images/hot_men.gif" width="16" height="20" align="absmiddle"><a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem,"UserId")%>','�ҵ���ʷ��¼',470,600)"><%# DataBinder.Eval(Container.DataItem,"Name")%></a>
                                                </td>
                                            </tr>
                                            <tr style="height:25px;">
                                                <td width="100px">
                                                    &nbsp;&nbsp;Ͷע���Σ�
                                                    <%# DataBinder.Eval(Container.DataItem, "BetCount")%>
                                                </td>
                                                <td>
                                                    ���г��Σ�
                                                    <%# DataBinder.Eval(Container.DataItem, "WinCount")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100px">
                                                    &nbsp;&nbsp;�ҵĻ��֣�
                                                    <%# DataBinder.Eval(Container.DataItem, "Score")%>
                                                </td>
                                                <td >
                                                    �ۼƻ񽱣�<font style="color: Red">��<%# Shove._Convert.StrToDouble(DataBinder.Eval(Container.DataItem, "TotalWinMoney").ToString(),0.00).ToString("F2")%></font>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </asp:Panel>
        <!--���ְ�-->
        <div class="side_tab">
            <div class="sider_tabnav">
                <h2>��10����ְ�</h2>
                <dl>
                    <a href="ChallengeRanking.aspx">����&gt;&gt;</a>
                </dl>
            </div>
            <div class="side_tabcont">
                <table class="table_c2" width="100%" border="0" cellpadding="0" cellspacing="1">
                    <tbody>
                        <tr class="new_t2">
                            <td>����</td>
                            <td>�û���</td>
                            <td>����</td>
                        </tr>
                        <asp:Repeater ID="gSchemesToDay" runat="server">
                            <ItemTemplate>
                                <%
                                    if (!state)
                                    {
                                     %>
                                <tr>
                                    <td height="22" bgcolor="#F2F2F2"><%# DataBinder.Eval(Container.DataItem, "Ranking")%></td>
                                    <td bgcolor="#F2F2F2"><a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>','�����ʷ��¼',470,600)"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></td>
                                    <td bgcolor="#FFFFFF" class="c_red fb"><%# DataBinder.Eval(Container.DataItem, "Score")%></td>
                                </tr>
                                <%
                                    state = true;
                                    }
                                    else
                                    {
                                         %>
                                    <tr>
                                        <td height="22" bgcolor="#FFFFFF"><%# DataBinder.Eval(Container.DataItem, "Ranking")%></td>
                                        <td bgcolor="#FFFFFF"><a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>','�����ʷ��¼',470,600)"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></td>
                                        <td bgcolor="#FFFFFF" class="c_red fb"><%# DataBinder.Eval(Container.DataItem, "Score")%></td>
                                    </tr>
            
                                         
                                         <% state=false;} %>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
        <!--���ְ�-->
        <div class="side_tab">
            <div class="sider_tabnav">
                <h2>�����а�</h2>
<dl>
                    <a href="ChallengeRanking.aspx">����&gt;&gt;</a>
                </dl>
            </div>
            <div class="side_tabcont">
                <table class="table_c2" width="100%" border="0" cellpadding="0" cellspacing="1">
                    <tbody>
                        <tr class="new_t2">
                            <td>����</td>
                            <td>�û���</td>
                            <td>ע��</td>
                            <td>����</td>
                        </tr>
                        <asp:Repeater runat="server" ID="gSchemesToMonth">
                            <ItemTemplate>
                            <%
                                    if (!state)
                                    {
                                     %>
                                <tr>
                                    <td height="22" bgcolor="#F2F2F2"><%# DataBinder.Eval(Container.DataItem, "Ranking")%></td>
                                    <td bgcolor="#F2F2F2"><a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>','�����ʷ��¼',470,600)"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></td>
                                    <td bgcolor="#F2F2F2"><%# DataBinder.Eval(Container.DataItem, "Counts")%></td>
                                    <td bgcolor="#FFFFFF" class="c_red fb"><%# DataBinder.Eval(Container.DataItem, "Score")%></td>
                                </tr>
                                 <%
                                    state = true;
                                    }
                                    else
                                    {
                                         %>
                                        <tr>
                                    <td height="22" bgcolor="#FFFFFF"><%# DataBinder.Eval(Container.DataItem, "Ranking")%></td>
                                    <td bgcolor="#FFFFFF"><a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>','�����ʷ��¼',470,600)"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></td>
                                    <td bgcolor="#FFFFFF"><%# DataBinder.Eval(Container.DataItem, "Counts")%></td>
                                    <td bgcolor="#FFFFFF" class="c_red fb"><%# DataBinder.Eval(Container.DataItem, "Score")%></td>
                                </tr> 
                                          <% state=false;} %>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
        <!--���ְ�-->
        <div class="side_tab">
            <div class="sider_tabnav">
                <h2>�ܻ��ְ񣨽�60�죩</h2>
				<dl>
                    <a href="ChallengeRanking.aspx">����&gt;&gt;</a>
                </dl>
            </div>
            <div class="side_tabcont">
                <table class="table_c2" width="100%" border="0" cellpadding="0" cellspacing="1">
                    <tbody>
                        <tr class="new_t2">
                            <td>����</td>
                            <td>�û���</td>
                            <td>����</td>
                        </tr>
                        <asp:Repeater runat="server" ID="gSchemesToMain">
                            <ItemTemplate>
                            <%
                                    if (!state)
                                    {
                                     %>
                                <tr>
                                    <td height="22" bgcolor="#F2F2F2"><%# DataBinder.Eval(Container.DataItem, "Ranking")%></td>
                                    <td bgcolor="#F2F2F2"><a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>','�����ʷ��¼',470,600)"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></td>
                                    <td bgcolor="#FFFFFF" class="c_red fb"><%# DataBinder.Eval(Container.DataItem, "Score")%></td>
                                </tr>
                                 <%
                                    state = true;
                                    }
                                    else
                                    {
                                         %>
                                         
                                <tr>
                                    <td height="22" bgcolor="#FFFFFF"><%# DataBinder.Eval(Container.DataItem, "Ranking")%></td>
                                    <td bgcolor="#FFFFFF"><a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>','�����ʷ��¼',470,600)"><%# DataBinder.Eval(Container.DataItem, "Name")%></a></td>
                                    <td bgcolor="#FFFFFF" class="c_red fb"><%# DataBinder.Eval(Container.DataItem, "Score")%></td>
                                </tr>
                                
                                          <% state=false;} %>
                            </ItemTemplate>                            
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
        <!--��̨����-->
        <div class="eyed_boy">
                <div class="side_nav">
                    <h2>
                        ��̨����</h2>
                </div>
                <div class="eyed_boy_cont">
                    <table border="0" align="center" class="game_hot">
                        
                        <asp:Repeater runat="server" ID="gBetHot">
                            <ItemTemplate>
                                <%
                                    if (indexs == 0)
                                    { 
                                
                                %>
                                <tr><td colspan="4"><div style="height:8px"></div></td></tr>
                                <tr>
                                    <%
                                        }
                            indexs++;                            
                                    %>
                                    <td>
                                        <table width="125px" border="0">
                                            <tr>
                                                <td width="20%">
                                                    &nbsp;<img src="images/hot_men.gif" width="16" height="20" align="absmiddle"><a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem,"UserId")%>','�ҵ���ʷ��¼',470,600)"><%# DataBinder.Eval(Container.DataItem,"Name")%></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="30%">
                                                    &nbsp;Ͷע���Σ�
                                                    <%# DataBinder.Eval(Container.DataItem, "BetCount")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="30%">
                                                    &nbsp;���г��Σ�
                                                    <%# DataBinder.Eval(Container.DataItem, "WinCount")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="30%">
                                                    &nbsp;�ۼƻ񽱣�<font style="color: Red">��<%# Shove._Convert.StrToDouble(DataBinder.Eval(Container.DataItem, "TotalWinMoney").ToString(),0.00).ToString("F2")%></font>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <%
                                        if (indexs == 2)
                                        {
                                            indexs = 0;                                                           
                                    %>                   
                                </tr>                                
                                <%
                                    }
                                %>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
         <!--���µĽ�����Ϣ-->
        <div class="side_tab">
            <div class="sider_tabnav">
                <h2>���µĽ�����Ϣ</h2>
				<dl>
                    <a href="/Challenge/ChallengeHelp.aspx">����&gt;&gt;</a>
                </dl>
            </div>
         	<div class="side_tabcont">
                <table class="table_c2" width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#DBDBDB">
                  <tbody><tr class="new_t2">
                    <td>����</td>
                    <td>����</td>
                  </tr>
                  
                  <tr>
                    <td height="22">��1��</td>
                    <td class="c_org fb">1200Ԫ</td>
                  </tr>
                  
                  <tr>
                    <td height="22">��2��~ ��3��</td>
                    <td class="c_org fb">600Ԫ</td>
                  </tr>
                  
                  <tr>
                    <td height="22">��4��~ ��8��</td>
                    <td class="c_org fb">300Ԫ</td>
                  </tr>
                  
                  <tr>
                    <td height="22">��9��~ ��15��</td>
                    <td class="c_org fb">50Ԫ</td>
                  </tr>
                  
                </tbody></table>
            </div>
        </div>
    </div>
<div class="cl"></div>
</div>
<uc2:WebFoot ID="WebFoot1" runat="server" />
<script type="text/javascript" src="JScript/public.js"></script>
</form>
</body>
</html>