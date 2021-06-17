using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.DTO
{
    public class ProductDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Price { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public IFormFile FormImage { get; set; }
        public string Category { get; set; }
        public int CategoryId { get; set; }
        //public IEnumerable<CommentDto> Comments { get; set; } = new List<CommentDto>();
        //ili
        public ICollection<CommentDto> Comments { get; set; }
    }
}
