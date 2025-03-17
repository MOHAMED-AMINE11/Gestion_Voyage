using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using CentreVoyage.connection_data_base;

namespace CentreVoyage.view
{
    public partial class ListIndcri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Vérifier si l'utilisateur est connecté
                if (Session["id"] == null)
                {
                    Response.Redirect("ConnectionFrom.aspx");
                    return;
                }

                // Charger les données
                LoadInscriptions();
            }
        }

        private void LoadInscriptions()
        {
            try
            {
                
                using (SqlConnection conn =ConnDb.getInstance())
                {
                    conn.Open();
                    string query = "SELECT codeInsc, codeEmp, codeVoyage, nbrePers, dateVoy FROM Inscription WHERE codeEmp = @codeEmp";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@codeEmp", Session["id"]);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dtInscriptions = new DataTable();
                    adapter.Fill(dtInscriptions);

                    GridViewInscriptions.DataSource = dtInscriptions;
                    GridViewInscriptions.DataBind();

                }
            }
            catch (Exception ex)
            {
                // Gérer l'erreur (par exemple, afficher un message à l'utilisateur)
                Response.Write("Une erreur s'est produite lors du chargement des données: " + ex.Message);
            }
        }

        protected void GridViewInscriptions_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Ajouter la classe CSS pour les lignes cliquables
                e.Row.CssClass = "clickable-row";

                // Ajouter l'attribut onclick pour la redirection
                string codeInsc = DataBinder.Eval(e.Row.DataItem, "codeInsc").ToString();
                e.Row.Attributes["onclick"] = "redirectToDetails('" + codeInsc + "');";
            }
        }

        protected void LinkButtonDetails_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                string codeInsc = e.CommandArgument.ToString();
                Response.Redirect("DetailsInscription.aspx?id=" + codeInsc);

            }
        }

    
    }
}