using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace assignment_system2
{
    public partial class show : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            all_del.Attributes["OnClick"] = "return confirm('确认删除吗?')";
            if (Session["User_id"] == null)
            {

                Response.Redirect("~/Account/Login.aspx");
                
            }
            else
            {
                Label2.Text = Session["User_name"].ToString();
                SqlDataSource1.SelectCommand = "SELECT [assignmentid], [title], [chapter], [begintime], [endtime], [type], [status] FROM [tbl_assignment] where [teacherid]=" + Session["User_id"].ToString();
            }
                
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cbox = (CheckBox)(GridView1.Rows[i].FindControl("CheckBox1"));
                if (CheckBox2.Checked == true)
                {
                    cbox.Checked = true;
                }
                else
                {
                    cbox.Checked = false;
                }
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            Response.Redirect("add.aspx");
        }

        protected void all_del_Click(object sender, EventArgs e)
        {
            //批量删除按钮
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection("server=wuzhenquan-pc\\Sqlexpress;uid=sa;pwd=;database=assignment_system");
            con.Open();
            //sql命令
            System.Data.SqlClient.SqlCommand com;            
            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (cbox.Checked == true)  //假如已经打上勾了
                {
                    string sqlstr = "delete from tbl_assignment where assignmentid='" + GridView1.DataKeys[i].Value + "'";
                    //从表中删除打着勾的那条
                    com = new SqlCommand(sqlstr, con);
                    com.ExecuteNonQuery(); //命令 返回受影响的行数
                }
            }
            con.Close();
            ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert(\'被选项已成功被删除!\');setTimeout(function(){location.href='show.aspx'},3000);  </script>");

        }
    }
}