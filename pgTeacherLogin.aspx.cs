using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class pgTeacherLogin : System.Web.UI.Page
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
        cmd.CommandText = "Select count(*) from TeacherReg where Teachermail='" + txtEmail.Text + "' and Teacherpassword='" + txtPassword.Text + "'";
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
            int cnt1 = 0;
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "Select count(*) from TeacherReg where Teachermail='" + txtEmail.Text + "' and Teacherstatus='ON'";
            rs = cmd.ExecuteReader();
            while (rs.Read())
            {
                cnt1 = Convert.ToInt32(rs.GetValue(0).ToString());
            }
            rs.Close();
            cmd.Dispose();
            cn.Close();

            if (cnt1 != 0)
            {

                Response.Redirect("pgteacherhome.aspx");
            }
            else
            {
                lblMessage.Text = "Your Status is Off Please Contact Admin";
            }
        }
        else
        {
            lblMessage.Text = "Incorrect Username/Password";
        }
    }
}