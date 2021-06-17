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
    public class EfGetUserQuery : IGetUserQuery
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;

        public EfGetUserQuery(ProjekatContext con, IMapper mapper)
        {
            _con = con;
            _mapper = mapper;
        }
        public int Id => 19;

        public string Name => "Get User Query";

        public UserDto Execute(int id)
        {
            var user = _con.Users.Include(x=>x.Role)
                .Where(x => x.Id == id && x.IsDeleted == false).FirstOrDefault();
            if (user == null)
            {
                throw new InvalidEntityException(id, typeof(User));
            }

            return _mapper.Map<UserDto>(user);
        }
    }
}
