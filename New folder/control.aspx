<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="control.aspx.cs" Inherits="whatslink.control" MaintainScrollPositionOnPostback="true" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Control</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            color: #003300;
        }
    </style>

</head>


<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="170000" ></asp:ScriptManager>

        <div class="w3-container">
            <h2>Control page</h2>
            <p>You can manage evry thing for your site here.</p>

            <div class="w3-bar w3-black">
                <%-- <button  class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event,'London')">London</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Paris')">Paris</button>
    <button class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo')">Tokyo</button>--%>
                <input type="button" value="Campaign" class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event, 'Campaign')" />
                <input type="button" value="Upload" class="w3-bar-item w3-button tablink " onclick="openCity(event, 'Upload')" />
                <input type="button" value="Files" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'Files')" />
                <input type="button" value="Users" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'Users')" />
                <input type="button" value="Clients" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'Clients')" />
                <input type="button" value="Send" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'Send')"  style="display: none" />
                <input type="button" value="Report" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'Report')" />
                <input type="button" value="PullData" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'PullData')" />
                <input type="button" value="Leader Users" class="w3-bar-item w3-button tablink " onclick="openCity(event, 'Leader Users')" />
                <input type="button" value="Get Senders" class="w3-bar-item w3-button tablink " onclick="openCity(event, 'Get Senders')" />
                <asp:Button ID="btn_send" runat="server" Text="Send" class="w3-bar-item w3-button tablink" OnClick="btn_send_Click"/>
            </div>

            <div id="Campaign" class="w3-container w3-border city w3-animate-right">
                <h2>Campaign</h2>
                <p>You can start your Campaign here and insert it to database and locate users to send this numbers.</p>
                <div>
                   
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">

                        <ContentTemplate>
                            &nbsp; <strong>Selected file rows count :</strong>
                            <asp:Label ID="Label_rowcount" runat="server" Style="font-weight: 700; color: #000099" Text="Rows count"></asp:Label>
                            <br />
                            <br />

                            <strong>Files:&nbsp;&nbsp; </strong>&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Height="30px" OnLoad="DropDownList1_Load" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="250px" AutoPostBack="True"></asp:DropDownList>
                            
                            <asp:Button ID="btn_loadfiles" runat="server" Style=" margin:4px 4px 4px 4px" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-small" OnClick="btn_loadfiles_Click" Text="Load files" Width="92px" />
                            <br />

                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" SelectCommand="SELECT [Id], [Client Name] AS Client_Name FROM [clients]"></asp:SqlDataSource>
                            <strong>Clients:</strong>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="Client_Name" DataValueField="Id" Height="30px" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                            </asp:DropDownList>
                            
                            <asp:Button ID="btn_refreshclient" runat="server" Style=" margin:4px 4px 4px 4px" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-small" Text="Refresh" OnClick="btn_refreshclient_Click" />
                            <br />
                            <asp:Label ID="Label_clientvalue" runat="server" Text="0"></asp:Label>
                            <br />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" SelectCommand="SELECT [ID], [User Name] AS User_Name FROM [Users]"></asp:SqlDataSource>

                            <strong>Users:&nbsp; </strong>
                            &nbsp;<asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="User_Name" DataValueField="ID" Height="30px" Width="250px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                            </asp:DropDownList>
                          
                            &nbsp;<asp:Button ID="btn_refreshusers" runat="server" Style=" margin:4px 4px 4px 4px" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-small" Text="Refresh" OnClick="btn_refreshusers_Click" />
                            <br />
                            &nbsp;<asp:Label ID="Label_uservalue" runat="server" Text="0"></asp:Label>
                            <br />
                            <asp:Button ID="btn_AddUser" runat="server" class="w3-btn w3-ripple w3-blue w3-round-xlarge w3-medium" Text="Add User to campaign" OnClick="btn_AddUser_Click" Width="207px" />
                            <asp:Button ID="btn_AddUser0" runat="server" Style=" margin:4px 4px 4px 4px" class="w3-btn w3-ripple w3-blue w3-round-xlarge w3-medium" OnClick="btn_AddUser0_Click" Text="Add All Users" Width="134px" />
                            <br />
                            &nbsp;<strong><br />
                                Campaign ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                            <asp:TextBox ID="TextBox_from" runat="server" AutoPostBack="True" OnTextChanged="TextBox_from_TextChanged">0</asp:TextBox>
                            &nbsp;<strong><br />
                                <br />
                                Campaign Name: </strong>
                            <asp:TextBox ID="TextBox_to" runat="server">n</asp:TextBox>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" DeleteCommand="DELETE FROM [tb_temb] WHERE [id] = @id" InsertCommand="INSERT INTO [tb_temb] ([User id], [User name], [Campaign ID], [Campaign Name], [Client ID]) VALUES (@User_id, @User_name, @Campaign_ID, @Campaign_Name, @Client_ID)" SelectCommand="SELECT [id], [User id] AS User_id, [User name] AS User_name, [Campaign ID] AS Campaign_ID, [Campaign Name] AS Campaign_Name, [Client ID] AS Client_ID FROM [tb_temb] WHERE ([Campaign ID] = @Campaign_ID)" UpdateCommand="UPDATE [tb_temb] SET [User id] = @User_id, [User name] = @User_name, [Campaign ID] = @Campaign_ID, [Campaign Name] = @Campaign_Name, [Client ID] = @Client_ID WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="User_id" Type="Int32" />
                                    <asp:Parameter Name="User_name" Type="String" />
                                    <asp:Parameter Name="Campaign_ID" Type="Int32" />
                                    <asp:Parameter Name="Campaign_Name" Type="String" />
                                    <asp:Parameter Name="Client_ID" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBox_from" DefaultValue="0" Name="Campaign_ID" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="User_id" Type="Int32" />
                                    <asp:Parameter Name="User_name" Type="String" />
                                    <asp:Parameter Name="Campaign_ID" Type="Int32" />
                                    <asp:Parameter Name="Campaign_Name" Type="String" />
                                    <asp:Parameter Name="Client_ID" Type="Int32" />
                                    <asp:Parameter Name="id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:Button ID="btn_Deleteall" runat="server" Style=" margin:4px 4px 4px 4px" class="w3-btn w3-ripple w3-red w3-round-large w3-medium" Text="Delete All Users" Width="146px" OnClientClick="return confirm('Are you sure you want to delete?'); " OnClick="btn_Deleteall_Click" />
                            <asp:Button ID="btn_DeleteCampaign" runat="server" Style=" margin:4px 4px 4px 4px" class="w3-btn w3-ripple w3-red w3-round-large w3-medium" OnClick="btn_DeleteCampaign_Click" OnClientClick="return confirm('Are you sure you want to delete?'); " Text="Delete Campaign" Width="167px" />
                             <asp:Button ID="btn_DeleteAllCampaign" runat="server" Style=" margin:4px 4px 4px 4px" class="w3-btn w3-ripple w3-red w3-round-large w3-medium" OnClick="btn_DeleteAllCampaign_Click" OnClientClick="return confirm('Are you sure you want to delete All Campaign?\nPlease make sure to take reports first'); " Text="Delete All Campaign" Width="189px" />
                            
                            <br />
                           
                            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource6" Style=" margin:4px 4px 4px 4px" Class="w3-responsive w3-table-all w3-hoverable">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"  OnClientClick="return confirm('Are you sure you want to delete?'); " class="w3-text-red" ></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                                    <asp:BoundField DataField="User_id" HeaderText="User_id" SortExpression="User_id" />
                                    <asp:BoundField DataField="User_name" HeaderText="User_name" SortExpression="User_name" />
                                    <asp:BoundField DataField="Campaign_ID" HeaderText="Campaign_ID" SortExpression="Campaign_ID" />
                                    <asp:BoundField DataField="Campaign_Name" HeaderText="Campaign_Name" SortExpression="Campaign_Name" />
                                    <asp:BoundField DataField="Client_ID" HeaderText="Client_ID" SortExpression="Client_ID" />
                                </Columns>
                            </asp:GridView>
                            <div id="addcompdata" runat="server">
                            <asp:Button ID="btn_Addcomp" runat="server" Style=" margin:4px 4px 4px 4px" class="w3-btn w3-ripple w3-blue w3-round-xlarge w3-larg" Text="Add compaign to database" OnClick="btn_Addcomp_Click" OnClientClick="return hideme(); return true;"/>
                           </div>
                           <strong>
                            <br />
                            Message:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><asp:Label ID="Label_Loaded_count" runat="server" Text="Loaded Count: 0"></asp:Label>
                            <br />
                           
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel6" >
                                <ProgressTemplate>
                                    <strong><span class="auto-style1">Loading to database...</span> </strong>
                                    <img src="pic/loading-29.gif" width="75" />
                                    &nbsp;
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                            
                             
                            <asp:TextBox ID="TextBox_message" runat="server" Height="250px" TextMode="MultiLine" Width="350px"></asp:TextBox>
                            &nbsp;<asp:TextBox ID="TextBox_message0" runat="server" Height="250px" TextMode="MultiLine" Width="350px" Visible="False"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Visible="False" />
                            <div style="padding:4px ; display:none"><span>Picture:<asp:FileUpload ID="FileUpload_Picture" runat="server" /> &nbsp; </span>Video:<asp:FileUpload ID="FileUpload_video" runat="server" />&nbsp; File:<asp:FileUpload ID="FileUpload_file" runat="server" />&nbsp;<asp:Button ID="Button_Uplaod" runat="server" OnClick="Button_Uplaod_Click" Text="Upload" /></div>
                             <div style="padding:4px">
          <iframe src="UplaoadFiles.aspx?type=picture" scrolling="no" style="height: 350px; width: 350px"></iframe>
      </div>
                            <div style="padding:4px">
          <iframe src="UplaoadFiles.aspx?type=video" scrolling="no" style="height: 350px; width: 350px"></iframe>
      </div>
                            <div style="padding:4px">
          <iframe src="UplaoadFiles.aspx?type=file" scrolling="no" style="height: 350px; width: 350px"></iframe>
      </div>
                        </ContentTemplate>
                        <Triggers>
                            <%--<asp:AsyncPostBackTrigger ControlID="btn_Addcomp" EventName="Click"/>--%>
                            <asp:AsyncPostBackTrigger ControlID="Button_Uplaod" EventName="Click"/>
                        </Triggers>
                    </asp:UpdatePanel>

                </div>
            </div>

            <div id="Upload" class="w3-container w3-border city w3-animate-right" style="display: none">
                <h2>Upload files .</h2>
      <div>
          <iframe src="upload.aspx" scrolling="no" style="height: 350px; width: 350px"></iframe>
      </div>
            </div>

            <div id="Get Senders" class="w3-container w3-border city w3-animate-right" style="display: none">
                <h2>Search for number to get sender .</h2>
                <div>
                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                        <ContentTemplate>
                            <strong>Clients:</strong>
                            <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource4" DataTextField="Client_Name" DataValueField="Id" Height="30px" Width="250px" AutoPostBack="True">
                            </asp:DropDownList>
                            
                            <asp:Button ID="Button_crefresh" runat="server" Style=" margin:4px 4px 4px 4px" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-small" Text="Refresh" OnClick="Button_crefresh_Click" />
                            
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" SelectCommand="declare @userunderid int =0;

 select @userunderid= [User under id] from [PhonesMs] where [Phones]=@Phones and [Client ID] =@Client_ID;
 
 if(@userunderid=0)
	select [PhonesMs].[Campaign ID],[PhonesMs].[Phones],[PhonesMs].[Message],[PhonesMs].[Sent Time],[Users].[User Name] as [Leader],[User under id]as[User Name]  FROM [PhonesMs] inner join [Users] on [PhonesMs].[User ID]= [Users].[ID]  WHERE ([Client ID] =@Client_ID) AND (Phones = @Phones) AND (Sent = 1)
