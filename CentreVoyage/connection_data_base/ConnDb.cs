using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Permissions;
using System.Web;

namespace CentreVoyage.connection_data_base
{
    public class ConnDb
    {
        private static readonly string connectionString = @"Data Source=MOHAMED-AMINE1;Initial Catalog=VoyagesEmployes;Integrated Security=True";

        private static SqlConnection coonection=new SqlConnection(connectionString);

        public static SqlConnection getInstance() {
            if (coonection == null) {
                return new SqlConnection(connectionString);
            }
            return coonection;
        }
    }
}
