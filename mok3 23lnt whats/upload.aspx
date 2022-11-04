<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="whatslink.upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <form id="upload" method="post" action="upload.aspx" enctype="multipart/form-data" runat="server">

        <div id="drop">
            Drop Here
			<a>Browse</a>
            <input type="file" name="upl" accept="text/*" <%--multiple="multiple"--%> />
        </div>

        <ul id="menuh" runat="server">
            <!-- The file uploads will be shown here -->
        </ul>
    </form>

    <!-- JavaScript Includes -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="assets/js/jquery.knob.js"></script>

    <!-- jQuery File Upload Dependencies -->
    <script src="assets/js/jquery.ui.widget.js"></script>
    <script src="assets/js/jquery.iframe-transport.js"></script>
    <script src="assets/js/jquery.fileupload.js"></script>

    <!-- Our main JS file -->
    <script src="assets/js/script.js"></script>

    <!-- Google web fonts -->
    <link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700" rel='stylesheet' />

    <!-- The main CSS file -->
    <link href="assets/css/style.css" rel="stylesheet" />
</body>
</html>
