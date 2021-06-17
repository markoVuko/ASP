using ASP.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.Searches
{
    public class UserSearchDto : PagedQuery
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Role { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
    }
}
