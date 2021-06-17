using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Domain
{
    public class User : Entity
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public virtual Role Role { get; set; }
        public int RoleId { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<UserUseCase> UserUseCases { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<CartItem> CartItems { get; set; }
    }
}
