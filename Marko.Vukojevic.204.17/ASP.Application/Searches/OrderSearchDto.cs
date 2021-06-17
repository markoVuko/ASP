using ASP.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.Searches
{
    public class OrderSearchDto : PagedQuery
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public string Username { get; set; }
        public string ProductName { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
    }
}
