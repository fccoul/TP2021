using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppRecaptcha
{
    public class Recaptcha
    {
        string m_Success;
        List<string> m_ErrorCodes;
        public static bool Validate(string privateKey,string reCaptchaResponse)
        {
            var client = new System.Net.WebClient();
            var googleReply=client.DownloadString(string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", privateKey, reCaptchaResponse));
            var captchaResponse =JsonConvert.DeserializeObject<Recaptcha>(googleReply);
            return (captchaResponse.m_Success.ToLower() == "true");
        }


        [JsonProperty("success")]
        public string Success
        {
            set { m_Success = value; }
            get { return m_Success; }
        }


        [JsonProperty("error-codes")]
        public List<string> ErrorCodes
        {
            set { m_ErrorCodes = value; }
            get { return m_ErrorCodes; }
        }
    }


}


