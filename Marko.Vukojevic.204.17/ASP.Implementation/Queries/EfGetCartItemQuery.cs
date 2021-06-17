using ASP.Application;
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
    public class EfGetCartItemQuery : IGetCartItemQuery
    {
        public int Id => 44;

        public string Name => "Get Cart Item Query";

        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;
        private readonly IAppActor _actor;

        public EfGetCartItemQuery(ProjekatContext con, IMapper mapper, IAppActor actor)
        {
            _con = con;
            _mapper = mapper;
            _actor = actor;
        }

        public CartItemDto Execute(int id)
        {
            var ci = _con.CartItems
                .Include(x => x.Product)
                .ThenInclude(x => x.Comments.Where(c => c.IsDeleted == false))
                .Include(x => x.Product)
                .ThenInclude(x => x.Category)
                .Include(x => x.User)
                .Where(x => x.Id == id && x.IsDeleted == false)
                .FirstOrDefault();
            if (_actor.UseCases.Contains(40) || ci.UserId == _actor.Id)
            {
                if (ci == null)
                {
                    throw new InvalidEntityException(id, typeof(CartItem));
                }

                return _mapper.Map<CartItemDto>(ci);
            } else
            {
                throw new UnauthorizedAccessException();
            }

            
        }
    }
}
