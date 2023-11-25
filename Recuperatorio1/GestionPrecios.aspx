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
&nbsp;<br />
             <asp:Label ID="Label1" runat="server"></asp:Label>
             <br />
             <br />
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSourceCRUDprecios" ForeColor="#333333" GridLines="None" Width="750px">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                     <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                     <asp:BoundField DataField="monto" HeaderText="Monto" SortExpression="monto" />
                     <asp:BoundField DataField="idProducto" HeaderText="idProducto" SortExpression="idProducto" />
                     <asp:CommandField ButtonType="Button" CancelText="Cancelar" DeleteText="Eliminar" EditText="Editar" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Actualizar" />
                 </Columns>
                 <EditRowStyle BackColor="#7C6F57" />
                 <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#E3EAEB" />
                 <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#F8FAFA" />
                 <SortedAscendingHeaderStyle BackColor="#246B61" />
                 <SortedDescendingCellStyle BackColor="#D4DFE1" />
                 <SortedDescendingHeaderStyle BackColor="#15524A" />
             </asp:GridView>
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
        </div>
    </form>
</body>
</html>
