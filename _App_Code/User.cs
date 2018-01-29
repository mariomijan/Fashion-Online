using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography; // MD5
using System.Text;
using System.Web;
using System.Configuration;
using System.Web.Security;
using Svendeproeve.Models; // Lav adgang til Web.Config

/// <summary>
/// Summary description for User
/// </summary>
/// 

namespace UserLogin
{
    // Login status svar
    public enum LoginStatus
    {
        Error = 0,
        OK = 1,
        WrongPass = 2,
        NotFound = 3
    }

    // Opret bruger status svar
    public enum CreateStatus
    {
        Error = 0,
        OK = 1,
        UserNameExist = 2
    }

    // Bruger status svar
    public enum UserStatus
    {
        Inactive = 0,
        Active = 1,
    }

    // Roller
    public enum Role
    {
        Admin = 1,
        User = 2,
    }

    public class User
    {
        public static LoginStatus Login(string loginName, string loginPass)
        {
            // Hvis denne setting er = true, hashes passwordet med MD5
            if (ConfigurationManager.AppSettings["SimpleLogin_EnableMD5"] != null && ConfigurationManager.AppSettings["SimpleLogin_EnableMD5"] == "true")
                loginPass = Generate_MD5Hash(loginPass);

            // Åbner forbindelse til databasen
            using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
            {
                Userlogin GetUser = db.Userlogin.FirstOrDefault(i => i.LoginName == loginName && i.Password == loginPass);
                if (GetUser != null)
                {
                    // Indsætter brugerne i en session & cookie
                    SessionSet(GetUser);
                    AuthCookie(GetUser);

                    // OK
                    return LoginStatus.OK;
                }
                else
                {
                    GetUser = db.Userlogin.FirstOrDefault(i => i.LoginName == loginName);
                    if (GetUser != null)
                    {
                        // LoginPass er forkert
                        return LoginStatus.WrongPass;
                    }
                    else
                    {
                        // LoginName findes ikke
                        return LoginStatus.NotFound;
                    }
                }
            }
        }
        public static void LogOff()
        {
            // Dræber sessions
            HttpContext.Current.Session["UserModel"] = null;
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Session.RemoveAll();

            FormsAuthentication.SignOut(); // Spiser kagen!

            // Sender brugeren til login siden
            HttpContext.Current.Response.Redirect(FormsAuthentication.LoginUrl);
        }

        // Information om brugerne
        public static List<Userlogin> GetAll()
        {
            using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
            {
                return db.Userlogin.ToList();
            }
        }
        public static List<Userlogin> GetByRole(Role role)
        {
            using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
            {
                return db.Userlogin.Where(i => i.RoleID == (int)role).ToList();
            }
        }
        public static Userlogin GetByID(int userID)
        {
            using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
            {
                return db.Userlogin.FirstOrDefault(i => i.UserID == userID);
            }
        }

        // Tilføj - Ret - Slet
        public static CreateStatus Insert(Userlogin model)
        {
            using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
            {
                // Tjek om brugernavn allerede findes
                if (!db.Userlogin.ToList().Exists(i => i.LoginName.ToLower() == model.LoginName.ToLower()))
                {
                    // Hvis denne setting er = true, hashes passwordet med MD5
                    if (ConfigurationManager.AppSettings["SimpleLogin_EnableMD5"] != null && ConfigurationManager.AppSettings["SimpleLogin_EnableMD5"] == "true")
                        model.Password = Generate_MD5Hash(model.Password);

                    //model.RoleID = model.RoleID;
                    model.RoleID = (int)Role.User;
                    model.Status = (int)UserStatus.Active; // Sætter status = Aktiv

                    db.Userlogin.Add(model);
                    db.SaveChanges();

                    return CreateStatus.OK; // Brugeren er oprettet !
                }
                else
                    return CreateStatus.UserNameExist; // Brugernavnet findes allerede !
            }
        }
        public static void Update(Userlogin model)
        {
            using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
            {
                Userlogin Item = db.Userlogin.Find(model.UserID);

                // Hvis denne setting er = true, hashes passwordet med MD5
                if (ConfigurationManager.AppSettings["SimpleLogin_EnableMD5"] != null && ConfigurationManager.AppSettings["SimpleLogin_EnableMD5"] == "true")
                    Item.Password = Generate_MD5Hash(model.Password);

                //Item.LoginName = model.LoginName;
                Item.Username = model.Username;

                db.SaveChanges();
            }
        }
        public static void Delete(int userID)
        {
            using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
            {
                Userlogin Item = db.Userlogin.Find(userID);
                db.Userlogin.Remove(Item);
                db.SaveChanges();
            }
        }


        private static void AuthCookie(Userlogin getUser)
        {
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, getUser.UserID.ToString(), DateTime.Now, DateTime.Now.AddDays(10), true, getUser.UserID.ToString(), FormsAuthentication.FormsCookiePath);

            string EncryptTicket = FormsAuthentication.Encrypt(ticket);

            HttpCookie newCookie = new HttpCookie(FormsAuthentication.FormsCookieName, EncryptTicket);
            if (ticket.IsPersistent)
            {
                newCookie.Expires = ticket.Expiration;
            }

            System.Web.HttpContext.Current.Response.Cookies.Add(newCookie);
        }

        public static bool IsInRole(int userID, Role role)
        {
            using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
            {
                return db.Userlogin.ToList().Exists(i => i.UserID == userID && i.RoleID == (int)role);
            }
        }
        public static bool IsInRole(Role role)
        {
            using (Sv_Eksamen_Entities db = new Sv_Eksamen_Entities())
            {
                if (IsLoggedIn())
                {
                    return db.Userlogin.ToList().Exists(i => i.UserID == SessionGet().UserID && i.RoleID == (int)role);
                }
            }

            return false;
        }
        public static bool IsLoggedIn()
        {
            if (SessionGet() != null)
            {
                Userlogin GetUser = (Userlogin)SessionGet();
                if (GetUser != null)
                {
                    return true;
                }
            }

            // Sender brugeren til login siden
            HttpContext.Current.Response.Redirect(FormsAuthentication.LoginUrl);

            return false;
        }

        public static void SessionSet(Userlogin model)
        {
            HttpContext.Current.Session["UserModel"] = model;
        }
        public static Userlogin SessionGet()
        {
            if (HttpContext.Current.Session["UserModel"] != null)
                return (Userlogin)HttpContext.Current.Session["UserModel"];
            else
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    // Retrieves the cookie that contains your custom FormsAuthenticationTicket.
                    HttpCookie authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];

                    // Decrypts the FormsAuthenticationTicket that is held in the cookie's .Value property.
                    FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie.Value);

                    // Henter brugeren fra cookie, og indsætter i session
                    Userlogin GetUser = GetByID(Convert.ToInt32(authTicket.UserData));
                    SessionSet(GetUser);

                    return GetUser;
                }
            }

            return null;
        }

        // MD5 Hashing
        private static string Generate_MD5Hash(string input)
        {
            // step 1, calculate MD5 hash from input
            MD5 md5 = System.Security.Cryptography.MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hash = md5.ComputeHash(inputBytes);

            // step 2, convert byte array to hex string
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));
            }
            return sb.ToString();
        }
    }
}