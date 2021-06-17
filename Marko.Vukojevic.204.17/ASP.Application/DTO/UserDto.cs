using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.DTO
{
    public class UserDto
    {
        public int Id { get; set; }
        public DateTime RegisteredAt { get; set; }
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public string Role { get; set; }
        public int RoleId { get; set; }
    }
}
