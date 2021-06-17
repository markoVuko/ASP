using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Domain
{
    public class UseCaseLog : Entity
    {
        public string Name { get; set; }
        public string Actor { get; set; }
        public string Data { get; set; }
    }
}
