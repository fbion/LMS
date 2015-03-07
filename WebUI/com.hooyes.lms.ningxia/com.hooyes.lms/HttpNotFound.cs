using System;
using System.Text;
using System.Web;
using System.IO;

namespace com.hooyes.lms
{
    public class HttpNotFound : IHttpHandler
    {
        public bool IsReusable
        {
            get { return true; }
        }
        public void ProcessRequest(HttpContext context)
        {
            var auth = HttpContext.Current.Request.Cookies.Get("Resx");
            if (auth == null || string.IsNullOrEmpty(auth.Value) )
            {
                context.Response.Write("Not Found");
            }
            else
            {
                Real(context.Response, context.Request);
            }
        }
        private void Real(HttpResponse response, HttpRequest request)
        {
            if (File.Exists(request.PhysicalPath))
            {
                FileInfo file = new System.IO.FileInfo(request.PhysicalPath);
                response.Clear();
                response.AddHeader("Content-Disposition", "filename=" + file.Name);
                response.AddHeader("Content-Length", file.Length.ToString());
                string fileExtension = file.Extension.ToLower();
                switch (fileExtension)
                {
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

