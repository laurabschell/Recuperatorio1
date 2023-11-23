using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Recuperatorio1
{
    public partial class GestionPrecios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int result = SqlDataSourceCRUDprecios.Insert();
            if (result > 0)
            {
                Label1.Text = "Se agrego el precio.";
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
            }
            else
            {
                Label1.Text = "No se agrego el precio.";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int result = SqlDataSourceCRUDprecios.Delete();
            if (result > 0)
            {
                Label1.Text = "Se borro el precio.";
            }
            else
            {
                Label1.Text = "No se borro el precio.";
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSourceDropDownPrecios.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count > 0)
            {
                DataRowView row = dv[0];
                TextBox1.Text = row["fecha"].ToString();
                TextBox2.Text = row["monto"].ToString();
                DropDownList1.SelectedValue = row["idProducto"].ToString();
            }
        }
    }
}