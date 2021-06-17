using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.DTO
{
    public class CommentDto
    {
        public int Id { get; set; }
        public string Content { get; set; }
        public string Username { get; set; }
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public DateTime PostedAt { get; set; }
        public DateTime? ModifiedAt { get; set; } = null;
    }
}
