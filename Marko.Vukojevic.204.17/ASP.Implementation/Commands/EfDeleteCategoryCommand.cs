using ASP.Application.Commands;
using ASP.Application.Exceptions;
using ASP.DataAccess;
using ASP.Domain;
using Microsoft.VisualBasic.CompilerServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Commands
{
    public class EfDeleteCategoryCommand : IDeleteCategoryCommand
    {
        private readonly ProjekatContext _con;
        public EfDeleteCategoryCommand(ProjekatContext con)
        {
            _con = con;
        }
        public int Id => 12;

        public string Name => "Delete Category Command";

        public void Execute(int req)
        {
            var cat = _con.Categories.Find(req);
            if (cat == null)
            {
                throw new InvalidEntityException(req, typeof(Category));
            }

            if (_con.Products.Any(x => x.CategoryId == cat.Id))
            {
                throw new Exception("Can not delete objects that are tied up");
            }


            cat.DeletedAt = DateTime.UtcNow;
            cat.IsActive = false;
            cat.IsDeleted = true;

            _con.SaveChanges();
        }
    }
}
