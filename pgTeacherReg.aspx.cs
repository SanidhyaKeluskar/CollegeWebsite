using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class pgTeacherReg : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=DESKTOP-MA4LFEE\\SQLEXPRESS;Initial Catalog=CollegeSocial;Integrated Security=true";
        Auto_Gen();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int count = 0;
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*) from TeacherReg where teachermail='" + txtEmail.Text + "'";
        rs = cmd.ExecuteReader();
        while (rs.Read())
        {
            count = Convert.ToInt32(rs.GetValue(0).ToString());
        }
        cmd.Dispose();
        cn.Close();

        if (count == 0)
        {
            file.PostedFile.SaveAs(Server.MapPath("~\\TeacherFiles\\" + file.FileName.ToString().Replace(" ", "")));  

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "insert into TeacherReg values('" + txtId.Text + "','" + txtName.Text + "','" + txtAddress.Text + "','" + txtMobile.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "','" + txtDepartment.Text + "','" + txtDesignation.Text + "','" + file.FileName.ToString() + "','OFF','" + txtHint.Text + "')";
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cn.Close();
            txtHint.Text = "";
            lblMessage.Text = "Registered Successfully";
            txtName.Text = "";
            txtAddress.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtRPassword.Text = "";
            txtDesignation.Text = "";
            txtDepartment.Text = "";
            Auto_Gen();
        }
        else
        {
            lblMessage.Text = "User Already Exist";
        }
    }
    private void Auto_Gen()
    {
        int cnt;
        string id;
        int temp;
        temp = 0;
        cnt = 0;
        id = "";
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*) from TeacherReg";
        rs = cmd.ExecuteReader();
        while (rs.Read())
        {
            cnt = int.Parse(rs.GetValue(0).ToString());
        }
        rs.Close();
        cmd.Dispose();
        cn.Close();
        if (cnt > 0)
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select max(id) from TeacherReg";
            rs = cmd.ExecuteReader();
            while (rs.Read())
            {
                id = rs.GetValue(0).ToString();
            }
            rs.Close();
            cmd.Dispose();
            cn.Close();
            temp = int.Parse(id.Substring(1, 9));
            temp++;
            id = "";
            id = temp.ToString();
            if (id.Length == 1)
            {
                id = "M00000000" + id;
            }
            else if (id.Length == 2)
            {
                id = "M0000000" + id;
            }
            else if (id.Length == 3)
            {
                id = "M000000" + id;
            }
            else if (id.Length == 4)
            {
                id = "M00000" + id;
            }
            else if (id.Length == 5)
            {
                id = "M0000" + id;
            }
            else if (id.Length == 6)
            {
                id = "M000" + id;
            }
            else if (id.Length == 7)
            {
                id = "M00" + id;
            }
            else if (id.Length == 8)
            {
                id = "M0" + id;
            }
            else if (id.Length == 9)
            {
                id = "M" + id;
            }
            txtId.Text = id;
        }
        else
        {
            txtId.Text = "M000000001";
        }
    } 
}