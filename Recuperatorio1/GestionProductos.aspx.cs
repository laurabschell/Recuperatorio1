using System;
using System.Collections.Generic;
using System.Data;
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
                Label1.Text = "Se borro el producto.";
            }
            else
            {
                Label1.Text = "No se borro el producto.";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SQLDataSourceCRUDproductos.UpdateParameters["id"].DefaultValue = DropDownList1.SelectedValue;
            int result = SQLDataSourceCRUDproductos.Update();

            if (result > 0)
            {
                Label1.Text = "Se actualizo el producto.";
            }
            else
            {
                Label1.Text = "No se actualizo el producto.";
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv = (DataView)SQLDataSourceSelectDropDown.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count > 0)
            {
                DataRowView row = dv[0];
                TextBox1.Text = row["descripcion"].ToString();
                DropDownList1.SelectedValue = row["id"].ToString();
            }
        }

    }
}