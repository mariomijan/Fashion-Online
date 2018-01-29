using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UserLogin; // Vigtig for kontakt til User.cs
using Svendeproeve.Models;

/// <summary>
/// Summary description for CurrentUser
/// </summary>
public class CurrentUser
{
    // Fortæller om brugeren er logget ind
    public static bool IsLoggedIn()
    {
        return UserLogin.User.IsLoggedIn();
    }

    // Fortæller om brugeren er i en specifik rolle
    public static bool IsInRole(UserLogin.Role role)
    {
        return UserLogin.User.IsInRole(role);
    }

    // Logger brugerne ud
    public static void LogOff()
    {
        UserLogin.User.LogOff();
    }

    // Henter alt information om brugeren
    public static Userlogin GetUser()
    {
        return UserLogin.User.SessionGet();
    }
}