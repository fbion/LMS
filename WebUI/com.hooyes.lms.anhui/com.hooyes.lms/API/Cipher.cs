using System;
using System.Text;

namespace com.hooyes.lms.API
{
    public class Cipher
    {
        public static string Encrypt(string str)
        {
            var b = Encoding.UTF8.GetBytes(str);
            string result = Convert.ToBase64String(b);
            return result;
        }
        public static string Decrypt(string str)
        {
            var b = Convert.FromBase64String(str);
            string result = Encoding.UTF8.GetString(b);
            return result;
        }
    }
}
