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
    public partial class DetailsInscription : System.Web.UI.Page
    {
        private SqlConnection conn = ConnDb.getInstance();
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["codeInsc"] != null)
            {
                int codeInsc = Convert.ToInt32(Request.QueryString["codeInsc"]);

                // Charger les détails de l'inscription
                LoadInscriptionDetails(1);
               
            }
        }

        private void LoadInscriptionDetails(int codeInsc)
        {
            using (SqlConnection connection = ConnDb.getInstance())
            {
                try
                {
                    string query = @"SELECT * FROM Inscription WHERE codeInsc = @codeInsc";
                
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@codeInsc", codeInsc);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();
              
                        LabelDetails.Text = $"Code Inscription: {reader["codeInsc"]}<br/>" +
                                            $"Code Employé: {reader["codeEmp"]}<br/>" +
                                            $"Code Voyage: {reader["codeVoyage"]}<br/>" +
                                            $"Nombre de Personnes: {reader["nbrePers"]}<br/>" +
                                            $"Date du Voyage: {reader["dateVoy"]}";
                        conn.Close();
                    }
                    else
                    {
                        LabelDetails.Text = "Aucun détail trouvé pour cette inscription.";
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    LabelDetails.Text = "Erreur: " + ex.Message;
                    conn.Close();
                }
            }
        }
    }
}