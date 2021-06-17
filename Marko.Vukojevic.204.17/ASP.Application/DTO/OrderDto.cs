using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.DTO
{
    public class OrderDto
    {
        public int Id { get; set; }
        public DateTime DateOfOrder { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        //public UserDto User { get; set; }
        public int UserId { get; set; }
        public virtual ICollection<OrderProductDto> OrderProducts { get; set; }
    }
}
