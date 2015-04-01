using System.Web;


namespace com.hooyes.lms
{
    /// <summary>
    /// 存储方法
    /// </summary>
    public class MemCache
    {
        private static string prefix = "hooyes";

        public static void Save(string key, object value)
        {
            HttpContext.Current.Session[prefix + key] = value;
        }

        public static object Get(string key)
        {
            return HttpContext.Current.Session[prefix + key];
        }
        public static T Get<T>(string key)
        {
            if (HttpContext.Current.Session[prefix + key] != null)
            {
                return (T)HttpContext.Current.Session[prefix + key];
            }
            else
            {
                return default(T);
            }
        }
        public static void remove(string key)
        {
            HttpContext.Current.Session.Remove(prefix + key);
        }

        public static void clear()
        {
            HttpContext.Current.Session.RemoveAll();
        }
    }
}
