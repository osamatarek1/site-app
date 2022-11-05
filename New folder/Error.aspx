<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="whatslink.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Error</title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
    </style>
</head>
<body style="background-color: #800000">
    <form id="form1" runat="server">
        <div style="font-weight: 700; text-decoration: underline; text-align: center; color: #FFDDDD" class="auto-style1">
            Error Page
        </div>
        <br />
        <br />
        <div style="font-weight: 700; text-align: center; color: #FFDDDD; font-size: x-large;">
            <asp:Label ID="Label_Error" runat="server" Text="Error"></asp:Label>
        </div>
        
    </form>
</body>
</html>
