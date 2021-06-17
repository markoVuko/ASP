using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Domain
{
    public class CartItem : Entity
    {
        public int Amount { get; set; }
        public virtual User User { get; set; }
        public int UserId { get; set; }
        public virtual Product Product { get; set; }
        public int ProductId { get; set; }
    }
}
