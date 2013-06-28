<%@ Page Title="题目详情" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="info.aspx.cs" Inherits="assignment_system2.info" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div _designerregion="0">
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="assignmentid,select" 
            DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                    </td>
                    <td>
                        <asp:Label ID="assignmentidLabel" runat="server" 
                            Text='<%# Eval("assignmentid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="selectLabel" runat="server" Text='<%# Eval("select") %>' />
                    </td>
                    <td>
                        <asp:Label ID="contentLabel" runat="server" Text='<%# Eval("content") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                    </td>
                    <td>
                        <asp:Label ID="assignmentidLabel1" runat="server" 
                            Text='<%# Eval("assignmentid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="selectLabel1" runat="server" Text='<%# Eval("select") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="contentTextBox" runat="server" Text='<%# Bind("content") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            未返回数据。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                    </td>
                    <td>
                        <asp:TextBox ID="assignmentidTextBox" runat="server" 
                            Text='<%# Bind("assignmentid") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="selectTextBox" runat="server" Text='<%# Bind("select") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="contentTextBox" runat="server" Text='<%# Bind("content") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                    </td>
                    <td>
                        <asp:Label ID="assignmentidLabel" runat="server" 
                            Text='<%# Eval("assignmentid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="selectLabel" runat="server" Text='<%# Eval("select") %>' />
                    </td>
                    <td>
                        <asp:Label ID="contentLabel" runat="server" Text='<%# Eval("content") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">
                                    </th>
                                    <th runat="server">
                                        作业ID</th>
                                    <th runat="server">
                                        选项</th>
                                    <th runat="server">
                                        内容</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                    </td>
                    <td>
                        <asp:Label ID="assignmentidLabel" runat="server" 
                            Text='<%# Eval("assignmentid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="selectLabel" runat="server" Text='<%# Eval("select") %>' />
                    </td>
                    <td>
                        <asp:Label ID="contentLabel" runat="server" Text='<%# Eval("content") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:assignment_systemConnectionString %>" 
            DeleteCommand="DELETE FROM [tbl_select] WHERE [assignmentid] = @assignmentid AND [select] = @select" 
            InsertCommand="INSERT INTO [tbl_select] ([assignmentid], [select], [content]) VALUES (@assignmentid, @select, @content)" 
            SelectCommand="SELECT * FROM [tbl_select] WHERE ([assignmentid] = @assignmentid)" 
            UpdateCommand="UPDATE [tbl_select] SET [content] = @content WHERE [assignmentid] = @assignmentid AND [select] = @select">
            <DeleteParameters>
                <asp:Parameter Name="assignmentid" Type="String" />
                <asp:Parameter Name="select" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="assignmentid" Type="String" />
                <asp:Parameter Name="select" Type="String" />
                <asp:Parameter Name="content" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="assignmentid" QueryStringField="as_id" 
                    Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="content" Type="String" />
                <asp:Parameter Name="assignmentid" Type="String" />
                <asp:Parameter Name="select" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>