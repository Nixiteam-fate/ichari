﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InvestHistory.aspx.cs" Inherits="Home_Room_InvestHistory" %>
<%@ Register src="UserControls/UserMyIcaile.ascx" tagname="UserMyIcaile" tagprefix="uc2" %>

<%@ Register Assembly="Shove.Web.UI.4 For.NET 3.5" Namespace="Shove.Web.UI" TagPrefix="ShoveWebUI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>我的历史投注纪录-我的购彩纪录-用户中心-<%=_Site.Name %>－买彩票，就上<%=_Site.Name %> ！</title>
    <meta name="description" content="<%=_Site.Name %>彩票网<%=_Site.Url %>是一家服务于中国彩民的互联网彩票合买代购交易平台，涉及中国彩票彩种最全的网站!" />
    <meta name="keywords" content="合买,体育彩票,开奖信息." />
     
    <link href="Style/css.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function mOver(obj, type) {
            if (type == 1) {
                obj.style.textDecoration = "underline";
                obj.style.color = "#FF0065";
            }
            else {
                obj.style.textDecoration = "none";
                obj.style.color = "#226699";


            }
        }

        function showSameHeight() {
            if (document.getElementById("menu_left").clientHeight < document.getElementById("menu_right").clientHeight) {
                document.getElementById("menu_left").style.height = document.getElementById("menu_right").offsetHeight + "px";
            }
            else {
                if (document.getElementById("menu_right").offsetHeight >= 860) {
                    document.getElementById("menu_left").style.height = document.getElementById("menu_right").offsetHeight + "px";
                }
                else {
                    document.getElementById("menu_left").style.height = "860px";
                }
            }
        }
    </script>
    <link rel="shortcut icon" href="../../favicon.ico" />
