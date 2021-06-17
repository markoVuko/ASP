using ASP.Application.Commands;
using ASP.Application.Exceptions;
using ASP.DataAccess;
using ASP.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Commands
{
    public class EfDeleteProductCommand : IDeleteProductCommand
    {
        private readonly ProjekatContext _con;
        
        public EfDeleteProductCommand(ProjekatContext con)
        {
            _con = con;
        }
        public int Id => 8;

        public string Name => "Delete Product Command";

        public void Execute(int req)
        {
            var prod = _con.Products.Include(x => x.CartItems)
                .Where(x => x.Id == req).First();
            if (prod == null)
            {
                throw new InvalidEntityException(req, typeof(Product));
            }

            prod.DeletedAt = DateTime.UtcNow;
            prod.IsActive = false;
            prod.IsDeleted = true;

            foreach(var ci in prod.CartItems)
            {
                ci.IsActive = false;
                ci.IsDeleted = true;
                ci.DeletedAt = DateTime.UtcNow;
            }

            _con.SaveChanges();
        }
    }
}
