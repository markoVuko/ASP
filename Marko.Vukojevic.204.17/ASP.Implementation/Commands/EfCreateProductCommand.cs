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
    public class EfCreateProductCommand : ICreateProductCommand
    {
        private readonly ProjekatContext _con;
        private readonly CreateProductValidator _val;
        private readonly IMapper _mapper;

        public EfCreateProductCommand(ProjekatContext con, CreateProductValidator val, IMapper mapper)
        {
            _con = con;
            _val = val;
            _mapper = mapper;
        }
        public int Id => 6;

        public string Name => "Create Product Command";

        public void Execute(ProductDto req)
        {
            _val.ValidateAndThrow(req);

            Product prod = _mapper.Map<Product>(req);
            prod.CategoryId = req.CategoryId;
            prod.IsActive = true;
            prod.IsDeleted = false;
            prod.CreatedAt = DateTime.UtcNow;

            _con.Products.Add(prod);
            _con.SaveChanges();
        }
    }
}
