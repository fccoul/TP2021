<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WbFAuthen.aspx.cs" Inherits="WebAppRecaptcha.WbFAuthen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Welcome Page test ReCaptacha v2...</h1>
    <form id="form1" runat="server">
        <%--<div class="g-recaptcha" data-sitekey="6LcJoXQaAAAAAH2kMlXpiLnk-hQ55AKiThs-ubwh"  data-theme="dark" data-type="audio">--%>
        <%--<div class="g-recaptcha" data-sitekey="6LcJoXQaAAAAAH2kMlXpiLnk-hQ55AKiThs-ubwh"  data-theme="dark" data-size="normal">--%>
        <div class="g-recaptcha" data-sitekey="6LcJoXQaAAAAAH2kMlXpiLnk-hQ55AKiThs-ubwh"  data-theme="dark" data-size="compact">
        </div>
    </form>
</body>
</html>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