else
	select [PhonesMs].[Campaign ID],[PhonesMs].[Phones],[PhonesMs].[Message],[PhonesMs].[Sent Time],[Users].[User Name] as [Leader],[Users_under].[User Name]  FROM [PhonesMs] inner join [Users] on [PhonesMs].[User ID]= [Users].[ID] inner join  [Users_under] on [PhonesMs].[User under id] = [Users_under].[Id] WHERE ([Client ID] =@Client_ID) AND (Phones = @Phones) AND (Sent = 1)
	 
">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList5" Name="Client_ID" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="TextBox_phoneSearch" Name="Phones" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                            <asp:TextBox ID="TextBox_phoneSearch" runat="server" Width="189px" Style=" margin:10px 4px 4px 4px" placeholder="Search"></asp:TextBox>
                            <asp:Button ID="Button_SearcPhone" runat="server" class="w3-btn w3-ripple w3-yellow w3-round-xlarge w3-small" OnClick="Button_SearcPhone_Click" Style=" margin:4px 4px 4px 4px" Text="Search" />
                            <br />
                            <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource10" Class="w3-responsive w3-table-all w3-hoverable" AllowPaging="True">
                                <Columns>
                                    <asp:BoundField DataField="Campaign ID" HeaderText="Campaign ID" SortExpression="Campaign ID" />
                                    <asp:BoundField DataField="Phones" HeaderText="Phones" SortExpression="Phones" />
                                    <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                                    <asp:BoundField DataField="Sent Time" HeaderText="Sent Time" SortExpression="Sent Time" />
                                    <asp:BoundField DataField="Leader" HeaderText="Leader" SortExpression="Leader" />
                                    <asp:BoundField DataField="User Name" HeaderText="User Name" SortExpression="User Name" />
                                </Columns>
                                <EmptyDataTemplate>
                                    There is No data
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" SelectCommand="select TOP 5 [PhonesMs].[Campaign ID],[PhonesMs].[Phones],[PhonesMs].[Message],[PhonesMs].[Sent Time],[Users].[User Name] as [Leader],[Users_under].[User Name]  FROM [PhonesMs] inner join [Users] on [PhonesMs].[User ID]= [Users].[ID] inner join  [Users_under] on [PhonesMs].[User under id] = [Users_under].[Id] WHERE ([Client ID] = @Client_ID) AND (Sent = 1) ORDER BY NEWID()">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList5" Name="Client_ID" PropertyName="SelectedValue" Type="Int32" />
                                 
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <strong>Number:</strong>
                            <asp:TextBox ID="TextBox_RandomNumber" runat="server" Width="74px" Style=" margin:10px 4px 4px 4px"></asp:TextBox>
                            <asp:Button ID="Button_SearcPhone0" runat="server" class="w3-btn w3-ripple w3-yellow w3-round-xlarge w3-small" OnClick="Button_SearcPhone0_Click" Style=" margin:4px 4px 4px 4px" Text="Get Random" />
                            <br />
                            <asp:GridView ID="GridView7" runat="server" AllowPaging="True" AutoGenerateColumns="False" Class="w3-responsive w3-table-all w3-hoverable" OnSelectedIndexChanging="GridView7_SelectedIndexChanging" OnPageIndexChanging="GridView7_PageIndexChanging">
                                <EmptyDataTemplate>
                                    There is No data
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers><asp:AsyncPostBackTrigger ControlID="GridView7" EventName="PageIndexChanging"/></Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>

            <div id="Leader Users" class="w3-container w3-border city w3-animate-right" style="display: none">
                <h2>Manage users under leaders.   </h2> <div>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <strong>Users:</strong>&nbsp;
                   <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="User_Name" DataValueField="ID" Height="30px" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" Width="250px">
                   </asp:DropDownList>
                            <asp:Button ID="btn_refreshusers0" runat="server" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-small" OnClick="btn_refreshusers0_Click" Style="margin: 4px 4px 4px 4px" Text="Refresh" />
                            <br />
                            &nbsp;<asp:Label ID="Label_userpvalue" runat="server" Text="0"></asp:Label>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" DeleteCommand="DELETE FROM [Users_under] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Users_under] ([User Name], [Pass Word], [Login Date], [Messages sent], [Pid], [User Parent], [Full Name], [Mobile]) VALUES (@User_Name, @Pass_Word, @Login_Date, @Messages_sent, @Pid, @User_Parent, @Full_Name, @Mobile)" SelectCommand="SELECT ID, [User Name] AS User_Name, [Pass Word] AS Pass_Word, [Login Date] AS Login_Date, [Messages sent] AS Messages_sent, Pid, [User Parent] AS User_Parent, [Full Name] AS Full_Name, Mobile FROM Users_under WHERE (Pid = @Pid) AND ([User Name] LIKE '%' + @username + '%')" UpdateCommand="UPDATE [Users_under] SET [User Name] = @User_Name, [Pass Word] = @Pass_Word, [Login Date] = @Login_Date, [Messages sent] = @Messages_sent, [Pid] = @Pid, [User Parent] = @User_Parent, [Full Name] = @Full_Name, [Mobile] = @Mobile WHERE [ID] = @ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="User_Name" Type="String" />
                                    <asp:Parameter Name="Pass_Word" Type="String" />
                                    <asp:Parameter DbType="DateTime2" Name="Login_Date" />
                                    <asp:Parameter Name="Messages_sent" Type="Int64" />
                                    <asp:Parameter Name="Pid" Type="Int32" />
                                    <asp:Parameter Name="User_Parent" Type="String" />
                                    <asp:Parameter Name="Full_Name" Type="String" />
                                    <asp:Parameter Name="Mobile" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList4" DefaultValue="0" Name="Pid" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="textBox_search_userp" DefaultValue="%%" Name="username" PropertyName="Text" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="User_Name" Type="String" />
                                    <asp:Parameter Name="Pass_Word" Type="String" />
                                    <asp:Parameter DbType="DateTime2" Name="Login_Date" />
                                    <asp:Parameter Name="Messages_sent" Type="Int64" />
                                    <asp:Parameter Name="Pid" Type="Int32" />
                                    <asp:Parameter Name="User_Parent" Type="String" />
                                    <asp:Parameter Name="Full_Name" Type="String" />
                                    <asp:Parameter Name="Mobile" Type="String" />
                                    <asp:Parameter Name="ID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:Button ID="Button_Reset0" runat="server" class="w3-btn w3-ripple w3-yellow w3-round-large w3-medium" OnClick="Button_Reset0_Click" OnClientClick="return confirm('Are you sure you want to Reset Prices For All Users?'); " Style="margin: 4px 4px 4px 4px" Text="Reset Prices For All Users Under selected leader" Width="385px" />
                            <asp:Button ID="Button_Reset01" runat="server" class="w3-btn w3-ripple w3-yellow w3-round-large w3-medium" OnClick="Button_Reset01_Click" OnClientClick="return confirm('Are you sure you want to Reset Prices For All Users?'); " Style="margin: 4px 4px 4px 4px" Text="Reset Prices For All Users Under All leaders" Width="366px" />
                            <br />
                            <br />
                            <asp:TextBox ID="textBox_search_userp" runat="server" AutoPostBack="True" placeholder="Search for user" Width="234px" OnTextChanged="textBox_search_userp_TextChanged"></asp:TextBox>
                            <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AutoGenerateColumns="False" Class="w3-responsive w3-table-all w3-hoverable" DataKeyNames="ID" DataSourceID="SqlDataSource9" OnSelectedIndexChanged="GridView5_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField ShowEditButton="True" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); " class="w3-text-red"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                                    <asp:BoundField DataField="User_Name" HeaderText="User_Name" SortExpression="User_Name" />
                                    <asp:BoundField DataField="Pass_Word" HeaderText="Pass_Word" SortExpression="Pass_Word" />
                                    <asp:BoundField DataField="Login_Date" HeaderText="Login_Date" SortExpression="Login_Date" Visible="False" />
                                    <asp:BoundField DataField="Messages_sent" HeaderText="Messages_sent" SortExpression="Messages_sent" />
                                    <asp:TemplateField HeaderText="Price" Visible="False">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="LabelPrice2" runat="server" Text='0'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>

                                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("Messages_sent")!=null?(Math.Round(Convert.ToDouble(Convert.ToInt32(Eval("Messages_sent")))*0.02857,2)).ToString():"0" %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Pid" HeaderText="Pid" SortExpression="Pid" />
                                    <asp:BoundField DataField="User_Parent" HeaderText="User_Parent" SortExpression="User_Parent" />
                                    <asp:BoundField DataField="Full_Name" HeaderText="Full_Name" SortExpression="Full_Name" />
                                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                                </Columns>
                            </asp:GridView>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                           
        
      </div>
            </div>

            <div id="Users" class="w3-container w3-border city w3-animate-right" style="display: none;">
                <h2>Users</h2>
                <p>You can add ,edit or delete Users.</p>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [ID] = @ID" InsertCommand="INSERT INTO Users([Pass Word], [User Name], [Login Date], Permissions, [Messages sent], [Full Name], Mobile) VALUES (@Pass_Word, @User_Name, N'1/1/2000', 2, 0, @Full_Name, @Mobile)" SelectCommand="SELECT ID, [Pass Word] AS Pass_Word, [User Name] AS User_Name, [Login Date] AS Login_Date, Permissions, [Messages sent] AS Messages_sent, [Full Name] AS Full_Name, Mobile FROM Users" UpdateCommand="UPDATE Users SET [Pass Word] = @Pass_Word, [User Name] = @User_Name, [Login Date] = @Login_Date, Permissions = @Permissions, [Messages sent] = @Messages_sent, [Full Name] = @Full_Name, Mobile = @Mobile WHERE (ID = @ID)">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Pass_Word" Type="String" />
                                <asp:Parameter Name="User_Name" Type="String" />
                                <asp:Parameter DbType="DateTime2" Name="Login_Date" />
                                <asp:Parameter Name="Permissions" Type="Int32" />
                                <asp:Parameter Name="Messages_sent" Type="Int64" />
                                <asp:Parameter Name="Full_Name" />
                                <asp:Parameter Name="Mobile" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Pass_Word" Type="String" />
                                <asp:Parameter Name="User_Name" Type="String" />
                                <asp:Parameter DbType="DateTime2" Name="Login_Date" />
                                <asp:Parameter Name="Permissions" Type="Int32" />
                                <asp:Parameter Name="Messages_sent" Type="Int64" />
                                <asp:Parameter Name="ID" Type="Int32" />
                                <asp:Parameter Name="Full_Name" />
                                <asp:Parameter Name="Mobile" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="ID" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" Style="margin-bottom: 0px" OnPageIndexChanging="FormView1_PageIndexChanging" OnPageIndexChanged="FormView1_PageIndexChanged" OnDataBound="FormView1_DataBound">
                            <EditItemTemplate>
                                ID:
                      <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                <br />
                                Pass_Word:
                      <asp:TextBox ID="Pass_WordTextBox" runat="server" Text='<%# Bind("Pass_Word") %>' />
                                <br />
                                User_Name:
                      <asp:TextBox ID="User_NameTextBox" runat="server" Text='<%# Bind("User_Name") %>' />
                                <br />
                                Login_Date:
                      <asp:TextBox ID="Login_DateTextBox" runat="server" Text='<%# Bind("Login_Date") %>' />
                                <br />
                                Permissions:
                      <asp:TextBox ID="PermissionsTextBox" runat="server" Text='<%# Bind("Permissions") %>' />
                                <br />
                                Messages_sent:
                      <asp:TextBox ID="Messages_sentTextBox" runat="server" Text='<%# Bind("Messages_sent") %>' />
                                <br />
                                Full_Name:
                                <asp:TextBox ID="Full_NameTextBox" runat="server" Text='<%# Bind("Full_Name") %>' />
                                <br />
                                Mobile:
                                <asp:TextBox ID="MobileTextBox" runat="server" Text='<%# Bind("Mobile") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <InsertItemTemplate>
                                Pass_Word:
                      <asp:TextBox ID="Pass_WordTextBox" runat="server" Text='<%# Bind("Pass_Word") %>' />
                                <br />
                                User_Name:
                      <asp:TextBox ID="User_NameTextBox" runat="server" Text='<%# Bind("User_Name") %>' />
                                <br />
                                <%-- Login_Date:
                      <asp:TextBox ID="Login_DateTextBox" runat="server" Text='<%# Bind("Login_Date") %>' />
                      <br />
                      Permissions:
                      <asp:TextBox ID="PermissionsTextBox" runat="server" Text='<%# Bind("Permissions") %>' />
                      <br />
                      Messages_sent:
                      <asp:TextBox ID="Messages_sentTextBox" runat="server" Text='<%# Bind("Messages_sent") %>' />
                      <br />--%>
                                &nbsp;<asp:TextBox ID="Login_DateTextBox" runat="server" Text='<%# Bind("Login_Date") %>' />
                                <br />
                                Permissions:
                                <asp:TextBox ID="PermissionsTextBox" runat="server" Text='<%# Bind("Permissions") %>' />
                                <br />
                                Messages_sent:
                                <asp:TextBox ID="Messages_sentTextBox" runat="server" Text='<%# Bind("Messages_sent") %>' />
                                <br />
                                Full_Name:
                                <asp:TextBox ID="Full_NameTextBox" runat="server" Text='<%# Bind("Full_Name") %>' />
                                <br />
                                Mobile:
                                <asp:TextBox ID="MobileTextBox" runat="server" Text='<%# Bind("Mobile") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                ID:
                      <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                <br />
                                Pass_Word:
                      <asp:Label ID="Pass_WordLabel" runat="server" Text='<%# Bind("Pass_Word") %>' />
                                <br />
                                User_Name:
                      <asp:Label ID="User_NameLabel" runat="server" Text='<%# Bind("User_Name") %>' />
                                <br />
                                Login_Date:
                      <asp:Label ID="Login_DateLabel" runat="server" Text='<%# Bind("Login_Date") %>' />
                                <br />
                                Permissions:
                      <asp:Label ID="PermissionsLabel" runat="server" Text='<%# Bind("Permissions") %>' />
                                <br />
                                Messages_sent:
                      <asp:Label ID="Messages_sentLabel" runat="server" Text='<%# Bind("Messages_sent") %>' /> <br />
                                
                                Full_Name:
                                <asp:Label ID="Full_NameLabel" runat="server" Text='<%# Bind("Full_Name") %>' />
                                <br />
                                Mobile:
                                <asp:Label ID="MobileLabel" runat="server" Text='<%# Bind("Mobile") %>' />
                                <br />
                                
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); " class="w3-text-red" />
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                            </ItemTemplate>
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        </asp:FormView>
                        <br />
                        <asp:Label ID="LabelPrice" runat="server" Text="Price" Visible="False"></asp:Label>
                        <br />
                <asp:Button ID="Button_Reset" runat="server" Style=" margin:4px 4px 4px 4px" class="w3-btn w3-ripple w3-yellow w3-round-large w3-medium" OnClick="Button_Reset_Click" OnClientClick="return confirm('Are you sure you want to Reset Prices For All Users?'); " Text="Reset Prices For All Users" Width="232px" />
                             
                    
                    </ContentTemplate>
                </asp:UpdatePanel>

                &nbsp;&nbsp;<br />
                &nbsp;<input type="button" id="Button_getlink" value="Get user link" class="w3-btn w3-ripple w3-brown w3-round-xlarge w3-medium" />&nbsp;
              <input type="button" id="Button_copy" value="Copy" onclick="Button_copy()" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-medium" />
                <br />
                <br />
                
                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="TextBox_link" runat="server" Width="450px"></asp:TextBox>
                
                         <br />
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Users] ([User Name], [Pass Word], [Login Date], [Permissions], [Messages sent]) VALUES (@User_Name, @Pass_Word, @Login_Date, @Permissions, @Messages_sent)" SelectCommand="SELECT ID, [User Name] AS User_Name, [Pass Word] AS Pass_Word, [Login Date] AS Login_Date, Permissions, [Messages sent] AS Messages_sent, [Full Name] AS Full_Name, Mobile FROM Users WHERE ([User Name] LIKE '%' + @User_Name + '%')" UpdateCommand="UPDATE Users SET [User Name] = @User_Name, [Pass Word] = @Pass_Word, Permissions = @Permissions, [Messages sent] = @Messages_sent, [Full Name] = @Full_Name, Mobile = @Mobile WHERE (ID = @ID)">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="User_Name" Type="String" />
                        <asp:Parameter Name="Pass_Word" Type="String" />
                        <asp:Parameter DbType="DateTime2" Name="Login_Date" />
                        <asp:Parameter Name="Permissions" Type="Int32" />
                        <asp:Parameter Name="Messages_sent" Type="Int64" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox_search_user" DefaultValue="%%" Name="User_Name" PropertyName="Text" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="User_Name" Type="String" />
                        <asp:Parameter Name="Pass_Word" Type="String" />
                        <asp:Parameter DbType="DateTime2" Name="Login_Date" />
                        <asp:Parameter Name="Permissions" Type="Int32" />
                        <asp:Parameter Name="Messages_sent" Type="Int64" />
                        <asp:Parameter Name="ID" Type="Int32" />
                        <asp:Parameter Name="Full_Name" />
                        <asp:Parameter Name="Mobile" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                         <asp:HiddenField ID="HiddenField_link" runat="server" />
                <br />
                <asp:TextBox ID="TextBox_search_user" runat="server" Width="234px" placeholder="Search for user" AutoPostBack="True" OnTextChanged="TextBox_search_user_TextChanged"></asp:TextBox>
                
                <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource8" OnDataBound="GridView4_DataBound" OnRowCommand="GridView4_RowCommand1" Class="w3-responsive w3-table-all w3-hoverable" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"  OnClientClick="return confirm('Are you sure you want to delete?');" class="w3-text-red" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="User_Name" HeaderText="User_Name" SortExpression="User_Name" />
                        <asp:BoundField DataField="Pass_Word" HeaderText="Pass_Word" SortExpression="Pass_Word" />
                        <asp:BoundField DataField="Login_Date" HeaderText="Login_Date" SortExpression="Login_Date" Visible="False" />
                        <asp:BoundField DataField="Permissions" HeaderText="Permissions" SortExpression="Permissions" />
                        <asp:BoundField DataField="Messages_sent" HeaderText="Messages_sent" SortExpression="Messages_sent" />
                        <asp:TemplateField HeaderText="Price" Visible="False">
                            <EditItemTemplate>
                                <asp:TextBox ID="LabelPrice2" runat="server" Text='0'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%--<asp:Label ID="LabelPrice2" runat="server" Text='<%#Eval("Messages_sent")!=null?(Convert.ToDouble(Convert.ToInt32(Eval("Messages_sent"))/100)*3.5).ToString():"0" %>'></asp:Label>--%>
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("Messages_sent")!=null?(Math.Round(Convert.ToDouble(Convert.ToInt32(Eval("Messages_sent")))*0.035,2)).ToString():"0" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Full_Name" HeaderText="Full_Name" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                    </Columns>
                </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Button_Reset" EventName="Click"/>
                    </Triggers>
                </asp:UpdatePanel>
               
            </div>

            <div id="Clients" class="w3-container w3-border city w3-animate-right" style="display: none">
                <h2>Clients</h2>
                
                    <asp:UpdatePanel ID="clientup" runat="server">
                         <ContentTemplate>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" DeleteCommand="DELETE FROM [clients] WHERE [Id] = @Id" InsertCommand="INSERT INTO [clients] ([Client Name], [Total Messages sent]) VALUES (@Client_Name, @Total_Messages_sent)" SelectCommand="SELECT [Id], [Client Name] AS Client_Name, [Total Messages sent] AS Total_Messages_sent FROM [clients]" UpdateCommand="UPDATE [clients] SET [Client Name] = @Client_Name, [Total Messages sent] = @Total_Messages_sent WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Client_Name" Type="String" />
                            <asp:Parameter Name="Total_Messages_sent" Type="Int64" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Client_Name" Type="String" />
                            <asp:Parameter Name="Total_Messages_sent" Type="Int64" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                
                        <asp:FormView ID="FormView2" runat="server" AllowPaging="True" DataKeyNames="Id" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333">
                            <EditItemTemplate>
                                Id:
                      <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                                <br />
                                Client_Name:
                      <asp:TextBox ID="Client_NameTextBox" runat="server" Text='<%# Bind("Client_Name") %>' />
                                <br />
                                Total_Messages_sent:
                      <asp:TextBox ID="Total_Messages_sentTextBox" runat="server" Text='<%# Bind("Total_Messages_sent") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <InsertItemTemplate>
                                Client_Name:
                      <asp:TextBox ID="Client_NameTextBox" runat="server" Text='<%# Bind("Client_Name") %>' />
                                <br />

                                Total_Messages_sent:
                                <asp:TextBox ID="Total_Messages_sentTextBox" runat="server" Text='<%# Bind("Total_Messages_sent") %>' />
                                <br />

                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                Id:
                      <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                                <br />
                                Client_Name:
                      <asp:Label ID="Client_NameLabel" runat="server" Text='<%# Bind("Client_Name") %>' />
                                <br />
                                Total_Messages_sent:
                      <asp:Label ID="Total_Messages_sentLabel" runat="server" Text='<%# Bind("Total_Messages_sent") %>' />
                                <br />
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); " class="w3-text-red"/>
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                            </ItemTemplate>
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        </asp:FormView>
                                                         <asp:Button ID="btn_DeleteAllClients" runat="server" Style=" margin:4px 4px 4px 4px" class="w3-btn w3-ripple w3-red w3-round-large w3-medium" OnClick="btn_DeleteAllClients_Click" OnClientClick="return confirm('Are you sure you want to delete All Clients?'); " Text="Delete All Clients" Width="157px" />
                             
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div id="Files" class="w3-container w3-border city w3-animate-right" style="display: none">
                <h2>Files</h2>
                <p>
                    You can delete files 
                </p>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <p>
                            <asp:Button ID="btn_refresh" runat="server" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-medium" Text="Refresh" OnClick="btn_refresh_Click" /></p>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" DeleteCommand="DELETE FROM [UploadedFile] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [UploadedFile] ([File Name], [Uploaded date], [File Size]) VALUES (@File_Name, @Uploaded_date, @File_Size)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [File Name] AS File_Name, [Uploaded date] AS Uploaded_date, [File Size] AS File_Size FROM [UploadedFile]" UpdateCommand="UPDATE [UploadedFile] SET [File Name] = @File_Name, [Uploaded date] = @Uploaded_date, [File Size] = @File_Size WHERE [Id] = @original_Id">
                            <DeleteParameters>
                                <asp:Parameter Name="original_Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="File_Name" Type="String" />
                                <asp:Parameter DbType="DateTime2" Name="Uploaded_date" />
                                <asp:Parameter Name="File_Size" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="File_Name" Type="String" />
                                <asp:Parameter DbType="DateTime2" Name="Uploaded_date" />
                                <asp:Parameter Name="File_Size" Type="String" />
                                <asp:Parameter Name="original_Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:GridView runat="server" AllowPaging="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Id" ID="gridview1" OnRowDeleted="gridview1_RowDeleted" OnRowDeleting="gridview1_RowDeleting" Class="w3-responsive w3-table-all w3-hoverable" OnRowCommand="gridview1_RowCommand">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); " OnClick="LinkButton1_Click" class="w3-text-red"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="File_Name" HeaderText="File_Name" SortExpression="File_Name" />
                                <asp:BoundField DataField="Uploaded_date" HeaderText="Uploaded_date" SortExpression="Uploaded_date" />
                                <asp:BoundField DataField="File_Size" HeaderText="File_Size" SortExpression="File_Size" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>

        <div id="Send" class="w3-container w3-border city w3-animate-right" style="display: none">
            <h2>Send messages </h2>
            <div>
                <iframe src="Send.aspx" style="height: 500px; width: 100%"></iframe>
            </div>
        </div>
        
        <div id="Report" class="w3-container w3-border city w3-animate-right" style="display: none">
            <h2>Reports.</h2>
            <div>
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <strong>Clients:</strong>
                        <asp:DropDownList ID="DropDownListC" runat="server" DataSourceID="SqlDataSource4" DataTextField="Client_Name" DataValueField="Id" Height="30px" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="DropDownListC_SelectedIndexChanged">
                        </asp:DropDownList>

                        &nbsp;<asp:Button ID="Button_refreshclient" runat="server" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-small" Text="Refresh" OnClick="Button_refreshclient_Click" />
                        <br />
                        <asp:Label ID="Label_clientid" runat="server" Text="0"></asp:Label>
                        <br />
                        <asp:Button ID="btn_Getreport" runat="server" class="w3-btn w3-ripple w3-blue w3-round-xlarge w3-larg" Text="Get Report" OnClick="btn_Getreport_Click" />
                        &nbsp;
                            <asp:Button ID="btn_delete" runat="server" class="w3-btn w3-ripple w3-red w3-round-xlarge w3-larg" OnClick="btn_delete_Click" Text="Delete Sent" ToolTip="Delete Sent numbers for current selected client" OnClientClick="return confirm('Are you sure you want to delete?\nPlease make sure took a report first because we can\'t get these numbers again'); " />
                        <br />

                        <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel7">
                            <ProgressTemplate>
                                <strong>Preparing The Report...</span></strong> </strong>
                                    <img src="pic/loading-29.gif" width="75" />
                                &nbsp;
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" SelectCommand="SELECT Id, [Report Name] AS Report_Name, [Report date] AS Report_date, Size, RecordCount FROM Reports" DeleteCommand="DELETE FROM [Reports] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Reports] ([Report Name], [Report date], [Size]) VALUES (@Report_Name, @Report_date, @Size)" UpdateCommand="UPDATE [Reports] SET [Report Name] = @Report_Name, [Report date] = @Report_date, [Size] = @Size WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Report_Name" Type="String" />
                                <asp:Parameter DbType="DateTime2" Name="Report_date" />
                                <asp:Parameter Name="Size" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Report_Name" Type="String" />
                                <asp:Parameter DbType="DateTime2" Name="Report_date" />
                                <asp:Parameter Name="Size" Type="String" />
                                <asp:Parameter Name="Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:Label ID="Label_existandnotCount" runat="server" Text="0"></asp:Label>
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource7" Class="w3-responsive w3-table-all w3-hoverable" OnRowDeleting="GridView3_RowDeleting" OnRowCommand="GridView3_RowCommand" OnRowDataBound="GridView3_RowDataBound">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="deleteFile" CommandArgument='<%#Eval("Id") +","+ Eval("Report_Name") %>' Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); " class="w3-text-red"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:TemplateField HeaderText="Report_Name" SortExpression="Report_Name">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Report_Name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Label1" runat="server" Text='<%# Bind("Report_Name") %>' class="w3-text-blue" CommandArgument='<%#Eval("Report_Name") %>' CommandName="downloadFile"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Report_date" HeaderText="Report_date" SortExpression="Report_date" />
                                <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                                <asp:BoundField DataField="RecordCount" HeaderText="RecordCount" SortExpression="RecordCount" />
                                <%-- <asp:TemplateField HeaderText="del" SortExpression="del" ShowHeader="false">
                                        
                                        <ItemTemplate>
                                           <asp:ImageButton Width="10" runat="server" ImageUrl="~/pic/Grid_ActionDelete.gif"
                                                                                    ID="imgBtnDel" CommandName="deleteFile" CommandArgument='<%#Eval("Id") +","+ Eval("Report_Name") %>'
                                                                                    AlternateText="Delete" ToolTip="Delete File"  OnClientClick="return confirm('Are you sure you want to delete?'); " />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                            </Columns>
                            <EmptyDataTemplate>
                                No data
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <br />

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="GridView3" />

                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
        <div id="PullData" class="w3-container w3-border city w3-animate-right" style="display: none">
            <h2>Pull Data.</h2>
            <h3>1-Pull sent data.</h3>
            <div>
                <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                    <ContentTemplate>
                        <strong>Campaign:</strong>
                        <asp:DropDownList ID="DropDownList_Campaign_ID" runat="server" DataSourceID="SqlDataSource_Campaign_ID" DataTextField="Campaign ID" DataValueField="Campaign ID" Height="30px" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_Campaign_ID_SelectedIndexChanged">
                        </asp:DropDownList>

                        &nbsp;<asp:Button ID="Button2" runat="server" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-small" Text="Refresh" OnClick="Button2_Click" />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="0"></asp:Label>
                        <br />

                        <strong>Users:</strong>&nbsp;
                   <asp:DropDownList ID="DropDownList_users" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_users" DataTextField="User Name" DataValueField="ID" Height="30px" OnSelectedIndexChanged="DropDownList_users_SelectedIndexChanged" Width="250px">
                   </asp:DropDownList>
                        <asp:Button ID="Button5" runat="server" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-small" Style="margin: 4px 4px 4px 4px" Text="Refresh" OnClick="Button5_Click" />
                        <br />
                        &nbsp;<asp:Label ID="Label4" runat="server" Text="0"></asp:Label>
                        <br />

                        <strong>Users_under:</strong>&nbsp;
                   <asp:DropDownList ID="DropDownList_Users_under" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_userunder" DataTextField="User Name" DataValueField="ID" Height="30px" OnSelectedIndexChanged="DropDownList_Users_under_SelectedIndexChanged" Width="250px">
                   </asp:DropDownList>
                        <asp:Button ID="Button6" runat="server" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-small" Style="margin: 4px 4px 4px 4px" Text="Refresh" OnClick="Button6_Click" />
                        <br />
                        &nbsp;<asp:Label ID="Label5" runat="server" Text="0"></asp:Label>
                        <br />
                        <asp:CheckBox ID="CheckBox_GetAllCampaign" runat="server" Checked="True" Text="Get All Campaign" OnCheckedChanged="CheckBox_GetAllCampaign_CheckedChanged" />
                        &nbsp;&nbsp;
                        <asp:CheckBox ID="CheckBox_UserLeader" runat="server" Checked="True" Text="User Leader" />
                        <br />

                        <asp:Button ID="Button_GetSentFile" runat="server" class="w3-btn w3-ripple w3-blue w3-round-xlarge w3-larg" Text="Get File" OnClick="Button_GetSentFile_Click" />
                        &nbsp;
                            <asp:Button ID="Button4" runat="server" class="w3-btn w3-ripple w3-red w3-round-xlarge w3-larg" Text="Delete Sent" ToolTip="Delete Sent numbers for current selected client" OnClientClick="return confirm('Are you sure you want to delete?\nPlease make sure took a report first because we can\'t get these numbers again'); " Visible="False" />
                        <br />

                        <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel7">
                            <ProgressTemplate>
                                <strong>Preparing The File...</span></strong> </strong>
                                    <img src="pic/loading-29.gif" width="75" />
                                &nbsp;
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource_DataSent" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" SelectCommand="SELECT Id, FileName, FileDate, Size FROM DataSent" DeleteCommand="DELETE FROM [DataSent] WHERE [Id] = @Id" InsertCommand="INSERT INTO [DataSent] ([FileName], [FileDate], [Size]) VALUES (@Report_Name, @Report_date, @Size)" UpdateCommand="UPDATE [DataSent] SET [FileName] = @FileName, [FileDate] = @FileDate, [Size] = @Size WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="FileName" Type="String" />
                                <asp:Parameter DbType="DateTime2" Name="FileDate" />
                                <asp:Parameter Name="Size" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="FileName" Type="String" />
                                <asp:Parameter DbType="DateTime2" Name="FileDate" />
                                <asp:Parameter Name="Size" Type="String" />
                                <asp:Parameter Name="Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource_Campaign_ID" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" SelectCommand="select distinct [Campaign ID] FROM [PhonesMs]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource_userunder" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" SelectCommand="SELECT ID, [User Name] FROM Users_under WHERE (Pid = @pid)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList_users" DefaultValue="1" Name="pid" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource_users" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" SelectCommand="SELECT ID, [User Name] FROM Users"></asp:SqlDataSource>
                        <asp:GridView ID="GridView8" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource_DataSent" Class="w3-responsive w3-table-all w3-hoverable" OnRowCommand="GridView8_RowCommand">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="deleteFile" CommandArgument='<%#Eval("Id") +","+ Eval("FileName") %>' Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); " class="w3-text-red"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:TemplateField HeaderText="FileName" SortExpression="FileName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FileName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Label1" runat="server" Text='<%# Bind("FileName") %>' class="w3-text-blue" CommandArgument='<%#Eval("FileName") %>' CommandName="downloadFile"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="FileDate" HeaderText="FileDate" SortExpression="FileDate" />
                                <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                                 <asp:TemplateField HeaderText="del" SortExpression="del" ShowHeader="false" Visible="False">
                                        
                                        <ItemTemplate>
                                           <asp:ImageButton Width="10" runat="server" ImageUrl="~/pic/Grid_ActionDelete.gif"
                                                                                    ID="imgBtnDel" CommandName="deleteFile" CommandArgument='<%#Eval("Id") +","+ Eval("FileName") %>'
                                                                                    AlternateText="Delete" ToolTip="Delete File"  OnClientClick="return confirm('Are you sure you want to delete?'); " />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="GridView8" />

                        <%--<asp:PostBackTrigger ControlID="DropDownList_users" />--%>
                        <%--<asp:AsyncPostBackTrigger ControlID="GridView8" EventName="RowCommand" />--%>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <h3>2-Pull not sent data.</h3>
            <div>
                <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                    <ContentTemplate>
                       <%-- <strong>Campaign:</strong>
                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource_Campaign_ID" DataTextField="Campaign ID" DataValueField="Campaign ID" Height="30px" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_Campaign_ID_SelectedIndexChanged">
                        </asp:DropDownList>

                        &nbsp;<asp:Button ID="Button3" runat="server" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-small" Text="Refresh" />
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="0"></asp:Label>
                        <br />--%>

                        
                        <asp:Button ID="Button_GetNotSentFile" runat="server" class="w3-btn w3-ripple w3-blue w3-round-xlarge w3-larg" Text="Get File" OnClick="Button_GetNotSentFile_Click" />
                        &nbsp;
                            <%--<asp:Button ID="Button10" runat="server" class="w3-btn w3-ripple w3-red w3-round-xlarge w3-larg" Text="Delete Sent" ToolTip="Delete Sent numbers for current selected client" OnClientClick="return confirm('Are you sure you want to delete?\nPlease make sure took a report first because we can\'t get these numbers again'); " />--%>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource_DataNotSent" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" DeleteCommand="DELETE FROM [DataNotSent] WHERE [Id] = @Id" InsertCommand="INSERT INTO [DataNotSent] ([FileName], [FileDate], [Size]) VALUES (@Report_Name, @Report_date, @Size)" SelectCommand="SELECT Id, FileName, FileDate, Size FROM DataNotSent" UpdateCommand="UPDATE [DataNotSent] SET [FileName] = @FileName, [FileDate] = @FileDate, [Size] = @Size WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="FileName" Type="String" />
                                <asp:Parameter DbType="DateTime2" Name="FileDate" />
                                <asp:Parameter Name="Size" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="FileName" Type="String" />
                                <asp:Parameter DbType="DateTime2" Name="FileDate" />
                                <asp:Parameter Name="Size" Type="String" />
                                <asp:Parameter Name="Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:Label ID="Label6" runat="server" Text="0"></asp:Label>
                        <br />

                        <asp:UpdateProgress ID="UpdateProgress4" runat="server" AssociatedUpdatePanelID="UpdatePanel7">
                            <ProgressTemplate>
                                <strong>Preparing The File...</span></strong> </strong>
                                    <img src="pic/loading-29.gif" width="75" />
                                &nbsp;
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <br />
                        <asp:GridView ID="GridView9" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource_DataNotSent" Class="w3-responsive w3-table-all w3-hoverable" OnRowCommand="GridView9_RowCommand">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="deleteFile" CommandArgument='<%#Eval("Id") +","+ Eval("FileName") %>' Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); " class="w3-text-red"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:TemplateField HeaderText="FileName" SortExpression="FileName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FileName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Label1" runat="server" Text='<%# Bind("FileName") %>' class="w3-text-blue" CommandArgument='<%#Eval("FileName") %>' CommandName="downloadFile"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="FileDate" HeaderText="FileDate" SortExpression="FileDate" />
                                <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                                 <asp:TemplateField HeaderText="del" SortExpression="del" ShowHeader="false" Visible="False">
                                        
                                        <ItemTemplate>
                                           <asp:ImageButton Width="10" runat="server" ImageUrl="~/pic/Grid_ActionDelete.gif"
                                                                                    ID="imgBtnDel" CommandName="deleteFile" CommandArgument='<%#Eval("Id") +","+ Eval("FileName") %>'
                                                                                    AlternateText="Delete" ToolTip="Delete File"  OnClientClick="return confirm('Are you sure you want to delete?'); " />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="GridView9" />

                        <%--<asp:PostBackTrigger ControlID="DropDownList_users" />--%>
                        <%--<asp:AsyncPostBackTrigger ControlID="GridView8" EventName="RowCommand" />--%>
                    </Triggers>
                </asp:UpdatePanel>
            </div>

        </div>
        <script>
            
            function openCity(evt, cityName) {
                var i, x, tablinks;
                x = document.getElementsByClassName("city");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablink");
                for (i = 0; i < x.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " w3-red";
            }
        </script>
        
    </form>

</body>
</html>
<script>
    function hideme() {
        //alert('hi');
        document.getElementById('addcompdata').style.display = "none";
       // alert('hi2');
        return true;
    }
    $(document).ready(function () {

        $('#Button_copy').click(function () {
            //alert('clicked');
            var clipboardText = "";
            clipboardText = $('#<%=TextBox_link.ClientID%>').val();
                copyToClipboard(clipboardText);
                alert("Copied to Clipboard");
            });
        function copyToClipboard(text) {

            var textArea = document.createElement("textarea");
            textArea.value = text;
            document.body.appendChild(textArea);
            textArea.select();

            try {
                var successful = document.execCommand('copy');
                var msg = successful ? 'successful' : 'unsuccessful';
                console.log('Copying text command was ' + msg);
            } catch (err) {
                console.log('Oops, unable to copy', err);
            }
            document.body.removeChild(textArea);
        }

        $('#Button_getlink').click(function () {
            //alert('clicked');
            var permission = document.getElementById('FormView1_PermissionsLabel').innerText;
            var lk = "http://kookysleman-001-site2.ctempurl.com/?user=";
            if (permission!="1") {
                lk = "http://kookysleman-001-site2.ctempurl.com/user.aspx?user=";
            }
            var link = lk + document.getElementById('FormView1_User_NameLabel').innerText + "&password=" + document.getElementById('FormView1_Pass_WordLabel').innerText;

            $('#<%=TextBox_link.ClientID%>').val(link);

                //alert("done");
            });

    });


     function Button_copy() {
         //alert('clicked');
         var clipboardText = "";
         clipboardText = document.getElementById('<%=TextBox_link.ClientID%>').value;
             copyToClipboard(clipboardText);
             alert("Copied to Clipboard");
         }
        function copyToClipboard(text) {

            var textArea = document.createElement("textarea");
            textArea.value = text;
            document.body.appendChild(textArea);
            textArea.select();

            try {
                var successful = document.execCommand('copy');
                var msg = successful ? 'successful' : 'unsuccessful';
                console.log('Copying text command was ' + msg);
            } catch (err) {
                console.log('Oops, unable to copy', err);
            }
            document.body.removeChild(textArea);
        }

        function Button_getlink() {
            //alert('clicked');
            var link = "https://localhost:44309/?user=" + document.getElementById('FormView1_User_NameLabel').innerText + "&password=" + document.getElementById('FormView1_Pass_WordLabel').innerText;
            document.getElementById('<%=TextBox_link.ClientID%>').value = link;

         alert("done");
     }

</script>
