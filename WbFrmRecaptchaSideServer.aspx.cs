using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppRecaptcha
{
    public partial class WbFrmRecaptchaSideServer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public bool IsRecaptchaValid()
        {
            var result = false;
            var captchaResponse = Request.Form["g-recaptcha-response"]; 
            var secretkey = ConfigurationManager.AppSettings["SecretKey"];
            //var secretkey = ConfigurationManager.AppSettings["6LcJoXQaAAAAAGzp_rzaUszwB0TCickbqc58W7eX"];
            var apiUrl = "https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}";
            var requestUri = string.Format(apiUrl, secretkey, captchaResponse);
            var request = (HttpWebRequest)WebRequest.Create(requestUri);
            using (WebResponse response=request.GetResponse())
            {
                using (StreamReader stream = new StreamReader(response.GetResponseStream()))
                {
                    JObject jResponse = JObject.Parse(stream.ReadToEnd());
                    var isSuccess = jResponse.Value<bool>("success");
                    result = (isSuccess) ? true : false;
                }
            }
            return result;
        }


        protected void btnCaptcha_Click(object sender,EventArgs e)
        {
            lblMessage.InnerHtml = (IsRecaptchaValid())
                ? "<span style='color:green'>Captcha Validation Success</span>"
                : "<span style='color:red'>Captcha Validation failed</span>";

           
        }

        protected void btnAsp_Click(object sender, EventArgs e)
        {

        }
    }
}