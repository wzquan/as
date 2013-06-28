<%@ Page Title="作业库" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="show.aspx.cs" Inherits="assignment_system2.show" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <asp:Label ID="Label1" runat="server" Text=",你能操作的作业库如下："></asp:Label>
    </h2>
<p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="assignmentid" 
            DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="选择">
                <ItemTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="assignmentid" HeaderText="作业ID" ReadOnly="True" 
                    SortExpression="assignmentid" />
                <asp:BoundField DataField="title" HeaderText="题目" 
                    SortExpression="title" />
                <asp:BoundField DataField="chapter" HeaderText="章节" 
                    SortExpression="chapter" />
                <asp:BoundField DataField="begintime" HeaderText="开始时间" 
                    SortExpression="begintime" />
                <asp:BoundField DataField="endtime" HeaderText="结束时间" 
                    SortExpression="endtime" />
                <asp:BoundField DataField="type" HeaderText="类型" SortExpression="type" />
                <asp:BoundField DataField="status" HeaderText="状态" 
                    SortExpression="status" />
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="删除" OnClientClick="return confirm('确认删除该条记录吗?');"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFormatString="~/info.aspx?as_id={0}&type={1}" Text="详情" DataNavigateUrlFields="assignmentid,type"/>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:assignment_systemConnectionString %>" 
            DeleteCommand="DELETE FROM [tbl_assignment] WHERE [assignmentid] = @assignmentid" 
            InsertCommand="INSERT INTO [tbl_assignment] ([assignmentid], [title], [chapter], [begintime], [endtime], [type], [status]) VALUES (@assignmentid, @title, @chapter, @begintime, @endtime, @type, @status)" 
            SelectCommand="SELECT [assignmentid], [title], [chapter], [begintime], [endtime], [type], [status] FROM [tbl_assignment]" 
            
            
            
            UpdateCommand="UPDATE [tbl_assignment] SET [title] = @title, [chapter] = @chapter, [begintime] = @begintime, [endtime] = @endtime, [type] = @type, [status] = @status WHERE [assignmentid] = @assignmentid">
            <DeleteParameters>
                <asp:Parameter Name="assignmentid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="assignmentid" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="chapter" Type="String" />
                <asp:Parameter Name="begintime" Type="String" />
                <asp:Parameter Name="endtime" Type="String" />
                <asp:Parameter Name="type" Type="Byte" />
                <asp:Parameter Name="status" Type="Byte" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="chapter" Type="String" />
                <asp:Parameter Name="begintime" Type="String" />
                <asp:Parameter Name="endtime" Type="String" />
                <asp:Parameter Name="type" Type="Byte" />
                <asp:Parameter Name="status" Type="Byte" />
                <asp:Parameter Name="assignmentid" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br>
        <asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="CheckBox2_CheckedChanged"
        Text="全选" AutoPostBack="True" /><br>      
        <asp:Button ID="add" runat="server" Text="新增" onclick="add_Click" />
        <asp:Button ID="all_del" runat="server" Text="批量删除" onclick="all_del_Click"/>
    </p>
    </asp:Content>
