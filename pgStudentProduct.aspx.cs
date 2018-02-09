using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class pgStudentProduct : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=DESKTOP-MA4LFEE\\SQLEXPRESS;Initial Catalog=CollegeSocial;Integrated Security=true";
        txtSId.Text = Session["userid"].ToString();
        if (!IsPostBack)
        {
            SqlDataSource1.SelectCommand = "SELECT PType, StudID, PName, PCost, Details, PStatus, Id FROM StudentProduct where StudID='" + Session["userid"].ToString() + "'";
            SqlDataSource2.SelectCommand = "SELECT StudentProduct.PType, StudentProduct.PName, StudentProduct.PCost, StudentProduct.Details, StudReg.StudName, StudReg.StudMobile, StudReg.StudMail FROM StudentProduct INNER JOIN StudReg ON StudentProduct.StudID = StudReg.Id where StudentProduct.StudID!='" + Session["userid"].ToString() + "' and StudentProduct.PStatus!='OFF'";
            Auto_Gen();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (btnSave.Text == "Save Data")
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "insert into StudentProduct values('" + txtId.Text + "','" + txtSId.Text + "','" + txtPType.Text + "','" + txtPName.Text + "','" + txtPCost.Text + "','" + txtDesc.Text + "','OFF')";
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cn.Close();
            lblMessage.Text = "Data Saved Successfully";
        }
        else
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "update StudentProduct set studID='" + txtSId.Text + "',PType='" + txtPType.Text + "',PName='" + txtPName.Text + "',PCost='" + txtPCost.Text + "',Details='" + txtDesc.Text + "' where Id='" + txtId.Text + "'";
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cn.Close();
            lblMessage.Text = "Data Updated Successfully";
        }
        txtSId.Text = "";
        txtPType.Text = "";
        txtPName.Text = "";
        txtPCost.Text = "";
        txtDesc.Text = "";
        //drpStatus.SelectedIndex = 0;
        SqlDataSource1.SelectCommand = "SELECT PType, StudID, PName, PCost, Details, PStatus, Id FROM StudentProduct where StudID='" + Session["userid"].ToString() + "'";
        Auto_Gen();
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "update StudentProduct set studID='" + txtSId.Text + "',PType='" + txtPType.Text + "',PName='" + txtPName.Text + "',PCost='" + txtPCost.Text + "',Details='" + txtDesc.Text + "',PStatus='OFF' where Id='" + txtId.Text + "'";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtId.Text = GridView1.SelectedRow.Cells[7].Text.ToString();
        txtSId.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
        txtPType.Text = GridView1.SelectedRow.Cells[2].Text.ToString();
        txtPName.Text = GridView1.SelectedRow.Cells[3].Text.ToString();
        txtPCost.Text = GridView1.SelectedRow.Cells[4].Text.ToString();
        txtDesc.Text = GridView1.SelectedRow.Cells[5].Text.ToString();
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
        cmd.CommandText = "select count(*) from StudentProduct";
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
            cmd.CommandText = "select max(id) from StudentProduct";
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectCommand = "SELECT StudentProduct.PType, StudentProduct.PName, StudentProduct.PCost, StudentProduct.Details, StudReg.StudName, StudReg.StudMobile, StudReg.StudMail FROM StudentProduct INNER JOIN StudReg ON StudentProduct.StudID = StudReg.Id where PName like '" + txtSearch.Text + "' and PStatus!='OFF' and StudentProduct.StudID!='" + Session["userid"].ToString() + "'";
    }
}