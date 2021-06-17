using ASP.Application;
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
    public class EfGetCartItemsQuery : IGetCartItemsQuery
    {
        public int Id => 45;

        public string Name => "Get Cart Items Query";

        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;
        private readonly IAppActor _actor;

        public EfGetCartItemsQuery(ProjekatContext con, IMapper mapper, IAppActor actor)
        {
            _con = con;
            _mapper = mapper;
            _actor = actor;
        }

        public PagedResponse<CartItemDto> Execute(CartItemSearchDto req)
        {
            var query = _con.CartItems.Where(x => x.IsDeleted == false)
                .Include(x => x.Product)
                .ThenInclude(x=>x.Comments.Where(c => c.IsDeleted == false))
                .Include(x=>x.Product)
                .ThenInclude(x => x.Category)
                .Include(x => x.User).AsQueryable();
            if (!_actor.UseCases.Contains(40))
            {
                query = query.Where(x => x.UserId == _actor.Id);
            }

            if (!string.IsNullOrWhiteSpace(req.ProductName))
            {
                query = query.Where(x => x.Product.Name.ToLower().Contains(req.ProductName.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(req.Username))
            {
                query = query.Where(x => x.User.Username.ToLower().Contains(req.Username.ToLower()));
            }
            if (req.AmountFrom > 0)
            {
                query = query.Where(x => x.Amount >= req.AmountFrom);
            }
            if (req.AmountTo > 0)
            {
                query = query.Where(x => x.Amount <= req.AmountTo);
            }

            var offset = req.PerPage * (req.Page - 1);

            return new PagedResponse<CartItemDto>
            {
                CurrentPage = req.Page,
                PerPage = req.PerPage,
                TotalItems = query.Count(),
                Items = query.Skip(offset).Take(req.PerPage).Select(x => _mapper.Map<CartItemDto>(x)).ToList()
            };
        }
    }
}
