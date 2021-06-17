using ASP.Application.DTO;
using ASP.Application.Exceptions;
using ASP.Application.Queries;
using ASP.DataAccess;
using ASP.Domain;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Queries
{
    public class EfGetProductQuery : IGetProductQuery
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;

        public EfGetProductQuery(ProjekatContext con, IMapper mapper)
        {
            _con = con;
            _mapper = mapper;
        }
        public int Id => 9;

        public string Name => "Get Product Query";

        public ProductDto Execute(int id)
        {
            var prod = _con.Products.Include(p=>p.Category).Include(p=>p.Comments.Where(c => c.IsDeleted == false))
                .Where(p => p.Id == id && p.IsDeleted == false)
                .FirstOrDefault();
            if(prod==null)
            {
                throw new InvalidEntityException(id, typeof(Product));
            }

            var res = _mapper.Map<ProductDto>(prod);
            return res;
        }
    }
}
