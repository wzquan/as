using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace assignment_system2.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void login_Click(object sender, EventArgs e)
        {
            //System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection("server=wuzhenquan-pc\\Sqlexpress;uid=sa;pwd=;database=assignment_system");
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection("Server=353f9297-aa49-4cd5-95f8-a1eb01165a1e.sqlserver.sequelizer.com;Database=db353f9297aa494cd595f8a1eb01165a1e;User ID=ubvrghoyycugbust;Password=ZTw42Tc3u5ZFkEueMvzLFasyUMF4cjBLv3LdChTe86utAbVzTSJQvfnYA6hnmhYk;");
        con.Open();
 
        string strSql = "select * from tbl_user where userid='" + LoginUser.UserName.ToString() + "' and password='" + LoginUser.Password.ToString() + "'";
 
        System.Data.SqlClient.SqlCommand com = new System.Data.SqlClient.SqlCommand(strSql, con);
 
        System.Data.SqlClient.SqlDataReader dr = com.ExecuteReader();
 
        if (dr.Read())
 
        {
 
           // e.Authenticated = true;//通过验证 
            Session["User_ID"] = dr.GetString(0);
            Session["User_name"] = dr.GetString(1);
 
            Session["PassWord"] = LoginUser.Password.ToString();
 
            Session["UserType"] = dr.GetString(3);
            FormsAuthentication.SetAuthCookie(LoginUser.UserName.ToString(), true);
            dr.Close();
            con.Close();
            Response.Redirect("../show.aspx?userid="+LoginUser.UserName.ToString());
        }
 
        else
        {
            dr.Close();
            con.Close();
            ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert(\'登录失败！\');setTimeout(function(){location.href='Default.aspx'},3000);  </script>");
            //e.Authenticated = false;
            //LoginUser.loginLebel.Text="用户名或密码不正确，登录失败！";
 
        }
 


        }

    }
}
