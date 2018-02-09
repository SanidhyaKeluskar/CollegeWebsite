using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class pgDownloadEntry : System.Web.UI.Page
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
        File.PostedFile.SaveAs(Server.MapPath("~\\Download\\" + File.FileName.ToString().Replace(" ", "")));
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into DownloadEntry values('" + txtId.Text +"','" + txtFileName.Text +"','" + txtFileType.Text +"','" + File.FileName.Replace(" ","").ToString() +"','" + txtDesc.Text +"')";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

        txtFileName.Text = "";
        txtFileType.Text = "";
        txtDesc.Text = "";
        lblMessage.Text = "Record Saved Successfully";
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
        cmd.CommandText = "select count(*) from DownloadEntry";
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
            cmd.CommandText = "select max(id) from DownloadEntry";
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