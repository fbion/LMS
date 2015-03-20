using System;
using System.Text;
using System.Web;
using System.IO;

namespace com.hooyes.lms
{
    public class HttpImg : IHttpHandler
    {
        public bool IsReusable
        {
            get { return true; }
        }
        public void ProcessRequest(HttpContext context)
        {
            var auth = HttpContext.Current.Request.Cookies.Get("Resx");
            if (auth == null || string.IsNullOrEmpty(auth.Value))
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
                   
                    case ".jpg":
                        response.ContentType = "image/jpeg";
                        break;
                    case ".gif":
                        response.ContentType = "image/gif";
                        break;
                    case ".png":
                        response.ContentType = "image/png";
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

