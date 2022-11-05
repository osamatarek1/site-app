<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="whatslink.user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            color: #800000;
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="HiddenField_userid" runat="server" />
         <h2>User Control page</h2>
  <p>You can manage Your users here</p>

  <div class="w3-bar w3-black">
     
       <%--<input type="button" value="Campaign" class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event, 'Campaign')"  />--%>
         <input type="button" value="Users" class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event, 'Users')" />
       <input type="button" value="Send" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'Send')"  style="display: none"/>
      <asp:Button ID="btn_send" runat="server" Text="Send" class="w3-bar-item w3-button tablink" OnClick="btn_send_Click"/>
      </div>
       <div id="Campaign" class="w3-container w3-border city w3-animate-right" style="display:none">
           
    <h2>Campaign</h2>
    <p>You can  locate under users to send Count numbers.</p>
      <div>
                  <asp:UpdatePanel ID="UpdatePanel5" runat="server">
              <ContentTemplate>
                  <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" SelectCommand="SELECT distinct [Client ID], [Client Name] FROM [PhonesMs]  inner join [clients] on [clients].[id]=[PhonesMs].[Client ID] WHERE ([PhonesMs].[User ID] = @Id)">
                      <SelectParameters>
                          <asp:SessionParameter DefaultValue="0" Name="Id" SessionField="id" Type="Int32" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                  <strong>Clients:</strong>
                  <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="Client Name" DataValueField="Client ID" Height="30px" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                  </asp:DropDownList>
                  &nbsp;<asp:Button ID="btn_refreshclient" runat="server" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-small"  Text="Refresh" OnClick="btn_refreshclient_Click" />
                  <br />
                  <asp:Label ID="Label_clientvalue" runat="server" Text="0"></asp:Label>
                  <br />
                  <asp:Label ID="Label_clientfromto" runat="server" Text="your range for this client"></asp:Label>
                  <br />
              </ContentTemplate>
          </asp:UpdatePanel>
          <asp:UpdatePanel ID="UpdatePanel6" runat="server">
              <ContentTemplate>
                  <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" SelectCommand="SELECT [ID], [User Name] AS User_Name FROM [Users_under] WHERE ([Pid] = @Pid)">
                      <SelectParameters>
                          <asp:SessionParameter DefaultValue="0" Name="Pid" SessionField="id" Type="Int32" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                  
                  <strong>Users:&nbsp; </strong>
                  &nbsp;<asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="User_Name" DataValueField="ID" Height="30px"  Width="250px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                  </asp:DropDownList>
                  &nbsp;<asp:Button ID="btn_refreshusers" runat="server" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-small" Text="Refresh" OnClick="btn_refreshusers_Click" />
                  <br />
                  &nbsp;<asp:Label ID="Label_uservalue" runat="server" Text="0"></asp:Label>
                  <br />
                  <asp:Button ID="btn_AddUser" runat="server" class="w3-btn w3-ripple w3-blue w3-round-xlarge w3-large" Text="Add under User to compaign" OnClick="btn_AddUser_Click" Visible="False" />
                  <br />
                  &nbsp;<strong><br /> Count:&nbsp; </strong><asp:TextBox ID="TextBox_from" runat="server" TextMode="Number" >0</asp:TextBox>
                  &nbsp;<strong><br />
                  <br />
                      <div style="display:none">
                  To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><asp:TextBox ID="TextBox_to" runat="server" TextMode="Number" >0</asp:TextBox>
                  </div>
                  <br />
                  <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" DeleteCommand="DELETE FROM [tb_tembu] WHERE [id] = @id" InsertCommand="INSERT INTO [tb_tembu] ([User id], [User name], [From], [To]) VALUES (@User_id, @User_name, @From, @To)" SelectCommand="SELECT [id], [User id] AS User_id, [User name] AS User_name, [From], [To] FROM [tb_tembu] order by [From] asc" UpdateCommand="UPDATE [tb_tembu] SET [User id] = @User_id, [User name] = @User_name, [From] = @From, [To] = @To WHERE [id] = @id">
                      <DeleteParameters>
                          <asp:Parameter Name="id" Type="Int32" />
                      </DeleteParameters>
                      <InsertParameters>
                          <asp:Parameter Name="User_id" Type="Int32" />
                          <asp:Parameter Name="User_name" Type="String" />
                          <asp:Parameter Name="From" Type="Int32" />
                          <asp:Parameter Name="To" Type="Int32" />
                      </InsertParameters>
                      <UpdateParameters>
                          <asp:Parameter Name="User_id" Type="Int32" />
                          <asp:Parameter Name="User_name" Type="String" />
                          <asp:Parameter Name="From" Type="Int32" />
                          <asp:Parameter Name="To" Type="Int32" />
                          <asp:Parameter Name="id" Type="Int32" />
                      </UpdateParameters>
                  </asp:SqlDataSource>
                  <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource6"  Class="w3-responsive w3-table-all w3-hoverable">
                      <Columns>
                          <asp:TemplateField ShowHeader="False">
                              <ItemTemplate>
                                  <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?'); " class="w3-text-red"></asp:LinkButton>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                          <asp:BoundField DataField="User_id" HeaderText="User_id" SortExpression="User_id" />
                          <asp:BoundField DataField="User_name" HeaderText="User_name" SortExpression="User_name" />
                          <asp:BoundField DataField="From" HeaderText="Count" SortExpression="From" />
                          <asp:BoundField DataField="To" HeaderText="To" SortExpression="To" Visible="false"/>
                      </Columns>
                  </asp:GridView>
                  <br />
                  <strong>Message:</strong>&nbsp;
                  <asp:Button ID="btn_Addcomp" runat="server" class="w3-btn w3-ripple w3-blue w3-round-xlarge w3-larg"  Text="Add under user to compaign" OnClick="btn_Addcomp_Click" Visible="False" />
                  <br />
                  <br />
                 
                  <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel6">
                      <ProgressTemplate>
                          <strong><span class="auto-style1">Updating database...</span> </strong>
                          <img src="pic/loading-29.gif" width="75" />
                          &nbsp;
                      </ProgressTemplate>
                  </asp:UpdateProgress>
                 

                 </ContentTemplate>
             </asp:UpdatePanel>
       
      </div>