</head>
<body onload="showSameHeight();">
    <form id="form1" runat="server">
     <asp:PlaceHolder ID="phHead" runat="server"></asp:PlaceHolder>
     <div id="content">
        <div id="menu_left">
            <uc2:UserMyIcaile ID="UserMyIcaile1" runat="server" />
        </div>
        <div id="menu_right">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="40" height="30" align="right" valign="middle" class="red14">
                <img src="images/icon_6.gif" width="19" height="16" />
            </td>
            <td valign="middle" class="red14" style="padding-left: 10px;">
                我的彩票记录
            </td>
        </tr>
    </table>
    <br />
    <table width="100%" border="0" cellspacing="0" cellpadding="0" background="images/zfb_left_bg_2.jpg"
        style="margin-top: 10px;">
        <tr>
            <td width="10" height="29" align="left">
                &nbsp;
            </td>
            <td width="100" id="tdHistory" align="center" background="images/admin_qh_100_2.jpg"
                style="cursor: pointer;" class="blue12" onmouseover="mOver(this,1)" onmouseout="mOver(this,2)">
                <strong>历史投注记录</strong>
            </td>
            <td width="726">
                &nbsp;
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="1" colspan="9" bgcolor="#FFFFFF">
            </td>
        </tr>
        <tr>
            <td height="2" colspan="9" bgcolor="#6699CC">
            </td>
        </tr>
    </table>
    <table id="myIcaileTab" runat="server" width="776" border="0" cellpadding="0" cellspacing="0"
        bgcolor="#DDDDDD">
        <tr>
            <td valign="top" id="tdInvest" runat="server" style="background-color: White;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#DDDDDD">
                    <tr>
                        <td height="30" align="left" bgcolor="#F3F3F3" style="padding: 5px 10px 5px 10px;" style="border-left: 1px solid #DDDDDD;
                        border-right: 1px solid #DDDDDD;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="42%" class="black12">
                                        彩种：
                                        <asp:DropDownList ID="ddlLottery" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLottery_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="ddlIsuse" runat="server">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="ddlPlayType" runat="server">
                                        </asp:DropDownList>
                                        <ShoveWebUI:ShoveConfirmButton ID="btnGo" BackgroupImage="images/button_chaxun.jpg"
                                            Style="cursor: hand" runat="server" Width="50px" Font-Size="Smaller" Height="22px"
                                            BorderStyle="None" OnClick="btnGo_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <asp:DataGrid ID="gHistory" runat="server" width="100%" BorderStyle="None" AllowPaging="false"
                    PageSize="30" AutoGenerateColumns="False" CellPadding="0" BackColor="#DDDDDD"
                    Font-Names="Tahoma" OnItemDataBound="gHistory_ItemDataBound" CellSpacing="1"
                    GridLines="None">
                    <FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
                    <SelectedItemStyle Font-Bold="True" ForeColor="#663399"></SelectedItemStyle>
                    <HeaderStyle HorizontalAlign="Center" BackColor="#E9F1F8" ForeColor="#0066BA" Height="30px"
                        CssClass="blue12_2"></HeaderStyle>
                    <AlternatingItemStyle BackColor="#F8F8F8" />
                    <ItemStyle BackColor="White" BorderStyle="None" Height="30px" HorizontalAlign="Center"
                        CssClass="black12" />
                    <Columns>
                        <asp:BoundColumn DataField="InitiateName" SortExpression="InitiateName" HeaderText="发起人">
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="PlayTypeName" SortExpression="PlayTypeName" HeaderText="方案类别">
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="SchemeShare" SortExpression="SchemeShare" HeaderText="方案份数">
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="Money" SortExpression="Money" HeaderText="方案金额"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Share" SortExpression="Share" HeaderText="认购份数"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DetailMoney" SortExpression="DetailMoney" HeaderText="认购金额">
                        </asp:BoundColumn>
                        <asp:BoundColumn HeaderText="所占股份"></asp:BoundColumn>
                        <asp:BoundColumn DataField="SchemeWinMoney" SortExpression="WinMoney" HeaderText="方案奖金">
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="WinMoneyNoWithTax" SortExpression="WinMoneyNoWithTax"
                            HeaderText="您的奖金"></asp:BoundColumn>
                        <asp:BoundColumn HeaderText="是否中奖"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DateTime" SortExpression="DateTime" HeaderText="发起时间"
                            DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"></asp:BoundColumn>
                        <asp:BoundColumn HeaderText="状态"></asp:BoundColumn>
                        <asp:BoundColumn Visible="False" DataField="SchemeID" SortExpression="SchemeID" HeaderText="SchemeID">
                        </asp:BoundColumn>
                        <asp:BoundColumn Visible="False" DataField="QuashStatus" SortExpression="QuashStatus"
                            HeaderText="QuashedStatus"></asp:BoundColumn>
                        <asp:BoundColumn Visible="False" DataField="Buyed" SortExpression="Buyed" HeaderText="Buyed">
                        </asp:BoundColumn>
                        <asp:BoundColumn Visible="False" DataField="AssureMoney" SortExpression="AssureMoney"
                            HeaderText="AssureMoney"></asp:BoundColumn>
                        <asp:BoundColumn Visible="False" DataField="BuyedShare" SortExpression="BuyedShare"
                            HeaderText="BuyedShare"></asp:BoundColumn>
                    </Columns>
                    <PagerStyle Visible="False" HorizontalAlign="Center" ForeColor="#330099" BackColor="#FFFFCC">
                    </PagerStyle>
                </asp:DataGrid>
                <ShoveWebUI:ShoveGridPager ID="gPagerHistory" runat="server" width="100%" PageSize="30"
                    ShowSelectColumn="False" DataGrid="gHistory" AlternatingRowColor="#F8F8F8" GridColor="#E0E0E0"
                    HotColor="MistyRose" Visible="False" OnPageWillChange="gPager_PageWillChange"
                    OnSortBefore="gPager_SortBefore" RowCursorStyle="" AllowShorting="true" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#D8D8D8" style="margin-top: 10px;">
        <tr>
            <td width="368" bgcolor="#F8F8F8" class="black12" style="padding: 5px 10px 5px 10px;">
                本页认购金额总计： <span class="red12">
                    <asp:Label ID="lblPageBuySum" runat="server" Text=""></asp:Label>
                </span>
            </td>
            <td width="407" bgcolor="#F8F8F8" class="black12" style="padding: 5px 10px 5px 10px;">
                认购金额总计： <span class="red12">
                    <asp:Label ID="lblTotalBuySum" runat="server" Text=""></asp:Label>
                </span>
            </td>
        </tr>
        <tr>
            <td bgcolor="#F8F8F8" class="black12" style="padding: 5px 10px 5px 10px;">
                本页方案奖金总计： <span class="red12">
                    <asp:Label ID="lblPageRewardSum" runat="server" Text=""></asp:Label>
                </span>
            </td>
            <td bgcolor="#F8F8F8" class="black12" style="padding: 5px 10px 5px 10px;">
                方案奖金总计： <span class="red12">
                    <asp:Label ID="lblTotalRewardSum" runat="server" Text=""></asp:Label>
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="2" bgcolor="#FFFEDF" class="black12" style="padding: 5px 10px 5px 10px;">
                <span class="blue12">说明：</span><br />
                1、您可以查询您的帐户在一段时间内的所有交易流水。<br />
                2、如有其他问题，请联系网站客服：<%= _Site.ServiceTelephone %>。
            </td>
        </tr>
    </table>
    </div> 
    </div>
      <asp:PlaceHolder ID="phFoot" runat="server"></asp:PlaceHolder>
    </form>
    <!--#includefile="../../Html/TrafficStatistics/1.htm"-->
</body>
</html>
