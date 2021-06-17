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
    public class EfCreateCartItemCommand : ICreateCartItemCommand
    {
        public int Id => 41;

        public string Name => "Create Cart Item Command";

        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;
        private readonly CreateCartItemValidator _val;
        private readonly IAppActor _actor;

        public EfCreateCartItemCommand(ProjekatContext con, IMapper mapper, CreateCartItemValidator val, IAppActor actor)
        {
            _con = con;
            _mapper = mapper;
            _val = val;
            _actor = actor;
        }

        public void Execute(CartItemDto req)
        {
            _val.ValidateAndThrow(req);

            var c = _con.CartItems.Where(x => x.UserId == _actor.Id && x.ProductId == req.ProductId && x.IsDeleted == false).FirstOrDefault();
            if (c == null)
            {
                var ci = _mapper.Map<CartItem>(req);

                ci.UserId = _actor.Id;
                ci.CreatedAt = DateTime.UtcNow;
                ci.IsActive = true;
                ci.IsDeleted = false;

                if (ci == null)
                {
                    throw new InvalidEntityException(req.Id, typeof(CartItem));
                }

                _con.CartItems.Add(ci);
                _con.SaveChanges();
            } else
            {
                c.Amount++;
                c.ModifiedAt = DateTime.UtcNow;
                _con.SaveChanges();
            }
            
        }
    }
}
