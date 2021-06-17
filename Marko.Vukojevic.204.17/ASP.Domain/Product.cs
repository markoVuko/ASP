using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Domain
{
    public class Product : Entity
    {
        public string Name { get; set; }
        public int Price { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public virtual Category Category { get; set; }
        public int CategoryId { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<OrderProduct> OrderProducts { get; set; }
        public virtual ICollection<CartItem> CartItems { get; set; }
    }
}
