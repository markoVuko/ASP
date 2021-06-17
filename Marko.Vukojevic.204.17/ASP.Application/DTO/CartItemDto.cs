using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.DTO
{
    public class CartItemDto
    {
        public int Id { get; set; }
        public int Amount { get; set; }
        public string Username { get; set; }
        public ProductDto Product { get; set; }
        public int ProductId { get; set; }
        public int UserId { get; set; }
    }
}
