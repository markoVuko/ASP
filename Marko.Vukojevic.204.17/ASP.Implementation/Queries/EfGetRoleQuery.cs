using ASP.Application.DTO;
using ASP.Application.Exceptions;
using ASP.Application.Queries;
using ASP.DataAccess;
using ASP.Domain;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Queries
{
    public class EfGetRoleQuery : IGetRoleQuery
    {
        public readonly ProjekatContext _con;
        public readonly IMapper _mapper;

        public EfGetRoleQuery(ProjekatContext con, IMapper mapper)
        {
            _mapper = mapper;
            _con = con;
        }
        public int Id => 4;

        public string Name => "Get Role Query";

        public RoleDto Execute(int id)
        {
            var role = _con.Roles.Where(r => r.Id == id && r.IsDeleted == false).FirstOrDefault();
            if(role == null)
            {
                throw new InvalidEntityException(id, typeof(Role));
            }

            return _mapper.Map<RoleDto>(role);
        }
    }
}
