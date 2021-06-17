using ASP.Application.Commands;
using ASP.Application.DTO;
using ASP.Application.Exceptions;
using ASP.DataAccess;
using ASP.Domain;
using ASP.Implementation.Validators;
using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Commands
{
    public class EfEditRoleCommand : IEditRoleCommand
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;
        private readonly CreateRoleValidator _val;
        
        public EfEditRoleCommand(ProjekatContext con, IMapper mapper, CreateRoleValidator val)
        {
            _con = con;
            _val = val;
            _mapper = mapper;
        }
        public int Id => 3;

        public string Name => "Edit Role Command";

        public void Execute(RoleDto req)
        {
            _val.ValidateAndThrow(req);
            var role = _con.Roles.Where(x => x.IsDeleted == false && x.Id == req.Id).First();
            if (role == null)
            {
                throw new InvalidEntityException(req.Id, typeof(Role));
            }

            _con.Entry(role).CurrentValues.SetValues(_mapper.Map<Role>(req));
            role.ModifiedAt = DateTime.UtcNow;
            _con.SaveChanges();
        }
    }
}
