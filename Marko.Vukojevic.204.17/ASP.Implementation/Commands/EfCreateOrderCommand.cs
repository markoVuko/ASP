using ASP.Application;
using ASP.Application.Commands;
using ASP.Application.DTO;
using ASP.Application.Exceptions;
using ASP.DataAccess;
using ASP.Domain;
using ASP.Implementation.Validators;
using AutoMapper;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Commands
{
    public class EfCreateOrderCommand : ICreateOrderCommand
    {
        private readonly ProjekatContext _con;
        private readonly IAppActor _actor;
        private readonly IMapper _mapper;
        private readonly CreateOrderValidator _val;

        public EfCreateOrderCommand(ProjekatContext con, IAppActor actor, IMapper mapper, CreateOrderValidator val)
        {
            _con = con;
            _actor = actor;
            _mapper = mapper;
            _val = val;
        }
        public int Id => 26;

        public string Name => "Create Order Command";

        public void Execute(OrderDto req)
        {
            _val.ValidateAndThrow(req);
            //var order = _mapper.Map<Order>(req);
            var ci = _con.CartItems.Include(x=>x.Product)
                .Where(x => x.UserId == _actor.Id && x.IsDeleted == false).AsQueryable();
            if (ci == null)
            {
                throw new InvalidEntityException(req.Id, typeof(CartItem));
            }

            var order = new Order
            {
                UserId = _actor.Id,
                CreatedAt = DateTime.UtcNow,
                IsDeleted = false,
                IsActive = true,
                FirstName = req.FirstName,
                LastName = req.LastName,
                Address = req.Address,
                Country = req.Country,
                City = req.City,
                Email = req.Email,
                Phone = req.Phone,
                OrderProducts = ci.Select(x => new OrderProduct
                     {
                         ProductId = x.ProductId,
                         Name = x.Product.Name,
                         Price = x.Product.Price,
                         Amount = x.Amount,
                         Image = x.Product.Image,
                         IsDeleted = false,
                         IsActive = true,
                         CreatedAt = DateTime.Now
                     }
                ).ToList()
            };
            //foreach(var c in ci)
            //{
            //    order.OrderProducts.Add(new OrderProduct
            //    {
            //        ProductId = c.ProductId,
            //        Name = c.Product.Name,
            //        Price = c.Product.Price,
            //        Amount = c.Amount,
            //        Image = c.Product.Image,
            //        IsDeleted = false,
            //        IsActive = true,
            //        CreatedAt = DateTime.Now
            //    });
            //}
            

            if (order == null)
            {
                throw new InvalidEntityException(req.Id, typeof(Order));
            }

            
            foreach(var c in ci)
            {
                c.IsDeleted = true;
                c.DeletedAt = DateTime.UtcNow;
                c.IsActive = false;
            }

            _con.Orders.Add(order);
            _con.SaveChanges();
        }
    }
}
