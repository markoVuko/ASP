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
    public class EfGetRolesQuery : IGetRolesQuery
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;

        public EfGetRolesQuery(ProjekatContext con, IMapper mapper)
        {
            _mapper = mapper;
            _con = con;
        }
        public int Id => 5;

        public string Name => "Get Roles Query";

        public PagedResponse<RoleDto> Execute(RoleSearchDto req)
        {
            var query = _con.Roles.Where(x => x.IsDeleted == false).AsQueryable();

            if (!string.IsNullOrWhiteSpace(req.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(req.Name.ToLower()));
            }

            var offset = req.PerPage * (req.Page - 1);

            return new PagedResponse<RoleDto>
            {
                CurrentPage = req.Page,
                PerPage = req.PerPage,
                TotalItems = query.Count(),
                Items = query.Skip(offset).Take(req.PerPage).Select(x=>_mapper.Map<RoleDto>(x)).ToList()
            };
        }
    }
}
