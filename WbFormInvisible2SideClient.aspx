<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WbFormInvisible2SideClient.aspx.cs" Inherits="WebAppRecaptcha.WbFormInvisible2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        Name (*required) <input id="field" name="field" />
         

       
        <div id="recaptcha" class="g-recaptcha"
                  data-sitekey="6LfkqHUaAAAAAIq9b2x2qpm03Tn_6fjCTixhslaU"
                  data-callback="onSubmit"
                   data-size="invisible"></div>
        <br />

             <button id="submit">submit</button>
        
    </form>
</body>
</html>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script type="text/javascript">
    function onSubmit(token) {
        alert('thanks' + document.getElementById('field').value)
    }

    function validate(event) {
        event.preventDefault();
        if (!document.getElementById('field').value) {
            alert('you must entre your name man !');
        }
        else {
            grecaptcha.execute();
        }

    }

    function onload() {
        var element = document.getElementById('submit');
        element.onclick = validate;
    }
</script>
<script>
    onload();
</script>
