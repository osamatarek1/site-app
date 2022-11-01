<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Send_new.aspx.cs" Inherits="whatslink.Send_new" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Send</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

   <%--  <link rel="stylesheet" href="JsCss/w3.css" />
    <script src="JsCss/jquery.min.js"></script>--%>
    <script>

        //$(function makeDiv() {
        //    // vary size for fun
        //    var divsize = ((Math.random() * 100) + 50).toFixed();
        //    var color = '#' + Math.round(0xffffff * Math.random()).toString(16);
        //    $newdiv = $('<div/>').css({
        //        'width': divsize + 'px',
        //        'height': divsize + 'px',
        //        'background-color': color
        //    });

        //    // make position sensitive to size and document's width
        //    var posx = (Math.random() * ($(document).width() - divsize)).toFixed();
        //    var posy = (Math.random() * ($(document).height() - divsize)).toFixed();

        //    $newdiv.css({
        //        'position': 'absolute',
        //        'left': posx + 'px',
        //        'top': posy + 'px',
        //        'display': 'none'
        //    }).appendTo('body').fadeIn(100).delay(1000).fadeOut(500, function () {
        //        $(this).remove();
        //        makeDiv();
        //    });
        //})();

        $(function () {
            //get div
            //var randomdiv = document.getElementById('send');

            $randomdiv = $("#send");
            // make position sensitive to size and document's width
            var divsizew = $randomdiv.width();
            var divsizey = $randomdiv.height();
            //alert(divsizew);
            //alert(divsizey);
            var posx = (Math.random() * ($(document).width() - divsizew)).toFixed();
            var posy = (Math.random() * ($(document).height() - divsizey)).toFixed();

            //alert("posx = " + posx);
            //alert("posy = " + posy);
            document.getElementById('<%=HiddenField_w_h.ClientID %>').value = posx+ ','+posy;
            $randomdiv.css({
                'position': 'absolute',
                'left': posx + 'px',
                'top': posy + 'px',
                //'display': 'none'
            });

            $randomdivsent = $("#issent");
            // make position sensitive to size and document's width
            var sentdivsizew = $randomdivsent.width();
            var sentdivsizey = $randomdivsent.height();

            var sentposx = (Math.random() * ($(document).width() - sentdivsizew)).toFixed();
            var sentposy = (Math.random() * ($(document).height() - sentdivsizey)).toFixed();

            $randomdivsent.css({
                'position': 'absolute',
                'left': sentposx + 'px',
                'top': sentposy + 'px',
                //'display': 'block'
            });
        });

        function showsend() {
            if ($("#Label_phon").val() == "All number done") {
                return false;
            }
            $("#number").css({
                'display': 'none'
            });
            $randomdiv = $("#send");
            // make position sensitive to size and document's width
            var divsizew = $randomdiv.width();
            var divsizey = $randomdiv.height();
            //alert(divsizew);
            //alert(divsizey);
            var posx = (Math.random() * ($(document).width() - divsizew)).toFixed();
            var posy = (Math.random() * ($(document).height() - divsizey)).toFixed();

            //alert("posx = " + posx);
            //alert("posy = " + posy);

            $randomdiv.css({
                'position': 'absolute',
                'left': posx + 'px',
                'top': posy + 'px',
                'display': 'block'
            });
            //return false;
        }

        function showIssent() {
            setTimeout(function () {
                $("#send").css({
                    'display': 'none'
                });


                $randomdiv = $("#issent");
                // make position sensitive to size and document's width
                var divsizew = $randomdiv.width();
                var divsizey = $randomdiv.height();

                var posx = (Math.random() * ($(document).width() - divsizew)).toFixed();
                var posy = (Math.random() * ($(document).height() - divsizey)).toFixed();

                $randomdiv.css({
                    'position': 'absolute',
                    'left': posx + 'px',
                    'top': posy + 'px',
                    'display': 'block'
                });
            }, 1000);
           
            //return false;
        }

        
        function showNumber() {
            setTimeout(function () {
                $("#issent").css({
                    'display': 'none'
                });

                $("#number").css({
                    'display': 'block'
                });

                $("#send").css({
                    'display': 'none'
                });
                //return false;
            }, 2000);
        }

    </script>
    <style>
        #send {
            position: absolute;
            top: 40px;
            left: 5px;
            display:none;
        }
         #issent {
            position: absolute;
            top: 40px;
            left: 100px;
            display:none;
        }

           .grad2 {
            /*height: 150px;
  width: 200px;*/
            background-color: darkgray; /* For browsers that do not support gradients */
            background-image: radial-gradient(circle, darkgray, black);
        }
        #ButtonInfo {
            background-color:yellow;
        }
    </style>
</head>
<body style="background-color: darkgray" class="grad2">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="text-align: center; margin: 15% 1%; font-weight: 700; color: #FFCC00; font-size: x-large;">
                    <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                        <asp:HiddenField ID="HiddenField_userid" runat="server" />
                        <asp:HiddenField ID="HiddenField_pid" runat="server" Value="0" />
                        <asp:HiddenField ID="HiddenField_clientid" runat="server" />
                        <asp:HiddenField ID="HiddenField_compid" runat="server" Value="0" />
                        <asp:HiddenField ID="HiddenField_parent" runat="server" />
                        <asp:HiddenField ID="HiddenField_ufullname" runat="server" />
                        <asp:HiddenField ID="HiddenField_timerstop" runat="server" Value="no" />
                        <asp:HiddenField ID="HiddenField_message" runat="server" Value="0" />
                    <asp:HiddenField ID="HiddenField_w_h" runat="server" Value="0" />
                     <asp:Literal ID="ButtonInfo" runat="server" Text="Info" Visible="False" ></asp:Literal>
                        <br />
                        <br />
                    <div id="number" runat="server">
                        <asp:Button ID="Label_phon" runat="server" Text="Loading...." Style="font-weight: 700; text-align: center; font-size: x-large;" Font-Bold="True" class="w3-btn w3-ripple w3-black w3-round-xlarge w3-xxxlarge w3-text-white" OnClientClick="return showsend(); " OnClick="Label_phon_Click" />
                    </div>
                    <div id="send" runat="server">
                        <asp:Button ID="Button1" runat="server" Style="margin: 4px 4px 4px 4px" class="w3-btn w3-ripple w3-blue w3-round-xlarge w3-large" OnClick="Button1_Click" OnClientClick="showNumber();" Text="Send" />
                    </div>
                    <div id="issent" runat="server" style="margin: 4px 4px 4px 4px" class="w3-btn w3-ripple w3-blue w3-round-xxlarge w3-xxlarge">
                        <p>
                            <asp:Label ID="Label_number" runat="server" Text="Label" Visible="false" style="color: #990033"></asp:Label>&nbsp;Is sent ?</p>
                        <asp:Button ID="Button_yes" runat="server" Style="margin: 4px 4px 4px 4px" class="w3-btn w3-ripple w3-green w3-round-large w3-large" Text="Yes" OnClientClick="showNumber();" OnClick="Button_yes_Click" />
                        <asp:Button ID="Button_no" runat="server" Style="margin: 4px 4px 4px 4px" class="w3-btn w3-ripple w3-red w3-round-large w3-large" Text="No" OnClientClick="showNumber();" OnClick="Button_no_Click" />
                    </div>
                </div>
                <asp:Timer ID="Timer1" runat="server" Interval="7000" OnTick="Timer1_Tick"></asp:Timer>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
