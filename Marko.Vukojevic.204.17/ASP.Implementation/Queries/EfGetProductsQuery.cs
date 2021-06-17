using ASP.Application.DTO;
using ASP.Application.Queries;
using ASP.Application.Searches;
using ASP.DataAccess;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Queries
{
    public class EfGetProductsQuery : IGetProductsQuery
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;

        public EfGetProductsQuery(ProjekatContext con, IMapper mapper)
        {
            _con = con;
            _mapper = mapper;
        }
        public int Id => 10;

        public string Name => "Get Products Query";

        public PagedResponse<ProductDto> Execute(ProductSearchDto req)
        {
            var query = _con.Products.Include(p => p.Category)
                .Include(p => p.Comments.Where(c => c.IsDeleted == false))
                .ThenInclude(p => p.User)
                .Where(p => p.IsDeleted == false)
                .AsQueryable();
            //query = query.Where(x => x.Comments.Any(x => x.IsDeleted == false));
            if (!string.IsNullOrEmpty(req.Name))
            {
                query = query.Where(p => p.Name.ToLower().Contains(req.Name.ToLower()));
            }
            if (!string.IsNullOrEmpty(req.Category))
            {
                query = query.Where(p => p.Category.Name.ToLower().Contains(req.Category.ToLower()));
            }
            if (req.PriceFrom > 0)
            {
                query = query.Where(p => p.Price >= req.PriceFrom);
            }
            if (req.PriceTo > 0)
            {
                query = query.Where(p => p.Price <= req.PriceTo);
            }

            var offset = req.PerPage * (req.Page - 1);

            var response = new PagedResponse<ProductDto>
            {
                CurrentPage = req.Page,
                PerPage = req.PerPage,
                TotalItems = query.Count(),
                Items = query.Skip(offset).Take(req.PerPage).Select(x => _mapper.Map<ProductDto>(x)).ToList()
            };

            return response;
        }
    }
}
