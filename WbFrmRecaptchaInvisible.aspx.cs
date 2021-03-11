using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppRecaptcha
{
    public partial class WbFrmRecaptchaInvisible : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSuscribe_Click(object sender, EventArgs e)
        {
            //var recaptchaResponse = Request.Form["g-recaptcha-response"];
            //var isvaliddRecaptcha=Utils
            if (!Recaptcha.Validate(captchaPrivateSiteKey, Request.Form["g-recaptcha-response"]))
            {
                lblMessage.InnerText = "failed Recaptcha InValide !!!";
            }
            else if(IsValid)
            {
                //put here business logic
                //for instance
                #region user
                //var manager = new UserManager();
                //ApplicationUser user = manager.Find(UserName.Text, Password.Text);
                //if (user != null)
                //{
                //    IdentityHelper.SignIn(manager, user, RememberMe.Checked);
                //    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                //}
                //else
                //{
                //    FailureText.Text = "Login failed";
                //    ErrorMessage.Visible = true;
                //}
                #endregion
                if (txtName.Text.Length > 5)
                    lblMessage.InnerText = "suscribe OK guys !";
                else
                {
                    lblMessage.InnerText = "Suscribe failed man ! try again later";
                    //lblMessage.fo
                }
            }
        }

        public  bool ValidateRecaptcha(string recaptchaUserResponse)
        {
            var result = false;
            
            if (!string.IsNullOrWhiteSpace(recaptchaUserResponse))
            {
                var secretkey = "6LfkqHUaAAAAAHIM0x7UMo4vgekRL96IkM_dzrG2";
                var useripAddress = HttpContext.Current.Request.UserHostAddress;
                var url=string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}&remoteip={2}",
                               secretkey, recaptchaUserResponse, useripAddress);
                //var client=new RestClient
            }
            return result;
        }

        public string captchaSiteKey
        {
            get
            {
                return ConfigurationManager.AppSettings["PublicKeyInvisiblev2"];
            }
        }

        public string captchaPrivateSiteKey
        {
            get
            {
                return ConfigurationManager.AppSettings["SecretKeyInvisiblev2"];
            }
        }
    }
}