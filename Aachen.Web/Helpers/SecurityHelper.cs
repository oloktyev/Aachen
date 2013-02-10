using System;
using System.Security.Cryptography;
using System.Text;

namespace Aachen.Web.Helpers
{
    public class SecurityHelper
    {
        public static string Encrypt(string valueToEncrypt, string salt)
        {
            byte[] saltBytes = Encoding.UTF8.GetBytes(salt);
            byte[] passBytes = Encoding.UTF8.GetBytes(valueToEncrypt);
            byte[] combinedBytes = new byte[passBytes.Length + saltBytes.Length];
            System.Buffer.BlockCopy(passBytes, 0, combinedBytes, 0, passBytes.Length);
            System.Buffer.BlockCopy(saltBytes, 0, combinedBytes, passBytes.Length, saltBytes.Length);

            HashAlgorithm hashAlgo = new SHA512Managed();
            string hash = Convert.ToBase64String(hashAlgo.ComputeHash(combinedBytes));
            return hash;
        }
    }
}