﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsEdit.aspx.cs" Inherits="Admin_NewsEdit"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Shove.Web.UI.4 For.NET 3.5" Namespace="Shove.Web.UI" TagPrefix="ShoveWebUI" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../Style/css.css" type="text/css" rel="stylesheet" />
    <link href="../Style/main.css" type="text/css" rel="stylesheet" />
    <script src="../JScript/jquery-1.6.2.min.js" type="text/javascript"></script>
    <script src="../kindeditor/kindeditor-min.js" type="text/javascript"></script>
    <script src="../kindeditor/lang/zh_CN.js" type="text/javascript"></script>
</head>
<body>
   
    <form id="form1" runat="server"> 
        <div>
            <br />
            <table cellspacing="0" cellpadding="0" width="90%" align="center" border="0">
                <tr>
                    <td>
                        <font face="宋体">类别
                            <asp:DropDownList ID="ddlTypes" runat="server" Width="140px">
                            </asp:DropDownList>
                            &nbsp;&nbsp; 时间
                            <asp:TextBox ID="tbDateTime" runat="server" Width="200px"></asp:TextBox>&nbsp;&nbsp; &nbsp; &nbsp;阅读
                            <asp:TextBox ID="tbReadCount" runat="server" Width="80px"></asp:TextBox>
                            &nbsp; &nbsp; &nbsp;<asp:CheckBox ID="cbisShow" runat="server" Text="是否显示" />&nbsp;
                            <asp:CheckBox ID="cbisCanComments" runat="server" Text="允许评论" />&nbsp;
                            <asp:CheckBox ID="cbisCommend" runat="server" Text="重点推荐" />&nbsp;
                            <asp:CheckBox ID="cbisHot" runat="server" Text="热点新闻" /><asp:TextBox ID="tbID" runat="server" Visible="False"></asp:TextBox></font>
                </td>
            </tr>
            <tr>
                <td>
                    <font face="宋体">标题
                            <asp:TextBox ID="tbTitle" runat="server" Width="668px"></asp:TextBox></font>
                    &nbsp;&nbsp;标题颜色<asp:DropDownList ID="ddlTitleColor" runat="server">
                        <asp:ListItem>none</asp:ListItem>
                        <asp:ListItem>red</asp:ListItem>
                        <asp:ListItem>black</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButtonList ID="rblType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                        AutoPostBack="True" OnSelectedIndexChanged="rblType_SelectedIndexChanged">
                        <asp:ListItem Value="1" Selected="True">地址型</asp:ListItem>
                        <asp:ListItem Value="2">内容型</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr id="trUrl" runat="server">
                <td>
                    地址
                    <asp:TextBox ID="tbUrl" runat="server" Width="668px" MaxLength="200"></asp:TextBox>
                </td>
            </tr>
            <tbody id="trContent" runat="server">
                <tr>
                    <td>
                        内容
                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom: 5px;">
                        <textarea rows="1" cols="1" runat="server" id="tbContent" name="tbContent" style="width: 98%;
                            height: 300px;"></textarea>
                    </td>
                </tr>
                <script type="text/javascript">
                    var editor;
                    KindEditor.ready(function (K) {
                        editor = K.create('#tbContent', {
                            cssPath: '../kindeditor/plugins/code/prettify.css',
                            uploadJson: '../kindeditor/asp.net/upload_json.ashx',
                            fileManagerJson: '../kindeditor/asp.net/file_manager_json.ashx',
                            resizeType: 0,
                            allowFileManager: true
                        });

                        //prettyPrint();
                    });
                </script>
            </tbody>
            <tr>
                <td>
                    <font face="宋体">使用一个新的图片
                            <input id="tbImage" style="width: 600px; height: 21px" type="file" size="80" name="tbImage" runat="server"><br />
                            <font color="#ff0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (如果选择了新图片，下面“已存在的图片”选择将无效)</font></font>
                </td>
            </tr>
            <tr>
                <td>
                    <font face="宋体">使用已存在的图片
                            <asp:DropDownList ID="ddlImage" runat="server" Width="160px">
                            </asp:DropDownList>&nbsp;&nbsp;
                            <asp:CheckBox ID="cbNoEditImage" runat="server" Text="不修改图片" Checked="True"></asp:CheckBox>
                            <asp:TextBox ID="tbOldImage" runat="server" Visible="False"></asp:TextBox>
                        </font>
                </td>
            </tr>
            <tr>
                <td style="height: 49px" align="center">
                    <ShoveWebUI:ShoveConfirmButton ID="btnSave" runat="server" BackgroupImage="../Images/Admin/buttbg.gif"
                        Width="60px" Height="21px" AlertText="你确定要保存吗？" Text="保存" 
                        OnClientClick="editor.sync();" OnClick="btnSave_Click" />
                </td>
            </tr>
        </table>
        <br />
    </div>
    </form>
    <!--#includefile="~/Html/TrafficStatistics/1.htm"-->
</body>
</html>
