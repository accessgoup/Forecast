<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Settings.aspx.vb" Inherits="FORECAST.Settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%-- <asp:DataList ID="DLParametri" runat="server" BorderWidth="1px" GridLines="Horizontal" ShowFooter="False">
            <ItemTemplate>
                <table>
                    <tr>
                        <td><asp:label runat="server" ID="nome" text='<%#Bind("name") %>'></asp:label> </td>
                        <td>
                            <asp:TextBox ID="txtInfo" runat="server">'<%#Bind("info") %>'></asp:TextBox></td>
                        </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>--%>
        <asp:GridView ID="GridParameters" runat="server" CellPadding="4" Font-Names="Segoe Ui" Font-Size="12px" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            
        </asp:GridView>
        

        
    </form>
</body>
</html>
