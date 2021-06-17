using ASP.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.Searches
{
    public class ProductSearchDto : PagedQuery
    {
        public string Name { get; set; }
        public string Category { get; set; }
        public int PriceFrom { get; set; }
        public int PriceTo { get; set; }
    }
}
