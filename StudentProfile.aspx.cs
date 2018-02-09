using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Collections;
using System.Net;
using System.Net.Mail;

public partial class StudentProfile : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection();
    SqlCommand cmd = new SqlCommand();
    SqlDataReader rs;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.ConnectionString = "Data Source=DESKTOP-MA4LFEE\\SQLEXPRESS;Initial Catalog=CollegeSocial;Integrated Security=true";
        if (!IsPostBack)
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "Select * from StudentInterest where StudentID ='" + Session["Username"].ToString() + "'";
            rs = cmd.ExecuteReader();
            while (rs.Read())
            {
                txtHobbies.Text = rs.GetValue(3).ToString();
            }
            rs.Close();
            cmd.Dispose();
            cn.Close();

            string toid = "";
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "Select * from StudentBuddy where FromID='"+Session["Username"].ToString()+"'";
            rs=cmd.ExecuteReader();
            while (rs.Read())
            {
                toid = rs.GetValue(3).ToString();
            }
            rs.Close();
            cmd.Dispose();
            cn.Close();

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "Select * from StudReg where StudMail='" + toid + "'";
            rs = cmd.ExecuteReader();
            while (rs.Read())
            {
                lblName.Text = rs.GetValue(1).ToString();
                lblEmail.Text = toid;
            }
            rs.Close();
            cmd.Dispose();
            cn.Close();
        }
    }

    private string Auto_Gen()
    {
        int cnt;
        string id;
        int temp;
        temp = 0;
        cnt = 0;
        id = "";
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select count(*) from StudentInterest";
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
            cmd.CommandText = "select max(id) from StudentInterest";
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
                id = "H00000000" + id;
            }
            else if (id.Length == 2)
            {
                id = "H0000000" + id;
            }
            else if (id.Length == 3)
            {
                id = "H000000" + id;
            }
            else if (id.Length == 4)
            {
                id = "H00000" + id;
            }
            else if (id.Length == 5)
            {
                id = "H0000" + id;
            }
            else if (id.Length == 6)
            {
                id = "H000" + id;
            }
            else if (id.Length == 7)
            {
                id = "H00" + id;
            }
            else if (id.Length == 8)
            {
                id = "H0" + id;
            }
            else if (id.Length == 9)
            {
                id = "H" + id;
            }
            return id;
        }
        else
        {
            return "H000000001";
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "Delete from StudentInterest where StudentID ='" + Session["Username"].ToString() + "'";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

        string year = "";
        string branch="";
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select StudYear,StudBranch from StudReg where StudMail='" + Session["Username"].ToString() + "'";
        rs = cmd.ExecuteReader();
        while (rs.Read())
        {
            year = rs.GetValue(0).ToString();
            branch = rs.GetValue(1).ToString();
        }
        rs.Close();
        cmd.Dispose();
        cn.Close();

        string buddy_year = "";
        if (year == "F.E")
        {
            buddy_year = "S.E";
        }
        else if (year == "S.E")
        {
            buddy_year = "TE";
        }
        else if (year == "T.E")
        {
            buddy_year = "B.E";
        }

        string id=Auto_Gen();
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into StudentInterest values('" + id + "','" + Session["Username"].ToString() + "','" + year + "','" + txtHobbies.Text + "','" + branch + "')";
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        cn.Close();

        Regex reg = new Regex(" |,");
        ArrayList arr_hobbies= new ArrayList();
        arr_hobbies.Clear();

        foreach (string s in reg.Split(txtHobbies.Text))
        {
            if (s != "")
            {
                arr_hobbies.Add(s);
            }
        }

        

        if (buddy_year == "")
        {
        }
        else
        {
            ArrayList arr_studentid = new ArrayList();
            arr_studentid.Clear();

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "select si.StudentID from StudentInterest si LEFT JOIN StudentBuddy sb ON si.StudentID!=sb.FromID  Where si.Year='" + buddy_year + "' and si.branch='" + branch + "'";
            rs = cmd.ExecuteReader();
            while (rs.Read())
            {
                arr_studentid.Add(rs.GetValue(0).ToString());
            }
            rs.Close();
            cmd.Dispose();
            cn.Close();

            ArrayList arr_studenthobbies = new ArrayList();
            arr_studenthobbies.Clear();

            for (int i = 0; i < arr_studentid.Count; i++)
            {
                cn.Open();
                cmd.Connection = cn;
                cmd.CommandText = "select * from StudentInterest where StudentID='" + arr_studentid[i].ToString() + "'";
                rs = cmd.ExecuteReader();
                while (rs.Read())
                {
                    arr_studenthobbies.Add(rs.GetValue(3).ToString());
                }
                rs.Close();
                cmd.Dispose();
                cn.Close();

            }

            ArrayList arr_StudentCount = new ArrayList();
            arr_StudentCount.Clear();
            for (int i = 0; i < arr_studenthobbies.Count; i++)
            {
                int cnt = 0;
                for (int j = 0; j < arr_hobbies.Count; j++)
                {
                    foreach (string s in reg.Split(arr_studenthobbies[i].ToString()))
                    {
                        if (s != "")
                        {
                            string temp1 = arr_hobbies[j].ToString().ToLower();
                            string temp2 = s.ToLower();
                            if (temp1 == temp2)
                            {
                                cnt++;
                            }
                        }
                    }
                }
                arr_StudentCount.Add(cnt);
            }

            for (int i = 0; i < arr_StudentCount.Count; i++)
            {
                for (int j = 0; j < arr_StudentCount.Count; j++)
                {
                    if (Convert.ToInt32(arr_StudentCount[i].ToString()) > Convert.ToInt32(arr_StudentCount[j].ToString()))
                    {
                        //Sort ID ARRAY
                        string temp = arr_studentid[i].ToString();
                        arr_studentid[i] = arr_studentid[j].ToString();
                        arr_studentid[j] = temp;

                        //Sort Count ARRAY
                        temp = arr_StudentCount[i].ToString();
                        arr_StudentCount[i] = arr_StudentCount[j].ToString();
                        arr_StudentCount[j] = temp;
                    }
                }
            }

            if (arr_studentid.Count > 0)
            {
                cn.Open();
                cmd.Connection = cn;
                cmd.CommandText = "insert into StudentBuddy values('" + year + "','" + buddy_year + "','" + Session["Username"].ToString() + "','" + arr_studentid[0].ToString() + "')";
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                cn.Close();

                cn.Open();
                cmd.Connection = cn;
                cmd.CommandText = "Select * from StudReg where StudMail='" + arr_studentid[0].ToString() + "'";
                rs = cmd.ExecuteReader();
                while (rs.Read())
                {
                    lblName.Text = rs.GetValue(1).ToString();
                    lblEmail.Text=arr_studentid[0].ToString();
                }
                rs.Close();
                cmd.Dispose();
                cn.Close();

                MailMessage m = new MailMessage();
                m.To.Add(arr_studentid[0].ToString());
                m.From = new MailAddress("jaganiparas0@gmail.com");
                m.Subject = "Buddy Assigned";
                m.Body = "You Have Been Assigned As a Buddy to: " + Session["Username"].ToString();

                SmtpClient sc = new SmtpClient("smtp.gmail.com", 587);
                NetworkCredential nc = new NetworkCredential("jaganiparas0@gmail.com", "gmail1266");
                sc.Credentials = nc;
                sc.EnableSsl = true;
                sc.Send(m);
            }
        }

    }
}