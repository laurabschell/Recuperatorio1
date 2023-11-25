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
            
        }

    }
}