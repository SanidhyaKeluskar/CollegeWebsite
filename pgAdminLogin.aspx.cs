using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class pgAdminLogin : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=DESKTOP-MA4LFEE\\SQLEXPRESS;Initial Catalog=CollegeSocial;Integrated Security=true";
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        int cnt = 0;
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "Select count(*) from AdminLogin where username='"+txtEmail.Text+"' and password='"+txtPassword.Text+"'";
        rs = cmd.ExecuteReader();
        while (rs.Read())
        {
            cnt = Convert.ToInt32(rs.GetValue(0).ToString());
        }
        rs.Close();
        cmd.Dispose();
        cn.Close();

        if (cnt != 0)
        {
            Session["Admin"] = txtEmail.Text;
            Response.Redirect("pgAdminHome.aspx");
        }
        else
        {
            lblMessage.Text = "Incorrect Username/Password";
        }
    }
}