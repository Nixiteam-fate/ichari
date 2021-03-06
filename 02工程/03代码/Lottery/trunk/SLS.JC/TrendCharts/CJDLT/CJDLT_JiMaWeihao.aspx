﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CJDLT_JiMaWeihao.aspx.cs"
    Inherits="TrendCharts_CJDLT_CJDLT_JiMaWeihao" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>超级大乐透前区尾号分布图</title>
    <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
}
body,td,th {
	font-size: 14px;
	Font-Name: 宋体;
}
-->
</style>
   <script type="text/javascript" language="javascript">
<!--
var jsstr = ""
+ "<img src=\"about:blank\" id=\"leftright\" style=\"width:expression(document.body.clientWidth);height:1px;position:absolute;left:0;top:0;background-color:#6699cc;z-index:100;\" \/>\n"
+ "<img src=\"about:blank\" id=\"topdown\" style=\"height:expression(document.body.clientHeight);width:1px;position:absolute;left:0;top:0;background-color:#6699cc;z-index:100;\" \/>\n"
document.writeln(jsstr);

function followmouse(){
	leftright.style.top = window.event.y-1+document.body.scrollTop
	topdown.style.left = window.event.x-1+document.body.scrollLeft
	topdown.style.height= document.getElementById("div_end").offsetTop;// + 800;
	leftright.style.width=document.body.clientWidth
}
document.onmousemove=followmouse

function Style(obj,statcolor,color)
{

 if(obj.style.backgroundColor=="")
 {
	obj.style.backgroundColor=statcolor;
	obj.style.color="#FFFFFF";
  }
	else
	{
	obj.style.backgroundColor="";
	obj.style.color=color;
	}
}
//-->
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <table cellspacing="0" cellpadding="0" width="100%"  border="0">
                <tr align="center">
                    <td style="width: 100%; color: white; font-style: normal; background-color: #FF5122;
                        height: 6px;">
                        选择最近期数
                        <asp:RadioButton ID="RadioButton1" runat="server" Text="100期" AutoPostBack="True"
                            GroupName="group" OnCheckedChanged="RadioButton1_CheckedChanged1" />
                        <asp:RadioButton ID="RadioButton2" runat="server" Text="50期" AutoPostBack="True"
                            OnCheckedChanged="RadioButton2_CheckedChanged" GroupName="group" />
                        <asp:RadioButton ID="RadioButton3" runat="server" Text="30期" AutoPostBack="True"
                            Checked="true" OnCheckedChanged="RadioButton3_CheckedChanged" GroupName="group" />
                        <asp:RadioButton ID="RadioButton4" runat="server" Text="20期" AutoPostBack="True"
                            GroupName="group" OnCheckedChanged="RadioButton4_CheckedChanged1" />
                        <asp:RadioButton ID="RadioButton5" runat="server" Text="10期" AutoPostBack="True"
                            GroupName="group" OnCheckedChanged="RadioButton5_CheckedChanged1" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center">
            &nbsp;&nbsp;&nbsp;
            <table border="0" cellpadding="1" cellspacing="1" style="background-color: #CCCCCC; width:100%">
                <tbody>
                    <tr style="background-color: #EEEEEE">
                        <td align="center" colspan='3'>
                            <table cellspacing="0 " cellpadding="0" width="100%" border="0">
                                <tbody>
                                    <tr style="background-color: #EEEEEE">
                                        <td height="24" align="center">
                                            <b>超级大乐透前区尾号分布图</b></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td style="width: 40px; background-color: #F0F0F0">
                        </td>
                        <td valign="top" style="border-color: #ffffff">
                            <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                                <tr align="center" valign="middle">
                                    <td valign="top" colspan="11">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" UseAccessibleHeader="False"
                                            OnRowCreated="GridView1_RowCreated" ShowFooter="True" Width="100%" bordercolorlight="#808080" FooterStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                            bordercolordark="#FFFFFF" align="center" CellPadding="0">
                                             <RowStyle HorizontalAlign="Center" />
                                            <Columns>
                                                <asp:BoundField DataField="Isuse" HeaderText="期  数" ItemStyle-HorizontalAlign="Center">
                                                    <ItemStyle Width="30px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_1" HeaderText="B_1">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_11" HeaderText="B_11">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_21" HeaderText="B_21">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_31" HeaderText="B_31">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_2" HeaderText="B_2">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_12" HeaderText="B_12">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_22" HeaderText="B_22">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_32" HeaderText="B_32">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_3" HeaderText="B_3">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_13" HeaderText="B_13">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_23" HeaderText="B_23">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_33" HeaderText="B_33">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_4" HeaderText="B_4">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_14" HeaderText="B_14">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_24" HeaderText="B_24">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_34" HeaderText="B_34">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_5" HeaderText="B_5">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_15" HeaderText="B_15">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_25" HeaderText="B_25">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_35" HeaderText="B_35">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_6" HeaderText="B_6">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_16" HeaderText="B_16">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_26" HeaderText="B_26">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_7" HeaderText="B_7">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_17" HeaderText="B_17">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_27" HeaderText="B_27">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_8" HeaderText="B_8">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_18" HeaderText="B_18">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_28" HeaderText="B_28">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_9" HeaderText="B_9">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_19" HeaderText="B_19">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_29" HeaderText="B_29">
                                                    <ItemStyle Width="15px" BackColor="#F0F0F0" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_10" HeaderText="B_10">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_20" HeaderText="B_20">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="B_30" HeaderText="B_30">
                                                    <ItemStyle Width="15px" BackColor="#E7FEEB" />
                                                </asp:BoundField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 40px; background-color: #F0F0F0">
                        </td>
                    </tr>
                </tbody>
            </table>  <br />
            <table width="660" border="0" align="center" cellpadding="0" cellspacing="0">                <tr>
                    <td height="6" style="width: 6px">
                        <img src="../../images/tree/jbg1[1].gif" width="6" height="6"></td>
                    <td background="../../images/tree/jbg2[1].gif">
                    </td>
                    <td width="6" height="6">
                        <img src="../../images/tree/jbg3[1].gif" width="6" height="6"></td>
                </tr>
                <tr>
                    <td height="87" background="../../images/tree/jbg4[1].gif" style="width: 6px">
                    </td>
<td background="../../images/bg009.gif">
                        <table width="100%" border="0" cellspacing="0" cellpadding="5">
                   <tr>
         <td align="left" valign="top"><font color="#FF0000">说明：</font>超级大乐透前区域尾号分析图是反映往期开奖号码个位上在0-9区出现个数的统计，彩民可依据此种规律来决定下一期开匀号可通会出现的位置。<br>
              　　本图将每期开奖号经过系统详细的计算分析,并且进行相应期数出现总数统计。</td>
       </tr>
                        </table>
                    </td>
                    <td background="../../images/tree/jbg5[1].gif">
                    </td>
                </tr>
                <tr>
                    <td style="width: 6px; height: 6px" background="../../images/tree/jbg6[1].gif"></td>
                    <td background="../../images/tree/jbg7[1].gif">
                    </td>
                    <td style="height: 6px" background="../../images/tree/jbg8[1].gif"></td>
                </tr>

            </table>
<div id="div_end">
        </div>
    </form>
</body>
</html>
