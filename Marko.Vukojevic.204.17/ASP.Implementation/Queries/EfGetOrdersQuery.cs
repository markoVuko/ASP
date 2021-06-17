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
    public class EfGetOrdersQuery : IGetOrdersQuery
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;
        private readonly IAppActor _actor;
        public EfGetOrdersQuery(ProjekatContext con, IMapper mapper, IAppActor actor)
        {
            _con = con;
            _mapper = mapper;
            _actor = actor;
        }
        public int Id => 30;

        public string Name => "Get Orders Query";

        public PagedResponse<OrderDto> Execute(OrderSearchDto req)
        {
            var query = _con.Orders.Include(o => o.User)
                .Include(o => o.OrderProducts)
                .ThenInclude(o => o.Product)
                .Where(o => o.IsDeleted == false)
                .AsQueryable();
            if (!_actor.UseCases.Contains(40))
            {
                query = query.Where(x => x.UserId == _actor.Id);
            }

            if (!string.IsNullOrWhiteSpace(req.FirstName))
            {
                query = query.Where(o => o.FirstName.ToLower().Contains(req.FirstName.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(req.LastName))
            {
                query = query.Where(o => o.LastName.ToLower().Contains(req.LastName.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(req.Address))
            {
                query = query.Where(o => o.Address.ToLower().Contains(req.Address.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(req.Phone))
            {
                query = query.Where(o => o.Phone.ToLower().Contains(req.Phone.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(req.Country))
            {
                query = query.Where(o => o.Country.ToLower().Contains(req.Country.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(req.City))
            {
                query = query.Where(o => o.City.ToLower().Contains(req.City.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(req.Username))
            {
                query = query.Where(o => o.User.Username.ToLower().Contains(req.Username.ToLower()));
            }
            if (req.DateFrom > DateTime.MinValue)
            {
                query = query.Where(o => o.CreatedAt >= req.DateFrom);
            }
            if (req.DateTo > DateTime.MinValue)
            {
                query = query.Where(o => o.CreatedAt <= req.DateTo);
            }
            if (!string.IsNullOrWhiteSpace(req.ProductName))
            {
                query = query.Where(o => o.OrderProducts.Any(op => op.Name.ToLower().Contains(req.ProductName.ToLower())));
            }

            var offset = req.PerPage * (req.Page - 1);

            var res = new PagedResponse<OrderDto>
            {
                PerPage = req.PerPage,
                TotalItems = query.Count(),
                CurrentPage = req.Page,
                Items = query.Skip(offset).Take(req.PerPage).Select(x => _mapper.Map<OrderDto>(x)).ToList()
            };

            return res;
        }
    }
}
