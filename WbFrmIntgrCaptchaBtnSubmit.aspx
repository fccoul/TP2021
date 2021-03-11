<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WbFrmIntgrCaptchaBtnSubmit.aspx.cs" Inherits="WebAppRecaptcha.WbFormIntgrCaptcha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    
   <script src="https://www.google.com/recaptcha/api.js?onload=renderMyCaptcha&render=explicit"
    async defer>
</script>

<body>
    <form id="form1" runat="server">
        <div id="RecaptchContainer"></div>
            <label id="lblMessage" runat="server" clientidmode="static" />
            <br />
            <button type="button">submit</button>
      
    </form>
</body>
</html>
<script  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>  
<script type="text/javascript">
    var your_site_key = '<%=ConfigurationManager.AppSettings["SiteKey"]%>';
    var renderMyCaptcha = function () {
        grecaptcha.render('RecaptchContainer', {
            'sitekey': '6LcJoXQaAAAAAH2kMlXpiLnk-hQ55AKiThs-ubwh',
            'callback': reCaptchaCallback,
            theme: 'dark',
            type: 'image',
            size: 'normal'
        });
    };

        var reCaptchaCallback = function (response) {
            jQuery('#lblMessage').html('');            
            if (response !== '') {                
                jQuery('#lblMessage').css('color', 'green').html('Success !');
            }
        };

        jQuery('button[type="button"]').click(function (e) {
            var message = 'Please check the checkbox';
            if (typeof(grecaptcha)!='undefined') {
                var response = grecaptcha.getResponse();
                (response.length === 0) ? (message = 'Captcha verification failed') : (message = 'Success Captcha Kpleus !');
            }
            jQuery('#lblMessage').html(message);
            jQuery('#lblMessage').css('color', (message.toLowerCase().includes('success')) ? "green" : "red");
        });
    
</script>
