using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Recuperatorio1
{
    public partial class GestionProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int result = SQLDataSourceCRUDproductos.Insert();
            if (result > 0)
            {
                Label1.Text = "Se agrego el producto.";
                TextBox1.Text = string.Empty;
            }
            else
            {
                Label1.Text = "No se agrego el producto.";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int result = SQLDataSourceCRUDproductos.Delete();
            if (result > 0)
            {
                Label1.Text = "Se eliminó el producto.";
                TextBox2.Text = "";
            }
            else
            {
                Label1.Text = "No se eliminó el producto.";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SQLDataSourceCRUDproductos.UpdateParameters["id"].DefaultValue = ListBox1.SelectedValue;
            int result = SQLDataSourceCRUDproductos.Update();

            if (result > 0)
            {
                Label1.Text = "Se actualizó el producto.";
                TextBox2.Text = "";
            }
            else
            {
                Label1.Text = "No se actualizó el producto.";
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SQLDataSourceSelectListBox.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SQLDataSourceSelectListBox.Select(DataSourceSelectArguments.Empty);
            if (reader.Read())
            {
                TextBox2.Text = reader["descripcion"].ToString();
            }
        }
    }
}