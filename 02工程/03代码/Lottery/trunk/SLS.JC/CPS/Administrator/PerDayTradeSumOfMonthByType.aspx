<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PerDayTradeSumOfMonthByType.aspx.cs" Inherits="Cps_Administrator_PerDayTradeSumOfMonthByType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Shove.Web.UI.4 For.NET 3.5" Namespace="Shove.Web.UI" TagPrefix="ShoveWebUI" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>�ޱ���ҳ</title>
    <link href="../../Style/css.css" type="text/css" rel="stylesheet" />
    <link href="../../Style/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
         <asp:HiddenField ID="hfYearMonth" runat="server" />
        
         <br />
         <span style=" font-size: 14px; font-weight: bold;">&nbsp;<span style=" font-size: 14px; font-weight: bold;">
         &nbsp;</span>CPS <asp:Label ID="lblMonth" runat="server" Text="lblMonth" ForeColor="#CC0000"></asp:Label>
         &nbsp;������ϸ��
         </span><br />
                        <asp:DataGrid ID="g" runat="server"  BorderStyle="None" AllowSorting="True"
	                    AllowPaging="True" PageSize="30" AutoGenerateColumns="False" CellPadding="2"
	                    BackColor="#CCCCCC" Font-Names="����" CellSpacing="1"
	                    GridLines="None">
	                    <FooterStyle ForeColor="#330099" BackColor="#FFFFCC"></FooterStyle>
	                    <SelectedItemStyle Font-Bold="True" ForeColor="#663399"></SelectedItemStyle>
	                    <HeaderStyle HorizontalAlign="Center" ForeColor="RoyalBlue" VerticalAlign="Middle"
		                    BackColor="#E9F1F8" Height="25px" ></HeaderStyle>
	                        <AlternatingItemStyle BackColor="#F7FEFA" />
	                    <ItemStyle Height="21px" BackColor="White"></ItemStyle>
	                    <Columns>
		                     <asp:BoundColumn DataField="Day" HeaderText="ʱ��" DataFormatString="{0:d}">
			                    <HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
			                    <ItemStyle HorizontalAlign="Center" ></ItemStyle>
		                    </asp:BoundColumn>
		                    <asp:BoundColumn DataField="TotalCpsMemberCount" HeaderText="�ۼƻ�Ա��">
			                    <HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
			                    <ItemStyle HorizontalAlign="Center" ></ItemStyle>
		                    </asp:BoundColumn>
		                    <asp:BoundColumn DataField="NewCpsMemberCount" HeaderText="������Ա��">
			                    <HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
			                    <ItemStyle HorizontalAlign="Center" ></ItemStyle>
		                    </asp:BoundColumn>
		                    <asp:BoundColumn DataField="NewTradeCpsMemberCount" HeaderText="�������׻�Ա��">
			                    <HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
			                    <ItemStyle HorizontalAlign="Center" ></ItemStyle>
		                    </asp:BoundColumn>

		                    
		                    <asp:BoundColumn DataField="TradeMoney" HeaderText="�ս�����" 
                                DataFormatString="{0:N2}">
			                    <HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
			                    <ItemStyle HorizontalAlign="Center" ></ItemStyle>
		                    </asp:BoundColumn>
		                    
		                    <asp:BoundColumn DataField="BonusMoneySum" HeaderText="Ӷ������" 
                                DataFormatString="{0:N2}">
			                    <HeaderStyle HorizontalAlign="Center" Width="100px"></HeaderStyle>
			                    <ItemStyle HorizontalAlign="Center" ></ItemStyle>
		                    </asp:BoundColumn>
		                    
		                    <asp:TemplateColumn HeaderText="����" >
                                <ItemTemplate>
                                    <a target="_blank" href="DayBuyDetailByType.aspx?Day=<%# DataBinder.Eval(Container.DataItem,"Day") %> ">������ϸ </a> 
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            
	                    </Columns>
	                    <PagerStyle Visible="False"></PagerStyle>
                    </asp:DataGrid>
         <table>
            <tr>
                
                <td valign="top">
                     <br />
                     
                </td>
                <td valign="top">
     
                </td>
            </tr>
        </table>
        <div align="center">  
        </div>
                    
    </form>

    </body>
</html>

