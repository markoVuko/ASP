using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Domain
{
    public class OrderProduct : Entity
    {
        public string Image { get; set; }
        public string Name { get; set; }
        public int Amount { get; set; }
        public int Price { get; set; }
        public virtual Product Product { get; set; }
        public int ProductId { get; set; }
        public virtual Order Order { get; set; }
        public int OrderId { get; set; }
    }
}
