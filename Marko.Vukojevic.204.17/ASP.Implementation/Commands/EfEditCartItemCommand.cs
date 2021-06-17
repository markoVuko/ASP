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
using System.Linq;
using System.Text;

namespace ASP.Implementation.Commands
{
    public class EfEditCartItemCommand : IEditCartItemCommand
    {
        public int Id => 43;

        public string Name => "Edit Cart Item Command";

        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;
        private readonly CreateCartItemValidator _val;
        private readonly IAppActor _actor;

        public EfEditCartItemCommand(ProjekatContext con, IMapper mapper, CreateCartItemValidator val, IAppActor actor)
        {
            _con = con;
            _mapper = mapper;
            _val = val;
            _actor = actor;
        }

        public void Execute(CartItemDto req)
        {
            _val.ValidateAndThrow(req);
            var ci = _con.CartItems.Where(x => x.IsDeleted == false && x.Id == req.Id).FirstOrDefault();
            if (ci == null)
            {
                throw new InvalidEntityException(req.Id, typeof(CartItem));
            }
            if (!_actor.UseCases.Contains(40))
            {
                if (ci.UserId != _actor.Id)
                {
                    throw new UnauthorizedAccessException();
                }
            }
            if (req.Amount > 0)
            {
                ci.Amount = req.Amount;
            }

            ci.ModifiedAt = DateTime.UtcNow;

            _con.SaveChanges();
        }
    }
}
