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
    public class EfEditOrderCommand : IEditOrderCommand
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;
        private readonly CreateOrderValidator _val;

        public EfEditOrderCommand(ProjekatContext con, IMapper mapper, CreateOrderValidator val)
        {
            _con = con;
            _mapper = mapper;
            _val = val;
        }
        public int Id => 28;

        public string Name => "Edit Order Command";

        public void Execute(OrderDto req)
        {
            _val.ValidateAndThrow(req);
            var order = _con.Orders.Where(x => x.IsDeleted == false && x.Id == req.Id).First();
            if (order == null)
            {
                throw new InvalidEntityException(req.Id, typeof(Order));
            }
            if (!string.IsNullOrWhiteSpace(req.FirstName))
            {
                order.FirstName = req.FirstName;
            }
            if (!string.IsNullOrWhiteSpace(req.LastName))
            {
                order.LastName = req.LastName;
            }
            if (!string.IsNullOrWhiteSpace(req.Phone))
            {
                order.Phone = req.Phone;
            }
            if (!string.IsNullOrWhiteSpace(req.Country))
            {
                order.Country = req.Country;
            }
            if (!string.IsNullOrWhiteSpace(req.City))
            {
                order.City = req.City;
            }
            if (!string.IsNullOrWhiteSpace(req.Address))
            {
                order.Address = req.Address;
            }

            order.ModifiedAt = DateTime.UtcNow;

            _con.SaveChanges();
        }
    }
}