</div>
  
       <div id="Users" class="w3-container w3-border city w3-animate-right" >
           
    <h2>Users</h2>
    <p>You can add ,edit or delete Users.</p>
      <div>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" DeleteCommand="DELETE FROM [Users_under] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Users_under] ([User Name], [Pass Word], [Login Date], [Messages sent], [Pid], [User Parent], [Full Name], [Mobile]) VALUES (@User_Name, @Pass_Word, @Login_Date, @Messages_sent, @Pid, @User_Parent, @Full_Name, @Mobile)" SelectCommand="SELECT [ID], [User Name] AS User_Name, [Pass Word] AS Pass_Word, [Login Date] AS Login_Date, [Messages sent] AS Messages_sent, [Pid], [User Parent] AS User_Parent, [Full Name] AS Full_Name, [Mobile] FROM [Users_under] WHERE ([Pid] = @Pid)" UpdateCommand="UPDATE [Users_under] SET [User Name] = @User_Name, [Pass Word] = @Pass_Word, [Login Date] = @Login_Date, [Messages sent] = @Messages_sent, [Pid] = @Pid, [User Parent] = @User_Parent, [Full Name] = @Full_Name, [Mobile] = @Mobile WHERE [ID] = @ID">
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
                    <asp:ControlParameter ControlID="HiddenField_userid" DefaultValue="0" Name="Pid" PropertyName="Value" Type="Int32" />
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
            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" OnDataBound="FormView1_DataBound" OnPageIndexChanging="FormView1_PageIndexChanging">
                <EditItemTemplate>
                    ID:
                    <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                    <br />
                    User_Name:
                    <asp:TextBox ID="User_NameTextBox" runat="server" Text='<%# Bind("User_Name") %>' />
                    <br />
                    Pass_Word:
                    <asp:TextBox ID="Pass_WordTextBox" runat="server" Text='<%# Bind("Pass_Word") %>' />
                    <br />
                    <%--Login_Date:
                    <asp:TextBox ID="Login_DateTextBox" runat="server" Text='<%# Bind("Login_Date") %>' />
                    <br />--%>
                    Messages_sent:
                    <asp:TextBox ID="Messages_sentTextBox" runat="server" Text='<%# Bind("Messages_sent") %>' />
                    <br />
                    User_Parent:
                    <asp:TextBox ID="User_ParentTextBox" runat="server" Text='<%# Bind("User_Parent") %>' />
                    <br />
                    Pid:
                    <asp:TextBox ID="PidTextBox" runat="server" Text='<%# Bind("Pid") %>' />
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
                    User_Name:
                    <asp:TextBox ID="User_NameTextBox" runat="server" Text='<%# Bind("User_Name") %>' />
                    <br />
                    Pass_Word:
                    <asp:TextBox ID="Pass_WordTextBox" runat="server" Text='<%# Bind("Pass_Word") %>' />
                    <br />
                   <%-- Login_Date:
                    <asp:TextBox ID="Login_DateTextBox" runat="server" Text='<%# Bind("Login_Date") %>' />
                    <br />--%>
                    Messages_sent:
                    <asp:TextBox ID="Messages_sentTextBox" runat="server" Text='<%# Bind("Messages_sent") %>' />
                    <br />
                    User_Parent:
                    <asp:TextBox ID="User_ParentTextBox" runat="server" Text='<%# Bind("User_Parent") %>' />
                    <br />
                    Pid:
                    <asp:TextBox ID="PidTextBox" runat="server" Text='<%# Bind("Pid") %>' />
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
                    User_Name:
                    <asp:Label ID="User_NameLabel" runat="server" Text='<%# Bind("User_Name") %>' />
                    <br />
                    Pass_Word:
                    <asp:Label ID="Pass_WordLabel" runat="server" Text='<%# Bind("Pass_Word") %>' />
                   <%-- <br />
                    Login_Date:
                    <asp:Label ID="Login_DateLabel" runat="server" Text='<%# Bind("Login_Date") %>' />--%>
                    <br />
                    Messages_sent:
                    <asp:Label ID="Messages_sentLabel" runat="server" Text='<%# Bind("Messages_sent") %>' />
                    <br />
                    User_Parent:
                    <asp:Label ID="User_ParentLabel" runat="server" Text='<%# Bind("User_Parent") %>' />
                    <br />
                    Pid:
                    <asp:Label ID="PidLabel" runat="server" Text='<%# Bind("Pid") %>' />
                    <br />
                    Full_Name:
                    <asp:Label ID="Full_NameLabel" runat="server" Text='<%# Bind("Full_Name") %>' />
                    <br />
                    Mobile:
                    <asp:Label ID="MobileLabel" runat="server" Text='<%# Bind("Mobile") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" Visible="False" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" Visible="False" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            </asp:FormView>
                   <br />
                        <asp:Label ID="LabelPrice" runat="server" Text="Price" Visible="False"></asp:Label>
                        <br />
              </ContentTemplate>
          </asp:UpdatePanel>
           
            <br />
                <input type="button" ID="Button_getlink"  value="Get user link" class="w3-btn w3-ripple w3-brown w3-round-xlarge w3-medium"/>&nbsp;&nbsp;&nbsp;

              <input type="button" id="Button_copy" value="Copy" onclick="Button_copy()" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-medium" /><br />
          <br />
          <asp:UpdatePanel ID="UpdatePanel7" runat="server">
              <ContentTemplate>
                  <asp:TextBox ID="TextBox_link" runat="server" Width="450px"></asp:TextBox>
              
                  <br />
              
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbomabdoConnectionString %>" SelectCommand="SELECT [ID], [User Name] AS User_Name, [Pass Word] AS Pass_Word, [Login Date] AS Login_Date, [Messages sent] AS Messages_sent, [Pid], [User Parent] AS User_Parent, [Full Name] AS Full_Name, [Mobile] FROM [Users_under] WHERE (([Pid] = @Pid) AND ([User Name] LIKE '%' + @User_Name + '%'))">
                      <SelectParameters>
                          <asp:ControlParameter ControlID="HiddenField_userid" DefaultValue="0" Name="Pid" PropertyName="Value" Type="Int32" />
                          <asp:ControlParameter ControlID="TextBox_search_user" DefaultValue="a" Name="User_Name" PropertyName="Text" Type="String" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                  <asp:HiddenField ID="HiddenField_link" runat="server" />
                  <br />
                  <asp:TextBox ID="TextBox_search_user" runat="server" AutoPostBack="True" OnTextChanged="TextBox_search_user_TextChanged" placeholder="Search for user" Width="234px"></asp:TextBox>
                
                  <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" Class="w3-responsive w3-table-all w3-hoverable" DataKeyNames="ID" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
                      <Columns>
                          <asp:CommandField ShowEditButton="false" ShowSelectButton="True" />
                         <%-- <asp:TemplateField ShowHeader="False">
                              <ItemTemplate>
                                  <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" class="w3-text-red" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete?');" Text="Delete" OnClick="LinkButton2_Click"></asp:LinkButton>
                              </ItemTemplate>
                          </asp:TemplateField>--%>
                          <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                          <asp:BoundField DataField="User_Name" HeaderText="User_Name" SortExpression="User_Name" />
                          <asp:BoundField DataField="Pass_Word" HeaderText="Pass_Word" SortExpression="Pass_Word" />
                          <asp:BoundField DataField="Login_Date" HeaderText="Login_Date" SortExpression="Login_Date" Visible="False" />
                          <asp:BoundField DataField="Messages_sent" HeaderText="Messages_sent" SortExpression="Messages_sent" />
                          <asp:TemplateField HeaderText="Price" Visible="False">
                              <EditItemTemplate>
                                  <asp:TextBox ID="LabelPrice2" runat="server" Text="0"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <%--<asp:Label ID="LabelPrice2" runat="server" Text='<%#Eval("Messages_sent")!=null?(Convert.ToDouble(Convert.ToInt32(Eval("Messages_sent"))/100)*3.5).ToString():"0" %>'></asp:Label>--%>
                                  <asp:Label ID="Label2" runat="server" Text='<%#Eval("Messages_sent")!=null?(Math.Round(Convert.ToDouble(Convert.ToInt32(Eval("Messages_sent")))*0.02857,2)).ToString():"0" %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:BoundField DataField="Full_Name" HeaderText="Full_Name" />
                          <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                      </Columns>
                  </asp:GridView>
              </ContentTemplate>
          </asp:UpdatePanel>
&nbsp;</div>
        </div>
        <div id="Send" class="w3-container w3-border city w3-animate-right" style="display:none">
    <h2>Send messages <iframe src="Send.aspx"  style="height: 500px; width:  100%"></iframe>
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
             var link = "http://kookysleman-001-site2.ctempurl.com/Send.aspx?pid=" + $('#<%=HiddenField_userid.ClientID%>').val()+"&user=" + document.getElementById('FormView1_User_NameLabel').innerText + "&password=" + document.getElementById('FormView1_Pass_WordLabel').innerText;
             $('#<%=TextBox_link.ClientID%>').val(link);

                //alert("done");
            });

     });
</script>