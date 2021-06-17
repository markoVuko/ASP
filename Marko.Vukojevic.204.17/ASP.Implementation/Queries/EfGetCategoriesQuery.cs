using ASP.Application.DTO;
using ASP.Application.Queries;
using ASP.Application.Searches;
using ASP.DataAccess;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Queries
{
    public class EfGetCategoriesQuery : IGetCategoriesQuery
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;
        
        public EfGetCategoriesQuery(ProjekatContext con, IMapper mapper)
        {
            _con = con;
            _mapper = mapper;
        }
        public int Id => 15;

        public string Name => "Get Categories Query";

        public PagedResponse<CategoryDto> Execute(CategorySearchDto req)
        {
            var query = _con.Categories.Where(x => x.IsDeleted == false).AsQueryable();
            if (!string.IsNullOrEmpty(req.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(req.Name.ToLower()));
            }

            var offset = req.PerPage * (req.Page - 1);

            var res = new PagedResponse<CategoryDto>
            {
                PerPage = req.PerPage,
                TotalItems = query.Count(),
                CurrentPage = req.Page,
                Items = query.Skip(offset).Take(req.PerPage).Select(x => _mapper.Map<CategoryDto>(x)).ToList()

            };

            return res;
        }
    }
}

//Items = query.Skip(offset).Take(req.PerPage).Select(x => new CategoryDto 
//                {
//                    Name=x.Name,
//                    Description=x.Description,
//                    Image=x.Image
//                }).ToList()
