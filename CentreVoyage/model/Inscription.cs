using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CentreVoyage.model
{
    public class Inscription
    {
       

        public Inscription(int v1, int v2, int nbr, DateTime date)
        {
            this.CodeEmp = v1;
            this.CodeVoyage = v2;
            this.NbrePers = nbr;
            this.DateVoy = date;
        }

        public int CodeInsc { get; set; }

        // Clé étrangère vers Employe
        public int CodeEmp { get; set; }
        public Employe Employe { get; set; }

        // Clé étrangère vers Voyage
        public int CodeVoyage { get; set; }
        public Voyage Voyage { get; set; }

        public int NbrePers { get; set; }
        public DateTime DateVoy { get; set; }
    }
}