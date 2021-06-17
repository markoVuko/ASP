using ASP.Application.Commands;
using ASP.Application.DTO;
using ASP.Application.Exceptions;
using ASP.DataAccess;
using ASP.Domain;
using ASP.Implementation.Validators;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Commands
{
    public class EfEditProductCommand : IEditProductCommand
    {
        private readonly ProjekatContext _con;
        private readonly EditProductValidator _val;
        public EfEditProductCommand(ProjekatContext con, EditProductValidator val)
        {
            _con = con;
            _val = val;
        }
        public int Id => 7;

        public string Name => "Edit Product Command";

        public void Execute(ProductDto req)
        {
            _val.ValidateAndThrow(req);

            var prod = _con.Products.Where(x => x.IsDeleted == false && x.Id == req.Id).First();
            if (prod == null)
            {
                throw new InvalidEntityException(req.Id, typeof(Product));
            }

            if(req.Name != null)
            {
                prod.Name = req.Name;  
            }
            if (req.CategoryId != null && _con.Categories.Find(req.CategoryId) != null)
            {
                prod.Category = _con.Categories.Find(req.CategoryId);
            }
            if (req.Image != null)
            {
                prod.Image = req.Image;  
            }
            if (req.Price != null)
            {
                prod.Price = req.Price;
            }
            if (req.Description != null)
            {
                prod.Description = req.Description;
            }

            prod.ModifiedAt = DateTime.UtcNow;

            _con.SaveChanges();

        }
    }
}
