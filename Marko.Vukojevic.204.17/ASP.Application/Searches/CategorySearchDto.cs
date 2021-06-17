using ASP.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.Searches
{
    public class CategorySearchDto : PagedQuery
    {
        public string Name { get; set; }
    }
}
