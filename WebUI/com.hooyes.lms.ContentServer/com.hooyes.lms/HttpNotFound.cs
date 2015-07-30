using System.Web;
using System.IO;
using System.Configuration;
using System.Text.RegularExpressions;

namespace com.hooyes.lms
{
    public class HttpNotFound : IHttpHandler
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public bool IsReusable
        {
            get { return true; }
        }
        public void ProcessRequest(HttpContext context)
        {
            log.Debug("IP:{0}", context.Request.UserHostAddress);
            var gonext = true;
            if (context.Request.UrlReferrer != null)
            {
                string rhost = context.Request.UrlReferrer.Host;

                log.Debug("r:{0}", context.Request.UrlReferrer.PathAndQuery);
                log.Debug("r:{0}", context.Request.FilePath);
                log.Debug("UrlReferrer,csHost:{0}/{1}", rhost, context.Request.Url.Host);

                var chost = ConfigurationManager.AppSettings.Get("Referrer_Host");
                if (!Regex.IsMatch(rhost, chost))
                {
                    gonext = false;
                }
                // For chrome view source
                if (context.Request.UrlReferrer.PathAndQuery == context.Request.FilePath)
                {
                    gonext = false;
                }

                // Forbidden download 
                if (rhost == context.Request.Url.Host)
                {
                    gonext = false;
                }

            }
            else
            {
                gonext = false;
            }

            //var auth = HttpContext.Current.Request.Cookies.Get("Resx");
            //if (auth == null || string.IsNullOrEmpty(auth.Value))
            //{
            //    gonext = false;
            //}
            log.Debug("gonext:{0}", gonext);
            

            if (!gonext)
            {
                log.Info("------U B------");
                log.Info("Next:{0}", gonext);
                log.Info("IP:{0}", context.Request.UserHostAddress);
                log.Info("UserAgent:{0}", context.Request.UserAgent);
                log.Info("UrlReferrer:{0}", context.Request.UrlReferrer);
                log.Info("------U E------");
                context.Response.Write("Not Found");
            }
            else
            {
                Real(context.Response, context.Request);
            }
        }
        private void Real(HttpResponse response, HttpRequest request)
        {

            string Files_Root = ConfigurationManager.AppSettings.Get("ContentRoot");
            string Files_PhysicalPath = request.FilePath;
            Files_PhysicalPath = string.Format("{0}{1}", Files_Root, request.FilePath.Replace("/", "\\"));

            //response.Write(Files_PhysicalPath);
            //response.End();

            if (File.Exists(Files_PhysicalPath))
            {
                FileInfo file = new System.IO.FileInfo(Files_PhysicalPath);
                response.Clear();
                response.AddHeader("Content-Disposition", "filename=" + file.Name);
                response.AddHeader("Content-Length", file.Length.ToString());
                string fileExtension = file.Extension.ToLower();
                switch (fileExtension)
                {
                    case ".mp4":
                        response.ContentType = "video/mp4";
                        break;
                    case ".mp3":
                        response.ContentType = "audio/mpeg3";
                        break;
                    case ".mpeg":
                        response.ContentType = "video/mpeg";
                        break;
                    case ".jpg":
                        response.ContentType = "image/jpeg";
                        break;
                    case ".bmp":
                        response.ContentType = "image/bmp";
                        break;
                    case ".gif":
                        response.ContentType = "image/gif";
                        break;
                    case ".doc":
                        response.ContentType = "application/msword";
                        break;
                    case ".css":
                        response.ContentType = "text/css";
                        break;
                    case ".html":
                        response.ContentType = "text/html";
                        break;
                    case ".htm":
                        response.ContentType = "text/html";
                        break;
                    case ".swf":
                        response.ContentType = "application/x-shockwave-flash";
                        break;
                    case ".exe":
                        response.ContentType = "application/octet-stream";
                        break;
                    case ".inf":
                        response.ContentType = "application/x-texinfo";
                        break;
                    default:
                        response.ContentType = "application/octet-stream";
                        break;
                }

                response.WriteFile(file.FullName);
                response.End();
            }
            else
            {
                response.Write("File Not Exists");
            }
        }
    }
}

