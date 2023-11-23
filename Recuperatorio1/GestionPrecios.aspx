<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionPrecios.aspx.cs" Inherits="Recuperatorio1.GestionPrecios" %>

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
             Gestion de Precios<br />
             <br />
             <asp:TextBox ID="TextBox1" runat="server" TextMode="Date" placeholder="Fecha" Width="234px"></asp:TextBox>
        &nbsp;<asp:TextBox ID="TextBox2" placeholder="Monto" runat="server" TextMode="Number"></asp:TextBox>
        &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDropDownProductos" DataTextField="descripcion" DataValueField="id" Width="204px">
             </asp:DropDownList>
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" Width="167px" />
&nbsp;<asp:Button ID="Button2" runat="server" Text="Actualizar" Width="147px" />
             <br />
             <asp:Label ID="Label1" runat="server"></asp:Label>
             <br />
             <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceDropDownPrecios" DataTextField="monto" DataValueField="id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="240px">
             </asp:DropDownList>
&nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Eliminar" Width="171px" />
             <br />
             <br />
             <asp:SqlDataSource ID="SqlDataSourceCRUDprecios" runat="server" ConnectionString="<%$ ConnectionStrings:Recuperatorio1ConnectionString %>" DeleteCommand="DELETE FROM [precios] WHERE [id] = @id" InsertCommand="INSERT INTO [precios] ([fecha], [monto], [idProducto]) VALUES (@fecha, @monto, @idProducto)" SelectCommand="SELECT * FROM [precios]" UpdateCommand="UPDATE [precios] SET [fecha] = @fecha, [monto] = @monto, [idProducto] = @idProducto WHERE [id] = @id">
                 <DeleteParameters>
                     <asp:Parameter Name="id" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:ControlParameter ControlID="TextBox1" DbType="Date" Name="fecha" PropertyName="Text" />
                     <asp:ControlParameter ControlID="TextBox2" Name="monto" PropertyName="Text" Type="Int32" />
                     <asp:ControlParameter ControlID="DropDownList1" Name="idProducto" PropertyName="SelectedValue" Type="Int32" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter DbType="Date" Name="fecha" />
                     <asp:Parameter Name="monto" Type="Int32" />
                     <asp:Parameter Name="idProducto" Type="Int32" />
                     <asp:Parameter Name="id" Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
             <br />
             <asp:SqlDataSource ID="SqlDataSourceDropDownProductos" runat="server" ConnectionString="<%$ ConnectionStrings:Recuperatorio1ConnectionString %>" SelectCommand="SELECT * FROM [productos]"></asp:SqlDataSource>
             <br />
             <asp:SqlDataSource ID="SqlDataSourceDropDownPrecios" runat="server" ConnectionString="<%$ ConnectionStrings:Recuperatorio1ConnectionString %>" SelectCommand="SELECT * FROM [precios]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
