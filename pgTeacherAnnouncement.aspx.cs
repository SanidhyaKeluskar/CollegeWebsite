using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class pgTeacherAnnouncement : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=DESKTOP-MA4LFEE\\SQLEXPRESS;Initial Catalog=CollegeSocial;Integrated Security=true";
        if (!IsPostBack)
        {
            Auto_Gen();
            string teachername = "";
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "Select teachername from TeacherReg where id='" + Session["userid"].ToString() + "'";
            rs = cmd.ExecuteReader();
            while (rs.Read())
            {
                teachername = rs.GetValue(0).ToString();
            }
            rs.Close();
            cmd.Dispose();
            cn.Close();
            SqlDataSource2.SelectCommand = "Select id,info,Astatus,Adate,subject from TeacherAnnouncement where teacherid='" + Session["userid"].ToString() + "'";
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string teachername="";
        cn.Open();
        cmd.Connection=cn;
        cmd.CommandText="Select teachername from TeacherReg where id='"+Session["userid"].ToString()+"'";
        rs=cmd.ExecuteReader();
        while(rs.Read())
        {
            teachername=rs.GetValue(0).ToString();
        }
        rs.Close();
        cmd.Dispose();
        cn.Close();

        if (btnSave.Text == "Save Data")
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "insert into teacherannouncement values('" + txtId.Text + "','" + txtInfo.Text + "','" + cmbStatus.Text + "','" + txtDate.Text + "','"+txtSubject.Text+ "','" + Session["userid"].ToString() + "')";
            cmd.ExecuteNonQuery();
            cn.Close();
            lblMessage.Text = "Data Saved Successfully";

        }
        else
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "Update teacherannouncement Set subject='"+txtSubject.Text+"',Info='" + txtInfo.Text + "', AStatus='" + cmbStatus.Text + "',ADate='" + txtDate.Text + "' where Id='" + txtId.Text + "'";
            cmd.ExecuteNonQuery();
            cn.Close();
            lblMessage.Text = "Data Updated Successfully";

        }
        txtInfo.Text = "";
        txtDate.Text = "";
        cmbStatus.SelectedIndex = 0;
        SqlDataSource2.SelectCommand = "Select id,info,Astatus,Adate,subject from TeacherAnnouncement where teacherid='" + Session["userid"].ToString() + "'";
        Auto_Gen();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        txtId.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtInfo.Text = GridView1.SelectedRow.Cells[2].Text.ToString();
        txtDate.Text = GridView1.SelectedRow.Cells[4].Text.ToString();
        cmbStatus.SelectedIndex = cmbStatus.Items.IndexOf(cmbStatus.Items.FindByText(GridView1.SelectedRow.Cells[3].Text.ToString()));
        txtSubject.Text = GridView1.SelectedRow.Cells[5].Text.ToString();
        btnSave.Text = "Edit Data";
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
        cmd.CommandText = "select count(*) from teacherannouncement";
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
            cmd.CommandText = "select max(id) from teacherannouncement";
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
                id = "E00000000" + id;
            }
            else if (id.Length == 2)
            {
                id = "E0000000" + id;
            }
            else if (id.Length == 3)
            {
                id = "E000000" + id;
            }
            else if (id.Length == 4)
            {
                id = "E00000" + id;
            }
            else if (id.Length == 5)
            {
                id = "E0000" + id;
            }
            else if (id.Length == 6)
            {
                id = "E000" + id;
            }
            else if (id.Length == 7)
            {
                id = "E00" + id;
            }
            else if (id.Length == 8)
            {
                id = "E0" + id;
            }
            else if (id.Length == 9)
            {
                id = "E" + id;
            }
            txtId.Text = id;
        }
        else
        {
            txtId.Text = "E000000001";
        }
    }

}