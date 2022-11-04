<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="whatslink._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Send</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <style>
        #Button1{
           margin: 15px auto 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"  EnablePageMethods="true" AsyncPostBackTimeout="1000"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                     <asp:Label ID="Label_phon" runat="server" Text="Loading...." style="font-weight: 700; "></asp:Label>
                    <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"> </asp:Timer>
                    <br />
                    <asp:TextBox ID="TextBox_message" runat="server" Height="317px" Width="75%" TextMode="MultiLine"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel>

             <asp:HiddenField ID="HiddenField1" runat="server" />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Send" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-xlarge" OnClick="Button1_Click" />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-xlarge" OnClick="LinkButton1_Click">Send 2</asp:LinkButton>
            <br />
            <br />
            <a id="sendbtn" href="#" target="_blank" class="w3-btn w3-ripple w3-blue w3-round-xlarge w3-xlarge" runat="server" onclick="Getnumber();">Send</a>

        </div>
        <asp:TextBox ID="TextBox1" runat="server" Width="476px"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="Button" OnClientClick="Getnumber(); return false;" />
    </form>
</body>
</html>
<script type="text/javascript">
    function Getnumber() {
        

        PageMethods.Getnextnumber(onSucess, onError);

        function onSucess(result) {
            //alert(result);
            //const hm = result;
            result.forEach(myFunction);
            
            function myFunction(value) {
                document.getElementById('<%=TextBox1.ClientID%>').value += value;
            
            } 
            
        }

        function onError(result) {
           
            alert('Cannot process your request at the moment, please try later.');
        }
    }
</script>