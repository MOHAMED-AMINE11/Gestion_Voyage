using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CentreVoyage.connection_data_base;
using CentreVoyage.model;

namespace CentreVoyage.view
{
    public partial class Inscrire : System.Web.UI.Page
    {
        SqlConnection connection = ConnDb.getInstance();
        private void createNewVoyage(Inscription inscription)
        {

            string query = @"INSERT INTO Inscription (codeEmp, codeVoyage, nbrePers, dateVoy)
                         VALUES (@codeEmp, @codeVoyage, @nbrePers, @dateVoy)";

            try
            {

                connection.Open();


                using (SqlCommand cmd = new SqlCommand(query, connection))
                {

                    cmd.Parameters.AddWithValue("@codeEmp", inscription.CodeEmp);
                    cmd.Parameters.AddWithValue("@codeVoyage", inscription.CodeVoyage);
                    cmd.Parameters.AddWithValue("@nbrePers", inscription.NbrePers);
                    cmd.Parameters.AddWithValue("@dateVoy", inscription.DateVoy);


                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Console.WriteLine("Inscription ajoutée avec succès.");
                    }
                    else
                    {
                        Console.WriteLine("Aucune ligne insérée.");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Erreur lors de l'insertion : " + ex.Message);
            }
            finally
            {

                connection.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string villeDepart = SelectVilleDepart.Value;
            string villeArrive = SelectVilleArrivee.Value; // Utilisez la bonne variable ici
            DateTime date = DateTime.Parse(TextBox3.Text);
            int codeVoyage = 0;  // Initialisation à zéro au cas où la requête ne retourne rien
            int nbr = Int32.Parse(TextBox4.Text);

            // Requête SQL avec un espace manquant après 'v'
            string query = @"SELECT * 
                     FROM Voyage v
                     INNER JOIN DescriptionVoyage Des 
                     ON v.codeDesc = Des.codeDesc 
                     WHERE Des.villeD = @villeD AND Des.villeA = @villeA"; // Ajout de la condition pour la ville d'arrivée si nécessaire

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Ajout des paramètres de la requête SQL
                command.Parameters.AddWithValue("@villeD", villeDepart);
                command.Parameters.AddWithValue("@villeA", villeArrive);  // Si vous avez besoin de la ville d'arrivée

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    // Vérifiez si des données ont été trouvées
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            // Récupérer le codeVoyage
                            codeVoyage = Convert.ToInt32(reader["codeVoyage"]);
                        }
                    }
                    else
                    {
                        // Aucun voyage trouvé
                        Response.Write("Aucun voyage trouvé.");
                    }
                }
                catch (Exception ex)
                {
                    // Gérer les exceptions ici (par exemple, erreur de connexion ou de requête)
                    Response.Write("Erreur : " + ex.Message);
                }
                finally
                {
                    
                    connection.Close();
                }
            }

            if (codeVoyage > 0)
            {
                
                createNewVoyage(new Inscription(Convert.ToInt32(Session["id"]), codeVoyage, nbr, date));
            }
            else
            {
                Response.Write("Code de voyage invalide.");
            }

        }
    }
}
