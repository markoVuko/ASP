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
    public class EfGetOrderQuery : IGetOrderQuery
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;
        private readonly IAppActor _actor;
        
        public EfGetOrderQuery(ProjekatContext con, IMapper mapper, IAppActor actor)
        {
            _con = con;
            _mapper = mapper;
            _actor = actor;
        }
        public int Id => 29;

        public string Name => "Get Order Query";

        public OrderDto Execute(int id)
        {
            var order = _con.Orders
                .Include(o => o.OrderProducts)
                .ThenInclude(o => o.Product)
                .Where(o => o.Id == id && o.IsDeleted == false)
                .FirstOrDefault();
            if (_actor.UseCases.Contains(40) || _actor.Id == order.UserId)
            {
                if (order == null)
                {
                    throw new InvalidEntityException(id, typeof(Order));
                }

                return _mapper.Map<OrderDto>(order);
            }
            else
            {
                throw new UnauthorizedAccessException();
            }

        }
    }
}
