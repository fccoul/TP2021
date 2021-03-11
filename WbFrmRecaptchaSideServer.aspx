<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WbFrmRecaptchaSideServer.aspx.cs" Inherits="WebAppRecaptcha.WbFrmRecaptchaSideServer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" method="post">
        
         <div class="g-recaptcha" data-sitekey="6LcJoXQaAAAAAH2kMlXpiLnk-hQ55AKiThs-ubwh"  data-theme="dark">
        </div>

        <label id="lblMessage" runat="server"  />

         <br />
            <%--<button type="button" id="btnReca" runat="server">submit</button>--%>
        <asp:Button  Text="Check Human" ID="btnAsp" runat="server" OnClick="btnCaptcha_Click" />
        <%--<input type="button" id="btnCaptcha" runat="server" value="Check Human" OnClick="btnCaptcha_Click" />--%>
    </form>
</body>
</html>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script type="text/javascript">

</script>
