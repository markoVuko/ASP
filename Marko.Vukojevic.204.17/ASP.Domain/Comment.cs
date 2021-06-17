using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Domain
{
    public class Comment : Entity
    {
        public string Content { get; set; }
        public virtual User User { get; set; }
        public int UserId { get; set; }
        public virtual Product Product { get; set; }
        public int ProductId { get; set; }
    }
}
