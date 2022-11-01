<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Send.aspx.cs" Inherits="whatslink.Send" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Send</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .grad2 {
            /*height: 150px;
  width: 200px;*/
            background-color: darkgray; /* For browsers that do not support gradients */
            background-image: radial-gradient(circle, darkgray, black);
        }
        #ButtonInfo {
            background-color:yellow;
        }
        #senddiv {
            position: absolute;
            top: 40px;
            left: 5px;
            display:none;
        }
        a.disabled {
  pointer-events: none;
  cursor: default;
}
    </style>
</head>
<body style="background-color: darkgray" class="grad2">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
            </asp:ScriptManager>



            <div style="text-align: center; margin: 15% 1%; font-weight: 700; color: #FFCC00; font-size: x-large;">
                <br />

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:HiddenField ID="HiddenField_userid" runat="server" />
                        <asp:HiddenField ID="HiddenField_pid" runat="server" Value="0" />
                        <asp:HiddenField ID="HiddenField_clientid" runat="server" />
                        <asp:HiddenField ID="HiddenField_compid" runat="server" Value="0" OnValueChanged="HiddenField_compid_ValueChanged" />
                        <asp:HiddenField ID="HiddenField_parent" runat="server" />
                        <asp:HiddenField ID="HiddenField_ufullname" runat="server" />
                        <asp:HiddenField ID="HiddenField_timerstop" runat="server" Value="no" />
                        <asp:HiddenField ID="HiddenField_message" runat="server" Value="0" />
                        <asp:HiddenField ID="HiddenField_w_h" runat="server" Value="0" />
                        <%--<asp:Label ID="ButtonInfo" runat="server" Text="Info"  Visible="False" class="w3-btn w3-ripple w3-green w3-round-xlarge w3-large w3-text-white"></asp:Label>--%>
                        <asp:Literal ID="ButtonInfo" runat="server" Text="Info" Visible="False" ></asp:Literal>
                        <br />
                        <br />

                        <%-- <asp:Button ID="Label_phon" runat="server" Text="Loading...." Style="font-weight: 700; text-align: center; font-size: x-large;" Font-Bold="True" class="w3-btn w3-ripple w3-black w3-round-xlarge w3-xxxlarge w3-text-white"></asp:Button>--%>
                        <div id="number" runat="server">
                            <asp:Button ID="Label_phon" runat="server" Text="Loading...." Style="font-weight: 700; text-align: center; font-size: x-large;" Font-Bold="True" class="w3-btn w3-ripple w3-black w3-round-xlarge w3-xxxlarge w3-text-white" OnClientClick="showsend(); return false" />
                        </div>

                        <asp:Button ID="Buttonsend" runat="server" Text="Send 1" class="w3-btn w3-ripple w3-blue w3-round-xlarge w3-xxlarge" OnClick="Buttonsend_Click" Visible="False" target="_blank" Style="display: none" />

                        <div id="senddiv" style="display: none" runat="server">
                            <a id="sendbtn" href="#" target="_blank" class="w3-btn w3-ripple w3-blue w3-round-xlarge w3-xxlarge" runat="server" onclick="return Getnumber();">Send</a>
                        </div>

                        <asp:TextBox ID="TextBox_message" runat="server" Height="317px" Width="85%" TextMode="MultiLine" Visible="False" ></asp:TextBox>
                        <asp:Timer ID="Timer1" runat="server" Interval="2500" OnTick="Timer1_Tick"></asp:Timer>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="sendbtn" />

                    </Triggers>
                </asp:UpdatePanel>


                <br />

                <br />
            </div>

        </div>
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
    </form>
