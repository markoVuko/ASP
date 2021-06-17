using ASP.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.Searches
{
    public class CommentSearchDto : PagedQuery
    {
        public string Content { get; set; }
        public string Username { get; set; }
    }
}
