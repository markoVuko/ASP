using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Domain
{
    public class Category : Entity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
