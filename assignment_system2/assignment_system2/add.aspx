<%@ Page Title="增加操作" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="add.aspx.cs" Inherits="assignment_system2.add" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    
<asp:Table ID="Table1" runat="server" HorizontalAlign="Center" Height="384px" 
        Width="309px">

   <asp:TableRow> 
     <asp:TableCell><asp:Label runat="server" Text="作业ID" ID="Label1"></asp:Label>
       </asp:TableCell>
     <asp:TableCell><asp:TextBox runat="server" ID="tb_id"></asp:TextBox>
       </asp:TableCell>
     <asp:TableCell ForeColor="Red" HorizontalAlign="Left" Width="150"> <asp:RequiredFieldValidator runat="server" ErrorMessage="不能重复或空！" ControlToValidate="tb_id" ValidationGroup="insertgroup">
       </asp:RequiredFieldValidator>
       </asp:TableCell>
   </asp:TableRow>       
       <asp:TableRow>
     <asp:TableCell><asp:Label ID="Label2" runat="server" Text="题目"></asp:Label>
           </asp:TableCell>
     <asp:TableCell><asp:TextBox ID="tb_title"
         runat="server">
       </asp:TextBox>
           </asp:TableCell>
       <asp:TableCell ForeColor="Red" HorizontalAlign="Left" Width="150"> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" ControlToValidate="tb_title" ValidationGroup="insertgroup">
       </asp:RequiredFieldValidator>
           </asp:TableCell>
   </asp:TableRow>
   <asp:TableRow> 
     <asp:TableCell><asp:Label ID="Label3" runat="server" Text="章节"></asp:Label>
       </asp:TableCell>
     <asp:TableCell><asp:TextBox ID="tb_chapter" runat="server">
    </asp:TextBox>
       </asp:TableCell>
    <asp:TableCell ForeColor="Red" HorizontalAlign="Left" Width="150"> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不能为空" ControlToValidate="tb_chapter" ValidationGroup="insertgroup">
       </asp:RequiredFieldValidator>
       </asp:TableCell>
   </asp:TableRow>
      <asp:TableRow>
     <asp:TableCell><asp:Label ID="Label4" runat="server" Text="开始时间" Width="80"></asp:Label>
          
          </asp:TableCell>
     <asp:TableCell><asp:Calendar runat="server" ID="cd_begin"></asp:Calendar>
          </asp:TableCell>
   </asp:TableRow>
   <asp:TableRow> 
     <asp:TableCell><asp:Label ID="Label5" runat="server" Text="结束时间"></asp:Label>
       </asp:TableCell>
     <asp:TableCell><asp:Calendar ID="cd_end" runat="server"></asp:Calendar>
       </asp:TableCell>
   </asp:TableRow>
      <asp:TableRow>
     <asp:TableCell><asp:Label ID="Label6" runat="server" Text="题型"></asp:Label>
          </asp:TableCell>
     <asp:TableCell><asp:TextBox ID="tb_type"
         runat="server">
       </asp:TextBox>
          </asp:TableCell>
       <asp:TableCell ForeColor="Red" HorizontalAlign="Left" Width="150"> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="不能为空" ControlToValidate="tb_type" ValidationGroup="insertgroup">
       </asp:RequiredFieldValidator>
          </asp:TableCell>
   </asp:TableRow>
   <asp:TableRow> 
     <asp:TableCell><asp:Label ID="Label7" runat="server" Text="状态"></asp:Label>
       </asp:TableCell>
     <asp:TableCell><asp:TextBox ID="tb_status" runat="server">
    </asp:TextBox>
       </asp:TableCell>
    <asp:TableCell ForeColor="Red" HorizontalAlign="Left" Width="150"> <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="不能为空" ControlToValidate="tb_status" ValidationGroup="insertgroup">
       </asp:RequiredFieldValidator>
       </asp:TableCell>
   </asp:TableRow>
<asp:TableRow> 
   <asp:TableCell><asp:Button ID="insert" runat="server" Text="插入"  OnClick="insert_Click" ValidationGroup="insertgroup"/>
    
    </asp:TableCell>
       <asp:TableCell><asp:Button ID="cancel" runat="server" Text="取消"  OnClick="cancel_Click"/>
    </asp:TableCell>
       </asp:TableRow>
</asp:Table>
</asp:Content>
