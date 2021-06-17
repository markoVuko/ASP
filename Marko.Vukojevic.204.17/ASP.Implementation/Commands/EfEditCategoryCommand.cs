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
    public class EfEditCategoryCommand : IEditCategoryCommand
    {
        private readonly ProjekatContext _con;
        private readonly EditCategoryValidator _val;

        public EfEditCategoryCommand(ProjekatContext con, EditCategoryValidator val)
        {
            _con = con;
            _val = val;
        }
        public int Id => 13;

        public string Name => "Edit Category Command";

        public void Execute(CategoryDto req)
        {
            _val.ValidateAndThrow(req);
            var cat = _con.Categories.Where(x=>x.IsDeleted==false&&x.Id==req.Id).First();
            if (cat == null)
            {
                throw new InvalidEntityException(req.Id, typeof(Category));
            }
            if (!string.IsNullOrWhiteSpace(req.Name))
            {
                cat.Name = req.Name;
            }
            if (!string.IsNullOrWhiteSpace(req.Description))
            {
                cat.Description = req.Description;
            }
            cat.ModifiedAt = DateTime.UtcNow;
            _con.SaveChanges();
        }
    }
}
