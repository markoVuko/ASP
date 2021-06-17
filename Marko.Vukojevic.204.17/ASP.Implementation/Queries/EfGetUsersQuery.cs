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
    public class EfGetUsersQuery : IGetUsersQuery
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;

        public EfGetUsersQuery(ProjekatContext con, IMapper mapper)
        {
            _con = con;
            _mapper = mapper;
        }
        public int Id => 20;

        public string Name => "Get Users Query";

        public PagedResponse<UserDto> Execute(UserSearchDto req)
        {
            var query = _con.Users.Include(x=>x.Role)
                .Where(x => x.IsDeleted == false)
                .AsQueryable();
            if (!string.IsNullOrEmpty(req.Username))
            {
                query = query.Where(x => x.Username.ToLower().Contains(req.Username.ToLower()));
            }
            if (!string.IsNullOrEmpty(req.FirstName))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(req.FirstName.ToLower()));
            }
            if (!string.IsNullOrEmpty(req.LastName))
            {
                query = query.Where(x => x.LastName.ToLower().Contains(req.LastName.ToLower()));
            }
            if (!string.IsNullOrEmpty(req.Email))
            {
                query = query.Where(x => x.Email.ToLower().Contains(req.Email.ToLower()));
            }
            if (!string.IsNullOrEmpty(req.Country))
            {
                query = query.Where(x => x.Country.ToLower().Contains(req.Country.ToLower()));
            }
            if (!string.IsNullOrEmpty(req.City))
            {
                query = query.Where(x => x.City.ToLower().Contains(req.City.ToLower()));
            }

            int offset = req.PerPage * (req.Page - 1);

            var res = new PagedResponse<UserDto>
            {
                PerPage = req.PerPage,
                TotalItems = query.Count(),
                CurrentPage = req.Page,
                Items = query.Skip(offset).Take(req.PerPage).Select(x => _mapper.Map<UserDto>(x)).ToList()
            };

            return res;
        }
    }
}
