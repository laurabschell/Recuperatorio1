<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionProductos.aspx.cs" Inherits="Recuperatorio1.GestionProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Menu</asp:HyperLink>
            <br />
            <br />
            Gestion de Productos<br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Width="245px"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" Width="162px" />
&nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Actualizar" Width="141px" />
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SelectDropDown" DataTextField="descripcion" DataValueField="id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="250px">
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Eliminar" Width="163px" />
            <br />
            <br />
            <asp:SqlDataSource ID="SQLDataSourceCRUDproductos" runat="server" ConnectionString="<%$ ConnectionStrings:Recuperatorio1ConnectionString %>" DeleteCommand="DELETE FROM [productos] WHERE [id] = @id" InsertCommand="INSERT INTO [productos] ([descripcion]) VALUES (@descripcion)" ProviderName="<%$ ConnectionStrings:Recuperatorio1ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [productos]" UpdateCommand="UPDATE [productos] SET [descripcion] = @descripcion WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SQLDataSourceSelectDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:Recuperatorio1ConnectionString %>" SelectCommand="SELECT * FROM [productos]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
