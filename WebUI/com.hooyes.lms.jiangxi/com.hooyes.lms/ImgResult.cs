using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Text;
using System.Web;
using System.Drawing;
using System.IO;
using NLog;
using System.Drawing.Imaging;

namespace com.hooyes.lms
{
    public class ImgResult : ActionResult
    {
        private static Logger log = LogManager.GetCurrentClassLogger();
        private string imgname { get; set; }
        private string imgpath { get; set; }
        public override void ExecuteResult(ControllerContext context)
        {
            ResponseImg(context.HttpContext.Response, imgname);
        }
        public ImgResult(string name)
        {
            imgname = name;
            imgpath = "logo";
        }
        public ImgResult(string name,string path)
        {
            imgname = name;
            imgpath = path;
        }
        private void ResponseImg(HttpResponseBase response, string pic)
        {
            try
            {
                string FilePath = AppDomain.CurrentDomain.BaseDirectory;
                FilePath = Path.Combine(FilePath, "App_Data\\" + imgpath);
                string FileFullPath = Path.Combine(FilePath, pic);
                string FileExt = Path.GetExtension(FileFullPath);
                if (U.ExtValid(FileExt))
                {
                    if (File.Exists(FileFullPath))
                    {

                        FileExt = FileExt.ToLower();
                        Image Img = Image.FromFile(FileFullPath);
                        ImageFormat format = ImageFormat.Jpeg;
                        switch (FileExt)
                        {
                            case ".gif":
                                format = ImageFormat.Gif;
                                break;
                            case ".jpg":
                                format = ImageFormat.Jpeg;
                                break;
                            case ".png":
                                format = ImageFormat.Png;
                                break;
                            default:
                                break;

                        }
                        response.ClearContent();
                        response.ContentType = "image/bmp";
                        Img.Save(response.OutputStream, format);
                        Img.Dispose();
                        response.Flush();
                    }
                    else
                    {
                        response.Write("file DO NOT Exists");
                    }
                }
                else
                {
                    response.Write("file DO NOT Allow");
                }
            }
            catch (Exception ex)
            {
                log.Warn(ex.Message);
                log.Warn("imgpath:{0},imgname:{1}", imgpath, imgname);
            }
        }
    }
}