</body>
</html>
<script type="text/javascript">
    $(function () {
        //get div
        //var randomdiv = document.getElementById('send');

        $randomdiv = $("#senddiv");
        // make position sensitive to size and document's width
        var divsizew = $randomdiv.width();
        var divsizey = $randomdiv.height();
        //alert(divsizew);
        //alert(divsizey);
        var posx = (Math.random() * ($(document).width() - divsizew)).toFixed();
        var posy = (Math.random() * ($(document).height() - divsizey)).toFixed();

        //alert("posx = " + posx);
        //alert("posy = " + posy);
        document.getElementById('<%=HiddenField_w_h.ClientID %>').value = posx + ',' + posy;
         $randomdiv.css({
             'position': 'absolute',
             'left': posx + 'px',
             'top': posy + 'px',
             //'display': 'none'
         });

        
     });
    //var x = 0;
    function disableTimer() {
        alert("hi");
        <%--var timer = Sys.Application.findComponent('<%= Timer1.ClientID %>');
        timer.set_Enabled = false;
        timer._stopTimer();--%>
        var timer = $find('<%= Timer1.ClientID %>');
        timer._stopTimer();
        alert('hi7');
        return false;
    }

    function showsend() {
        //alert('show' + x);
        var lblphone = document.getElementById('<%=Label_phon.ClientID%>').value;
        if (lblphone === "none" || lblphone === "All number done") {
            return;
        }

        $randomdiv = $("#senddiv");
        // make position sensitive to size and document's width
        var divsizew = $randomdiv.width();
        var divsizey = $randomdiv.height();
        //alert(divsizew);
        //alert(divsizey);
        var posx = (Math.random() * ($(document).width() - divsizew)).toFixed();
        var posy = (Math.random() * ($(document).height() - divsizey)).toFixed();

        //alert("posx = " + posx);
        //alert("posy = " + posy);
        document.getElementById('<%=HiddenField_w_h.ClientID %>').value = posx + ',' + posy;
        $randomdiv.css({
            'position': 'absolute',
            'left': posx + 'px',
            'top': posy + 'px',
            //'display': 'none'
        });

        document.getElementById('number').style.display = "none";
        document.getElementById('senddiv').style.display = "block";
      //  alert(document.getElementById('<%=Label_phon.ClientID%>').value);
        document.getElementById('<%=HiddenField_timerstop.ClientID %>').value = 'yes';
    }

    function Getnumber() {
        //x++;
        //document.getElementById('number').style.display = "block";
       
        //alert('start');
        var idhm1 = document.getElementById('<%=HiddenField1.ClientID %>').value;
        var userid = document.getElementById('<%=HiddenField_userid.ClientID %>').value;
        var pid = document.getElementById('<%=HiddenField_pid.ClientID %>').value;
        var clientid = document.getElementById('<%=HiddenField_clientid.ClientID %>').value;
        var compid = document.getElementById('<%=HiddenField_compid.ClientID %>').value;
        document.getElementById('<%=HiddenField_timerstop.ClientID %>').value = 'no';
        //alert(idhm1 + (++x));
        //alert(document.getElementById('<%=Label_phon.ClientID%>' +).value + (++x));
        PageMethods.Getnextnumber(idhm1, userid, pid, clientid, compid, onSucess, onError);

        //location.reload();
        document.getElementById('sendbtn').classList.add("disabled");
        function onSucess(result) {
            //alert('onSucess');
           
           
            //alert(result[3]);
          
            //alert(result[2]);

            document.getElementById('<%=HiddenField1.ClientID%>').value = result[0];
            //alert(result[0]);
            document.getElementById('<%=Label_phon.ClientID%>').value = result[1];
            //alert(result[1]);
            //document.getElementById('<%=TextBox_message.ClientID%>').value = result[2];
            document.getElementById('<%=HiddenField_message.ClientID%>').value = result[2];
            //alert(result[2]);
            document.getElementById('sendbtn').href = result[3];
            //alert(result[3]);
            document.getElementById('<%=HiddenField_clientid.ClientID%>').value = result[4];
            //alert(result[4]);
            //alert(result + (++x));

            //alert(document.getElementById('<%=Label_phon.ClientID%>').value + (++x));
            //alert('onSucess end');
            //document.getElementById('senddiv').style.display = "none";
           
            //document.getElementById('sendbtn').disabled = true;
            //location.reload(); 
            document.getElementById('sendbtn').classList.add("disabled");
            setTimeout(function () { document.getElementById('sendbtn').classList.remove("disabled"); document.getElementById('senddiv').style.display = "none"; document.getElementById('number').style.display = "block";/* alert("Hellohm");*/ /*location.reload();*/ }, 100);
        }

        function onError(result) {

            alert('Cannot process your request at the moment, please try later.');
        }
        return true;
    }
</script>
