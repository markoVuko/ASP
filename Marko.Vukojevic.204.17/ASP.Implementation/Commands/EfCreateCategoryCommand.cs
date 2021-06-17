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
    public class EfCreateCategoryCommand : ICreateCategoryCommand
    {
        private readonly ProjekatContext _con;
        private readonly CreateCategoryValidator _val;
        private readonly IMapper _mapper;

        public EfCreateCategoryCommand(ProjekatContext con, IMapper mapper, CreateCategoryValidator val)
        {
            _con = con;
            _val = val;
            _mapper = mapper;
        }
        public int Id => 11;

        public string Name => "Create Category Command";

        public void Execute(CategoryDto req)
        {
            _val.ValidateAndThrow(req);

            Category cat = _mapper.Map<Category>(req);
            cat.CreatedAt = DateTime.UtcNow;
            cat.IsDeleted = false;
            cat.IsActive = true;

            //var cat = new Category
            //{
            //    CreatedAt = DateTime.UtcNow,
            //    Name = req.Name,
            //    Description = req.Description,
            //    Image = req.Image,
            //    IsDeleted = false,
            //    IsActive = true
            //};


            _con.Categories.Add(cat);
            _con.SaveChanges();
        }
    }
}
