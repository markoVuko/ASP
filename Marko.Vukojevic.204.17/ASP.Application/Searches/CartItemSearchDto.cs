using ASP.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.Searches
{
    public class CartItemSearchDto : PagedQuery
    {
        public string Username { get; set; }
        public string ProductName { get; set; }
        public int AmountFrom { get; set; }
        public int AmountTo { get; set; }
    }
}
