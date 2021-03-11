<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WbFrmRecaptchaInvisible.aspx.cs" Inherits="WebAppRecaptcha.WbFrmRecaptchaInvisible" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css" />  
<script src="https://www.google.com/recaptcha/api.js" async="async" defer="defer"></script> 
</head>
<body>
    <form id="htmlForm" runat="server">
        <!-----with invisible like V3---->
         <div class="g-recaptcha"
             data-sitekey="<%:captchaSiteKey%>"
            data-callback="onSubmit"
            data-size="invisible"></div>

        <!--with images + checkbox-->
        <!--
        <div class="g-recaptcha"
             data-sitekey="<%:captchaSiteKey%>"
            data-callback="onSubmit"
           ></div>-->

        <h2>Sample Form with Invisible Recaptcha v2</h2>
        <span>Fisrt Name</span>
        <span><asp:TextBox ID="txtName" runat="server"></asp:TextBox></span>
        <br />
        <br />

  
        <asp:Button Text="Suscribe Here" ID="btnSuscribe" runat="server" CssClass="btn btn-primary" OnClick="btnSuscribe_Click"/>

        <label id="lblMessage" runat="server" />
    </form>
</body>
</html>
<script  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>  
<script type="text/javascript">

    var btnSusribeEvent = null;

    function doLoad() {
        var btn = document.getElementById("<%:btnSuscribe.ClientID%>");
        btnSusribeEvent = btn.onclick;
        btn.onclick = DoValidate;
    }

    function DoValidate(event) {
        event.preventDefault();
        //if (Page_ClientValidate()) {
        //    grecaptcha.execute();
        //}
        debugger
        if (typeof (Page_ClientValidate) === 'function') {
            Page_ClientValidate();
            if (Page_IsValid == true) {
                alert('the form is valid');
            }
        } else {
            //alert("no");
            //if ($(this).valid()) {
            //    alert('the form is valid not page');
            //}
            //return true;
            if ($("#txtName").val().length>0)
                grecaptcha.execute();
            else
                alert('the form is valid not page');
        }
    }

    function onSubmit() {
        var btn = document.getElementById("<%:btnSuscribe.ClientID%>");
        btn.onclick=btnSusribeEvent
        btn.click();
    }

<%--    function onSubmit(token) {
        //alert(token);        //if (token !== '') {
        //    jQuery('#lblMessage').css('color', 'green').html('Success !');
        //    document.getElementById("htmlForm").submit();
        //}
        //else {
        //    jQuery('#lblMessage').css('color', 'red').html('failed ibot gotcha !');
        //}
        //document.getElementById("htmlForm").submit();
        ("<%=btnSuscribe.ClientID%>").click();

        
    }--%>


    doLoad();
</script>
