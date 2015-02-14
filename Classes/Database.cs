using System;
using System.Configuration;
using System.Web.Configuration;

public class Database
{
    static public String ConnectionString
    {
        get
        {    // get connection string with name  database from  web.config.
            return WebConfigurationManager.ConnectionStrings["BDLabsConnectionString"].ConnectionString;
        }
    }
}
