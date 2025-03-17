using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CentreVoyage.model
{
    public class Transport
    {
        public int CodeTrans { get; set; }
        public string Type { get; set; }
        public decimal Vitesse { get; set; }
        public int NbrePlace { get; set; }
    }
}