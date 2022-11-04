<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Webmethod.aspx.cs" Inherits="whatslink.Webmethod" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" >
        <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
        <fieldset style="width: 200px;">
            <asp:Label ID="lblEmailAddress" runat="server" Text="Email Address"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </fieldset>
        <div>
        </div>
        <asp:Button ID="btnCreateAccount" runat="server" Text="Signup" OnClientClick="Signup();return false;" OnClick="btnCreateAccount_Click" />
            
            <br />
            <br />
            <a id="sendbtn" runat="server" class="w3-btn w3-ripple w3-blue w3-round-xlarge w3-xlarge" href="#" onclick="Signup();" target="_blank">Send</a></div>
        <iframe src="upload.aspx" scrolling="no" style="height: 350px; width: 350px"></iframe>
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Height="235px" TextMode="MultiLine" Width="546px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" target="_blank"/>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
        <br />
        <a href="whatsapp://send?phone=201157994016&text=The text to share!\nhttp://hishoo33-001-site5.dtempurl.com/picwhats/E_Boss.png" data-action="share/whatsapp/share">Share via Whatsapp</a>
        <br />
         <a href="https://api.whatsapp.com/send/?phone=201157994016&text=http://hishoo33-001-site5.dtempurl.com/picwhats/E_Boss.png" >hishoo Share via Whatsapp233</a>
    </form>
</body>
</html>

<script type="text/javascript">
    function Signup() {
        var email = document.getElementById('<%=txtEmail.ClientID %>').value;
        var password = document.getElementById('<%=txtPassword.ClientID %>').value;

        PageMethods.RegisterUser(email, password, onSucess, onError);

        function onSucess(result) {
            document.getElementById('<%=Label1.ClientID %>').innerText = result;
            document.getElementById('<%=TextBox1.ClientID %>').value = result;
            alert(result);
        }

        function onError(result) {
            document.getElementById('<%=Label1.ClientID %>').innerText = 'Cannot process your request at the moment, please try later.';
            alert('Cannot process your request at the moment, please try later.');
        }
    }
</script>
