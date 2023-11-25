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
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Descripcion del producto" Width="245px"></asp:TextBox>
            &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" Width="162px" />
&nbsp;<br />
            <br />
            <asp:ListBox ID="ListBox1" runat="server" Height="104px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="249px" AutoPostBack="True" DataSourceID="SQLDataSourceCRUDproductos" DataTextField="descripcion" DataValueField="id"></asp:ListBox>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" Width="239px"></asp:TextBox>
&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Eliminar" Width="163px" />
            &nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Actualizar" Width="141px" />
            <br />
            <br />
            <asp:SqlDataSource ID="SQLDataSourceCRUDproductos" runat="server" ConnectionString="<%$ ConnectionStrings:Recuperatorio1ConnectionString %>" DeleteCommand="DELETE FROM [productos] WHERE [id] = @id" InsertCommand="INSERT INTO [productos] ([descripcion]) VALUES (@descripcion)" ProviderName="<%$ ConnectionStrings:Recuperatorio1ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [productos]" UpdateCommand="UPDATE [productos] SET [descripcion] = @descripcion WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="descripcion" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SQLDataSourceSelectListBox" runat="server" ConnectionString="<%$ ConnectionStrings:Recuperatorio1ConnectionString %>" SelectCommand="SELECT * FROM [productos] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
