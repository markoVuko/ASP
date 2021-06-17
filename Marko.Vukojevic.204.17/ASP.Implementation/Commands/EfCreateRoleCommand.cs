using ASP.Application.Commands;
using ASP.Application.DTO;
using ASP.DataAccess;
using ASP.Domain;
using ASP.Implementation.Validators;
using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Implementation.Commands
{
    public class EfCreateRoleCommand : ICreateRoleCommand
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;
        private readonly CreateRoleValidator _val;
        public EfCreateRoleCommand(ProjekatContext con, IMapper mapper, CreateRoleValidator val)
        {
            _con = con;
            _val = val;
            _mapper = mapper;
        }
        public int Id => 1;

        public string Name => "Create Role Command";

        public void Execute(RoleDto req)
        {
            _val.ValidateAndThrow(req);

            Role role = _mapper.Map<Role>(req);
            role.CreatedAt = DateTime.UtcNow;
            role.IsActive = true;
            role.IsDeleted = false;
            _con.Roles.Add(role);
            _con.SaveChanges();
        }
    }
}
