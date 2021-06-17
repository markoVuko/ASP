using ASP.Application;
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
using System.Diagnostics;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Commands
{
    public class EfEditUserCommand : IEditUserCommand
    {
        private readonly ProjekatContext _con;
        private readonly IAppActor _actor;
        private readonly EditUserValidator _val;
        private readonly IMapper _mapper;

        public EfEditUserCommand(ProjekatContext con, EditUserValidator val, IMapper mapper, IAppActor actor)
        {
            _con = con;
            _val = val;
            _mapper = mapper;
            _actor = actor;
        }
        public int Id => 18;

        public string Name => "Edit User Command";

        public void Execute(UserDto req)
        {
            //throw new Exception(req.Id.ToString());
            if (_actor.Id == req.Id || _actor.UseCases.Contains(40))
            {
                _val.ValidateAndThrow(req);
                var user = _con.Users.Where(x => x.IsDeleted == false && x.Id == req.Id).First();
                if (user == null)
                {
                    throw new InvalidEntityException(req.Id, typeof(User));
                }
                if (!string.IsNullOrWhiteSpace(req.FirstName))
                {
                    user.FirstName = req.FirstName;
                }
                if (!string.IsNullOrWhiteSpace(req.LastName))
                {
                    user.LastName = req.LastName;
                }
                if (!string.IsNullOrWhiteSpace(req.Username))
                {
                    user.Username = req.Username;
                }
                if (!string.IsNullOrWhiteSpace(req.Email))
                {
                    user.Email = req.Email;
                }
                if (!string.IsNullOrWhiteSpace(req.Country))
                {
                    user.Country = req.Country;
                }
                if (!string.IsNullOrWhiteSpace(req.City))
                {
                    user.City = req.City;
                }
                if (!string.IsNullOrWhiteSpace(req.Address))
                {
                    user.Address = req.Address;
                }
                user.ModifiedAt = DateTime.UtcNow;
                _con.SaveChanges();

            } else
            {
                throw new UnauthorizedAccessException();
            }
        }
    }
}
