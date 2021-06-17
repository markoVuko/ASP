using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.DTO
{
    public class UseCaseLogDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Actor { get; set; }
        public string Data { get; set; }
        public DateTime DateOfLog { get; set; }
    }
}
