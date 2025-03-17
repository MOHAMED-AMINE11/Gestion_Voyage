using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CentreVoyage.model
{
    public class Voyage
    {
        public int CodeVoyage { get; set; }

        // Clé étrangère vers Transport
        public int CodeTrans { get; set; }
        public Transport Transport { get; set; }

        // Clé étrangère vers DescriptionVoyage
        public int CodeDesc { get; set; }
        public DescriptionVoyage DescriptionVoyage { get; set; }

        public decimal PrixTicket { get; set; }
        public TimeSpan HeureDepart { get; set; }

        // Relation : Un voyage peut avoir plusieurs inscriptions
        public ICollection<Inscription> Inscriptions { get; set; } = new List<Inscription>();
    }
}