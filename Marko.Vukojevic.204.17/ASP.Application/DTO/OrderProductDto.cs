using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.DTO
{
    public class OrderProductDto
    {
        public int Id { get; set; }
        public string Image { get; set; }
        public string Name { get; set; }
        public int Amount { get; set; }
        public int Price { get; set; }
        public int ProductId { get; set; }
        public int OrderId { get; set; }
    }
}
