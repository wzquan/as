using System; 
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment_system2
{
    public partial class add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cd_begin.SelectedDate = DateTime.Now;
                cd_end.SelectedDate = DateTime.Now;
            }	
        }
        protected void cancel_Click(object sender, EventArgs e)
        {
           Response.Redirect("show.aspx");
        }
        protected void insert_Click(object sender, EventArgs e)
        {
            int flag = 0;
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection("server=wuzhenquan-pc\\Sqlexpress;uid=sa;pwd=;database=assignment_system");
            con.Open();
            string strSql = "select * from tbl_assignment where assignmentid='" + tb_id.Text+"'";
 
            System.Data.SqlClient.SqlCommand com = new System.Data.SqlClient.SqlCommand(strSql, con);
 
            System.Data.SqlClient.SqlDataReader dr = com.ExecuteReader();         
            if (dr.Read())
            {

                ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert(\'作业ID重复，插入失败!\');setTimeout(function(){location.href='add.aspx'},3000);  </script>");
            }
            else
            {   con.Close();
                con = new System.Data.SqlClient.SqlConnection("server=wuzhenquan-pc\\Sqlexpress;uid=sa;pwd=;database=assignment_system");
                con.Open();
                strSql = "INSERT INTO [tbl_assignment] ([assignmentid], [teacherid], [title], [chapter], [begintime], [endtime], [type], [status]) VALUES ('"
                    + tb_id.Text + "','" + Session["User_id"].ToString() + "','" + tb_title.Text + "','" + tb_chapter.Text + "','" + cd_begin.SelectedDate + "','" + cd_end.SelectedDate + "'," + tb_type.Text + "," + tb_status.Text + ")";
                com = new System.Data.SqlClient.SqlCommand(strSql, con);
                flag = com.ExecuteNonQuery();
                con.Close();
                if (flag >= 1)
                {
                    //Response.Write("<script language=javascript>alert('插入成功！')</script>");
                    ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert(\'插入成功!\');setTimeout(function(){location.href='show.aspx'},1);  </script>");

                }
                else
                    Response.Write("<script language=javascript>alert('插入失败！')</script>");
            }

        }
    }
}