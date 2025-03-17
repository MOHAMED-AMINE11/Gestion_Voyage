using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CentreVoyage.model
{
    public class Employe
    {
        public int CodeEmp { get; set; }
        public string Nom { get; set; }
        public string Fonction { get; set; }
        public string Username { get; set; }
        public string Pwd { get; set; }

       
        public ICollection<Inscription> Inscriptions { get; set; } = new List<Inscription>();
    }
}