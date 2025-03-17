using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CentreVoyage.connection_data_base;

namespace CentreVoyage.view
{
    public partial class ConnectionFrom : System.Web.UI.Page
    {
        SqlConnection connection=ConnDb.getInstance();
        private  bool connectionUser(string email, string password) {
            string query = @"select * from Employe where (username = @email and pwd=@password)";

            using (SqlCommand commd=new SqlCommand(query,connection)) {
                connection.Open();
                commd.Parameters.AddWithValue("@email", email);
                commd.Parameters.AddWithValue("@password", password);
                var rd=commd.ExecuteReader();
               
                if (rd.HasRows)
                {
                    // Lecture de la première ligne
                    rd.Read();

                    // Assurez-vous que la première colonne (index 0) contient bien un identifiant
                    Session["id"] = rd[0].ToString(); // Récupère la valeur de la première colonne
                    connection.Close();
                    return true;
                  
                }

            }
            connection.Close();
            return true;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        

       


        
        protected void Button1_Click2(object sender, EventArgs e)
        {
            if (connectionUser(TextBox1.Text, TextBox2.Text)) { 
                 Response.Redirect("BasePage.aspx");
                
            }
           
        }
    }
    }
