using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class pgStudAnnouncement : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=DESKTOP-MA4LFEE\\SQLEXPRESS;Initial Catalog=CollegeSocial;Integrated Security=true";
        SqlDataSource1.SelectCommand = "SELECT info,  ADate, subject FROM TeacherAnnouncement where Astatus='ON'";
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}