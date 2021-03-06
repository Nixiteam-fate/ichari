﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Help_Default.aspx.cs" Inherits="Help_Default" %>

<%@ Register Src="../UserControls/HelpCenter.ascx" TagName="Help" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%=_Site.Name %>－买彩票，就上<%=_Site.Name %></title>
    <meta name="keywords" content="<%=_Site.Name %>帮助中心" />
    <meta name="description" content="<%=_Site.Name %>提供：用户登录-账户充值-选择彩种、选择玩法、选号投注-点击“立即投注”按钮---投注成功-中大奖了，我要提款！的帮助" />
    <link href="../Style/dahecp.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="../favicon.ico" />
    <script type="text/javascript" src="/Scripts/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#WebHead1_currentMenu").val("mHelp");
        });
    </script>
</head>
<body class="gybg">
    <form id="form1" runat="server">
    <asp:PlaceHolder ID="phHead" runat="server"></asp:PlaceHolder>



<div class="w980 png_bg2">
<!-- 内容开始 -->
<div class="w970">

     <div id="content">
        <div id="help_left">
            <uc2:Help ID="Help" runat="server" />
        </div>
        <div id="help_right">
            <table border="0" cellpadding="0" cellspacing="0"  width="100%">
                <tr class="bg1x bgp5">                   
                    <td align="center" width="90" id="tdHelpCenter" style="cursor:hand;" class="fs14 bg1x bgp1 afff fw">
                        <a href="Help_Default.aspx">帮助中心</a>
                    </td>
                    <td width="5">
                        &nbsp;
                    </td>
                    <td align="center" width="90" id="tdPlayType" style="cursor: hand;" class="hui14">
                        <a href="Play_Default.aspx">玩法介绍</a>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td height="32" width="20">
                        &nbsp;
                    </td>
                </tr>
            </table>
           <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#E3E3E4" >
             <tr bgcolor="#CCCCCC">
               <td bgcolor="#ffffff" class="blue14_2" style="padding:20px 25px 20px 25px; background-image:url(../images/zfb_bg_blue.jpg); background-repeat: repeat-x; background-position: center top;">
               <h1 class="tc" style="line-height:45px;">新手入门全过程</h1>
               <p>第一步：<a href="help_UserReg.aspx">用户注册</a></p>
               <p>第二步：<a href="help_Login.aspx">用户登录</a></p>
               <p>第三步：<a href="help_Send.aspx">账户充值</a></p>
               <p>第四步：<a href ="help_Buy.aspx">选择彩种、选择玩法、选号投注</a></p>
               <p>第五步：<a href ="help_Buy.aspx">点击“立即投注”按钮---投注成功</a></p>
               <p>第六步：<a href ="help_Draw_Money.aspx">中大奖了，我要提款！</a></p>
               </td>
             </tr>
           </table>
        </div>
    </div>

</div>

<!-- 内容结束 -->
</div>
<div class=" w980 png_bg1"></div>


    <asp:PlaceHolder ID="phFoot" runat="server"></asp:PlaceHolder>
    </form>
<!--#includefile="../Html/TrafficStatistics/1.htm"--></body>
</html>

