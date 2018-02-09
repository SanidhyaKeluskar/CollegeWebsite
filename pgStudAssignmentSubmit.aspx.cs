using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class pgStudAssignmentSubmit : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=DESKTOP-MA4LFEE\\SQLEXPRESS;Initial Catalog=CollegeSocial;Integrated Security=true";
        txtUserId.Text = Session["userID"].ToString();
        txtAssignmentId.Text = Session["AssignmentId"].ToString();
        if (!IsPostBack)
        {
            Auto_Gen();
            SqlDataSource1.SelectCommand = "SELECT id, AssignmentId, UserId, Date, AFile, AStatus FROM AssignmentSubmission where UserId='" + txtUserId.Text + "'";
           
        }
    }
    protected void btnSave_Click(object Sender, EventArgs e)
    {
        File.PostedFile.SaveAs(Server.MapPath("~\\Assignment\\" + File.FileName.ToString().Replace(" ", " ")));

        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into AssignmentSubmission values('" + txtId.Text + "','" + txtAssignmentId.Text + "','" + txtUserId.Text + "','" + System.DateTime.Now + "','" + File.FileName.ToString() + "','Pending')";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
        SqlDataSource1.SelectCommand = "SELECT id, AssignmentId, UserId, Date, AFile, AStatus FROM AssignmentSubmission where UserId='" + txtUserId.Text + "'";
        lblMessage.Text = "Message Submitted";
        Auto_Gen();
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
        cmd.CommandText = "select count(*) from AssignmentSubmission";
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
            cmd.CommandText = "select max(id) from AssignmentSubmission";
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
                id = "A00000000" + id;
            }
            else if (id.Length == 2)
            {
                id = "A0000000" + id;
            }
            else if (id.Length == 3)
            {
                id = "A000000" + id;
            }
            else if (id.Length == 4)
            {
                id = "A00000" + id;
            }
            else if (id.Length == 5)
            {
                id = "A0000" + id;
            }
            else if (id.Length == 6)
            {
                id = "A000" + id;
            }
            else if (id.Length == 7)
            {
                id = "A00" + id;
            }
            else if (id.Length == 8)
            {
                id = "A0" + id;
            }
            else if (id.Length == 9)
            {
                id = "A" + id;
            }
            txtId.Text = id;
        }
        else
        {
            txtId.Text = "A000000001";
        }
    }
}
