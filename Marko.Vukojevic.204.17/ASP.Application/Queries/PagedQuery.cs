using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.Queries
{
    public abstract class PagedQuery
    {
        public int PerPage { get; set; } = 10;
        public int Page { get; set; } = 1;
    }
}
