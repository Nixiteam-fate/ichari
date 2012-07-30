<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Challenge_Default" EnableViewState="false" %>

<%@ Register Src="../Home/Room/UserControls/WebHead.ascx" TagName="WebHead" TagPrefix="uc1" %>
<%@ Register Src="../Home/Room/UserControls/WebFoot.ascx" TagName="WebFoot" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>������̨</title>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="stylesheet" type="text/css" href="Style/ring.css" />
    <script type="text/javascript" src="/Scripts/jquery-1.7.2.min.js"></script>
</head>
<body class="gybg">
    <form id="buy_form" runat="server" ajax="Buy_Challenge_Handler.ashx">
    <uc1:WebHead ID="WebHead1" runat="server" />
    <div class="wrap">
        <!--��̨main-->
        <div class="main_ring">
            <div class="explain_nav">
                <ul>
                    <li class="curr"><a href="Default.aspx">���뾺��</a></li>
                    <li class="w88"><a href="ChallengeSchemeList.aspx">�����б�</a></li>
                    <li class="w88"><a href="ChallengeRanking.aspx">���а�</a></li>
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
                <div class="cl">
                </div>
            </div>
            <!--���¶���-->
            <div class="ringtab">
                <div class="ringtab_nav">
                    <h2>���¶���(��������ʤƽ��)��<span class="f12 fn c_999">��ֹʱ�䣺��ǰ15����</span></h2>
                </div>
                <div class="ringtab_cont">
                    <table class="table_t1" cellspacing="1" cellpadding="0" width="738" align="center"
                        border="0">
                        <tbody>
                            <tr class="tre">
                                <td width="59">
                                    ���
                                </td>
                                <td width="86">
                                    ����
                                </td>
                                <td width="80">
                                    ����ʱ��
                                </td>
                                <td>
                                    ����
                                </td>
                                <td>
                                    ����
                                </td>
                                <td>
                                    �Ͷ�
                                </td>
                                <td colspan="4">
                                    <select id="op_col">
                                        <option value="99��ƽ��">99��ƽ��ŷָ</option>
                                        <option value="����ϣ��">����ϣ��</option>
                                        <option value="����">����</option>
                                        <option value="Bet365">Bet365</option>
                                        <option value="���Ų�Ʊ">���Ų�Ʊ</option>
                                    </select>
                                </td>
                                <td width="60">
                                    ʤ
                                </td>
                                <td width="60">
                                    ƽ
                                </td>
                                <td width="60">
                                    ��
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table_c1"  id="table_vs" name="table_c1" cellspacing="1" cellpadding="0" width="737"
                        align="center" border="0">
                            <asp:Repeater ID="gPassRate" runat="server">
                                <ItemTemplate>
                                    <%
                                        if (state_s)
                                        { 
                                    %>
                                    <tr class="sk1" id="vs<%# DataBinder.Eval(Container.DataItem, "MatchID")%>">
                                        <%
                                            state_s = false;
                                }
                                else
                                {
                                        %>
                                        <tr class="sk1" id="vs<%# DataBinder.Eval(Container.DataItem, "MatchID")%>">
                                            <%
                                                state_s = true;
                                }
                                            %>
                                            <td width="59">
                                                <%# DataBinder.Eval(Container.DataItem, "MatchNumber")%>
                                            </td>
                                            <td width="78" class="team1" style="color: White;" bgcolor="<%# DataBinder.Eval(Container.DataItem, "GameColor")%>">
                                                <%# DataBinder.Eval(Container.DataItem, "Game")%>
                                            </td>
                                            <td width="80">
                                                <span class="o11">
                                                    <%# DataBinder.Eval(Container.DataItem, "MatchDate", "{0:MM-dd hh:mm}")%></span>
                                            </td>
                                            
                                            
                                            <td width="55">
                                                <%# DataBinder.Eval(Container.DataItem, "MainTeam")%>
                                            </td>
                                            <td width="20">
                                                <%# DataBinder.Eval(Container.DataItem, "MainLoseball")%>
                                            </td>
                                            <td width="55">
                                                <%# DataBinder.Eval(Container.DataItem, "GuestTeam")%>
                                            </td>
                                            
                                            <td class="odds" width="36" style="background-color: #edfce9">
                                                <%# DataBinder.Eval(Container.DataItem, "EuropeSSP")%>
                                            </td>
                                            <td class="odds" width="36" style="background-color: #edfce9">
                                                <%# DataBinder.Eval(Container.DataItem, "EuropePSP")%>
                                            </td>
                                            <td class="odds" width="36" style="background-color: #edfce9">
                                                <%# DataBinder.Eval(Container.DataItem, "EuropeFSP")%>
                                            </td>
                                            <td width="57">
                                                <a href="http://hbty.shovesoft.com/zc/sls_MatchReportLastMatch.aspx?MatchID=<%# DataBinder.Eval(Container.DataItem, "MatchID")%>" target="_blank">��</a> 
                                                <a href="http://hbty.shovesoft.com/zc/sls_MatchReportLastMatch.aspx?MatchID=<%# DataBinder.Eval(Container.DataItem, "MatchID")%>" target="_blank">��</a> 
                                                <a href="http://hbty.shovesoft.com/zc/sls_MatchReportLastMatch.aspx?MatchID=<%# DataBinder.Eval(Container.DataItem, "MatchID")%>" target="_blank">ŷ</a>
                                            </td>
                                            <td name="tds" class="sp_bg" onclick="CheckedBg(this,'vs<%# DataBinder.Eval(Container.DataItem, "MatchID")%>')"
                                                width="60" title="��ʤ" style="cursor: pointer;">
                                                <input type="checkbox" rid="1" name="cb" id="<%# DataBinder.Eval(Container.DataItem, "Win","{0:F2}")%>"
                                                    sid="<%# DataBinder.Eval(Container.DataItem, "MatchID")%>" />
                                                <%# DataBinder.Eval(Container.DataItem, "Win","{0:F2}")%>
                                            </td>
                                            <td name="tds" class="sp_bg" onclick="CheckedBg(this,'vs<%# DataBinder.Eval(Container.DataItem, "MatchID")%>')"
                                                width="60" title="ƽ��" style="cursor: pointer;">
                                                <input type="checkbox" rid="2" name="cb" id="<%# DataBinder.Eval(Container.DataItem, "Flat", "{0:F2}")%>"
                                                    sid="<%# DataBinder.Eval(Container.DataItem, "MatchID")%>" />
                                                <%# DataBinder.Eval(Container.DataItem, "Flat", "{0:F2}")%>
                                            </td>
                                            <td name="tds" class="sp_bg" onclick="CheckedBg(this,'vs<%# DataBinder.Eval(Container.DataItem, "MatchID")%>')"
                                                width="60" title="��ʤ" style="cursor: pointer;">
                                                <input type="checkbox" rid="3" name="cb" id="<%# DataBinder.Eval(Container.DataItem, "Lose", "{0:F2}")%>"
                                                    sid="<%# DataBinder.Eval(Container.DataItem, "MatchID")%>" />
                                                <%# DataBinder.Eval(Container.DataItem, "Lose", "{0:F2}")%>
                                            </td>
                                        </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                    </table>
                    <div class="cl">
                    </div>
                    
            
                    <div class="btn_bar">
                        <dl class="fl lh24">
                            ���ط�ʽ��<span class="fb c_org">2��1</span>��
                            ��ѡ���� <span id="counts" class="fb c_org">0</span> 
                            ������<span id="betCount" class="fb c_org">0</span> ע��
                            <span id="betMoney" style="display:none"> (����Ԥ�⣺<b><span style="color:Red" id="GuessMoney">0</span></b>)</span>
                        </dl>
                         <span style="float: right; margin-top:-16px">
                            <input type="button" value="���淽��" class="btn_ring2" onclick="dgBtnSubmit('2')"
                                 onmouseover="this.style.cursor='pointer';"/>
                            <input name="" type="button" value="���ѡ��" class="btn_ring2" onclick="clearSelect();"
                                onmouseover="this.style.cursor='pointer'">
                            <input name="input" type="button" value="ȷ���ύ" class="btn_ring2" onclick="dgBtnSubmit('1')"
                                onmouseover="this.style.cursor='pointer';">
                        </span>
                    </div>
                </div>
            </div>
            <!--��̨���·���-->
            <div class="ringtab">
                <div class="ringtab_nav">
                    <h2>
                        ��̨���·���</h2>
                    <dl>
                        <a href="ChallengeSchemeList.aspx">����&gt;&gt;</a>
                    </dl>
                </div>
                <div class="ringtab_cont">
                    <table class="table_c1" cellspacing="1" cellpadding="0" width="100%" align="center"
                        border="0">
                        <tbody>
                            <tr class="tre">
                                <td width="5%">
                                    ��
                                </td>
                                <td width="16%">
                                    �û���
                                </td>
                                <td width="13%">
                                    ѡ�񳡴�
                                </td>
                                <td>
                                    ��������
                                </td>
                                <td width="13%">
                                    ���ط�ʽ
                                </td>
                                <td width="10%">
                                    ����
                                </td>
                            </tr>
                            <asp:DataList ID="gNewBetContent" runat="server" Width="735px" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <%
                                        if (state_s)
                                        { 
                                    %>
                                    <tr class="sk1" align="center">
                                        <%
                                            state_s = false;
                   }
                   else
                   { 
                                        %>
                                        <tr class="sk2" align="center">
                                            <%
                                                state_s = true;
                   }
                                            %>
                                            <td width="5%">
                                                <%# DataBinder.Eval(Container.DataItem, "Ranking")%>
                                            </td>
                                            <td width="16%">
                                                <%# DataBinder.Eval(Container.DataItem, "Name")%>
                                            </td>
                                            <td width="13%">
                                                <%# DataBinder.Eval(Container.DataItem, "BetCount")%>
                                            </td>
                                            <td>
                                                <%# DataBinder.Eval(Container.DataItem, "LotteryNumber")%>
                                            </td>
                                            <td width="13%">
                                                <%# DataBinder.Eval(Container.DataItem, "BetWay")%>
                                            </td>
                                            <td width="10%">
                                                <a href="javascript:showWinOpen('ChallengeSchemes.aspx?SchemesID=<%# DataBinder.Eval(Container.DataItem, "ID")%>','��������',230,600)">
                                                    �鿴</a>
                                            </td>
                                        </tr>
                                </ItemTemplate>
                            </asp:DataList>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--��̨������������Ͷע-->
            <div class="ringtab">
                <div class="ringtab_nav">
                    <h2>
                        ��̨������������Ͷע</h2>
                </div>
                <div class="ringtab_cont">
                    <table class="foyt" cellspacing="1" cellpadding="0" width="100%" align="center" border="0">
                        <tbody>
                            <tr class="tre">
                                <td width="10%">
                                    ���
                                </td>
                                <td width="10%">
                                    ����
                                </td>
                                <td width="12%">
                                    ����
                                </td>
                                <td width="10%">
                                    ����
                                </td>
                                <td width="12%">
                                    �Ͷ�
                                </td>
                                <td width="10%">
                                    ѡ��
                                </td>
                                <td>
                                    ����
                                </td>
                            </tr>
                            <asp:Repeater runat="server" ID="gHotBet">
                                <ItemTemplate>
                                    <%
                                        if (state_s)
                                        { 
                                    %>
                                    <tr class="sk1">
                                        <%
                                            state_s = false;
                   }
                   else
                   { 
                                        %>
                                        <tr class="sk2">
                                            <%
                                                state_s = true;
                   }
                                            %>
                                            <td>
                                                <%# DataBinder.Eval(Container.DataItem,"MatchNumber")%>
                                            </td>
                                            <td>
                                                <%# DataBinder.Eval(Container.DataItem,"Game")%>
                                            </td>
                                            <td>
                                                <%# DataBinder.Eval(Container.DataItem,"MainTeam")%>
                                            </td>
                                            <td>
                                                <%# DataBinder.Eval(Container.DataItem,"MainLoseBall")%>
                                            </td>
                                            <td>
                                                <%# DataBinder.Eval(Container.DataItem,"GuestTeam")%>
                                            </td>
                                            <td>
                                                <%# DataBinder.Eval(Container.DataItem,"Result")%>
                                            </td>
                                            <td>
                                                <div style="width: 200px; height: 15px; text-align: left; background-image: url(Images/uk.png);
                                                    background-attachment: scroll; background-position: center center">
                                                    <div>
                                                        <img src="Images/ul.png" height="15" width="<%# DataBinder.Eval(Container.DataItem,"Scale")%>%" /></div>
                                                </div>
                                            </td>
                                            <td>
                                                <font color="red">
                                                    <%# DataBinder.Eval(Container.DataItem,"Scale")%>%</font>
                                            </td>
                                        </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--��̨sider-->
        <div class="side_ring">
            <!--��̨����-->
            <div class="notice_ring">
                <div class="side_nav">
                    <h2>
                        ��̨����</h2>
                </div>
                <div class="notice_ring_list">
                    <ul>
                        <%=NewsHTML %>
                    </ul>
                </div>
            </div>
            <!--�ҵ���̨-->
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
                    <h2>
                        ��10����ְ�</h2>
                    <dl>
                        <a href="ChallengeRanking.aspx">����&gt;&gt;</a>
                    </dl>
                </div>
                <div class="side_tabcont">
                    <table class="table_c2" width="100%" border="0" cellpadding="0" cellspacing="1">
                        <tbody>
                            <tr class="new_t2">
                                <td>
                                    ����
                                </td>
                                <td>
                                    �û���
                                </td>
                                <td>
                                    ����
                                </td>
                            </tr>
                            <asp:Repeater ID="gSchemesToDay" runat="server">
                                <ItemTemplate>
                                    <%
                                        if (!state)
                                        {
                                    %>
                                    <tr>
                                        <td height="22" bgcolor="#F2F2F2">
                                            <%# DataBinder.Eval(Container.DataItem, "Ranking")%>
                                        </td>
                                        <td bgcolor="#F2F2F2">
                                            <a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>','�����ʷ��¼',470,600)">
                                                <%# DataBinder.Eval(Container.DataItem, "Name")%></a>
                                        </td>
                                        <td bgcolor="#FFFFFF" class="c_red fb">
                                            <%# DataBinder.Eval(Container.DataItem, "Score")%>
                                        </td>
                                    </tr>
                                    <%
                                        state = true;
                                    }
                                    else
                                    {
                                    %>
                                    <tr>
                                        <td height="22" bgcolor="#FFFFFF">
                                            <%# DataBinder.Eval(Container.DataItem, "Ranking")%>
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>','�����ʷ��¼',470,600)">
                                                <%# DataBinder.Eval(Container.DataItem, "Name")%></a>
                                        </td>
                                        <td bgcolor="#FFFFFF" class="c_red fb">
                                            <%# DataBinder.Eval(Container.DataItem, "Score")%>
                                        </td>
                                    </tr>
                                    <% state = false;
                                    } %>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!--���ְ�-->
            <div class="side_tab">
                <div class="sider_tabnav">
                    <h2>
                        �����а�</h2>
                    <dl>
                        <a href="ChallengeRanking.aspx">����&gt;&gt;</a>
                    </dl>
                </div>
                <div class="side_tabcont">
                    <table class="table_c2" width="100%" border="0" cellpadding="0" cellspacing="1">
                        <tbody>
                            <tr class="new_t2">
                                <td>
                                    ����
                                </td>
                                <td>
                                    �û���
                                </td>
                                <td>
                                    ע��
                                </td>
                                <td>
                                    ����
                                </td>
                            </tr>
                            <asp:Repeater runat="server" ID="gSchemesToMonth">
                                <ItemTemplate>
                                    <%
                                        if (!state)
                                        {
                                    %>
                                    <tr>
                                        <td height="22" bgcolor="#F2F2F2">
                                            <%# DataBinder.Eval(Container.DataItem, "Ranking")%>
                                        </td>
                                        <td bgcolor="#F2F2F2">
                                            <a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>','�����ʷ��¼',470,600)">
                                                <%# DataBinder.Eval(Container.DataItem, "Name")%></a>
                                        </td>
                                        <td bgcolor="#F2F2F2">
                                            <%# DataBinder.Eval(Container.DataItem, "Counts")%>
                                        </td>
                                        <td bgcolor="#FFFFFF" class="c_red fb">
                                            <%# DataBinder.Eval(Container.DataItem, "Score")%>
                                        </td>
                                    </tr>
                                    <%
                                        state = true;
                                    }
                                    else
                                    {
                                    %>
                                    <tr>
                                        <td height="22" bgcolor="#FFFFFF">
                                            <%# DataBinder.Eval(Container.DataItem, "Ranking")%>
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>','�����ʷ��¼',470,600)">
                                                <%# DataBinder.Eval(Container.DataItem, "Name")%></a>
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <%# DataBinder.Eval(Container.DataItem, "Counts")%>
                                        </td>
                                        <td bgcolor="#FFFFFF"  class="c_red fb">
                                            <%# DataBinder.Eval(Container.DataItem, "Score")%>
                                        </td>
                                    </tr>
                                    <% state = false;
                                    } %>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!--���ְ�-->
            <div class="side_tab">
                <div class="sider_tabnav">
                    <h2>
                        �ܻ��ְ񣨽�60�죩</h2>
                    <dl>
                        <a href="ChallengeRanking.aspx">����&gt;&gt;</a>
                    </dl>
                </div>
                <div class="side_tabcont">
                    <table class="table_c2" width="100%" border="0" cellpadding="0" cellspacing="1">
                        <tbody>
                            <tr class="new_t2">
                                <td>
                                    ����
                                </td>
                                <td>
                                    �û���
                                </td>
                                <td>
                                    ����
                                </td>
                            </tr>
                            <asp:Repeater runat="server" ID="gSchemesToMain">
                                <ItemTemplate>
                                    <%
                                        if (!state)
                                        {
                                    %>
                                    <tr>
                                        <td height="22" bgcolor="#F2F2F2">
                                            <%# DataBinder.Eval(Container.DataItem, "Ranking")%>
                                        </td>
                                        <td bgcolor="#F2F2F2">
                                            <a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>','�����ʷ��¼',470,600)">
                                                <%# DataBinder.Eval(Container.DataItem, "Name")%></a>
                                        </td>
                                        <td bgcolor="#FFFFFF" class="c_red fb">
                                            <%# DataBinder.Eval(Container.DataItem, "Score")%>
                                        </td>
                                    </tr>
                                    <%
                                        state = true;
                                    }
                                    else
                                    {
                                    %>
                                    <tr>
                                        <td height="22" bgcolor="#FFFFFF">
                                            <%# DataBinder.Eval(Container.DataItem, "Ranking")%>
                                        </td>
                                        <td bgcolor="#FFFFFF">
                                            <a href="javascript:showWinOpen('ChellengeUserSchemesDetails.aspx?userID=<%# DataBinder.Eval(Container.DataItem, "UserID")%>','�����ʷ��¼',470,600)">
                                                <%# DataBinder.Eval(Container.DataItem, "Name")%></a>
                                        </td>
                                        <td bgcolor="#FFFFFF" class="c_red fb">
                                            <%# DataBinder.Eval(Container.DataItem, "Score")%>
                                        </td>
                                    </tr>
                                    <% state = false;
                                    } %>
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
                <div class="eyed_boy_cont" style="padding-left:0px;">
                    <table border="0" cellpadding="0" cellspacing="0">
                        
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
                    <h2>
                        ���µĽ�����Ϣ</h2>
                    <dl>
                        <a href="/Challenge/ChallengeHelp.aspx">����&gt;&gt;</a>
                    </dl>
                </div>
                <div class="side_tabcont">
                    <table class="table_c2" width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#DBDBDB">
                        <tbody>
                            <tr class="new_t2">
                                <td>
                                    ����
                                </td>
                                <td>
                                    ����
                                </td>
                            </tr>
                            <tr>
                                <td height="22">
                                    ��1��
                                </td>
                                <td class="c_org fb">
                                    1200Ԫ
                                </td>
                            </tr>
                            <tr>
                                <td height="22">
                                    ��2��~ ��3��
                                </td>
                                <td class="c_org fb">
                                    600Ԫ
                                </td>
                            </tr>
                            <tr>
                                <td height="22">
                                    ��4��~ ��8��
                                </td>
                                <td class="c_org fb">
                                    300Ԫ
                                </td>
                            </tr>
                            <tr>
                                <td height="22">
                                    ��9��~ ��15��
                                </td>
                                <td class="c_org fb">
                                    50Ԫ
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="cl">
        </div>
    </div>
    <uc2:WebFoot runat="server" ID="foot" />
    <input type="hidden" id="ggtypeid" name="ggtypeid" value="AA" />
    <input type="hidden" id="codes" name="codes" />
    <input type="hidden" id="playid" name="playid" value="7201" />
    <input type="hidden" id="playname" name="playname" value="�÷�ʤƽ��" />
    <input type="hidden" id="lotid" name="lotid" value="72" />
    <input type="hidden" id="odds" name="odds"/>
    <input type="hidden" id="beishu" name="beishu" value="1" />
    
    <script src="JScript/public.js" type="text/javascript"></script>
    <script src="JScript/challenge.js" type="text/javascript"></script>

    </form>
</body>
</html>
