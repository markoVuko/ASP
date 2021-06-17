using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Domain
{
    public class Order : Entity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public virtual User User { get; set; }
        public int UserId { get; set; }
        public virtual ICollection<OrderProduct> OrderProducts { get; set; }
    }
}
