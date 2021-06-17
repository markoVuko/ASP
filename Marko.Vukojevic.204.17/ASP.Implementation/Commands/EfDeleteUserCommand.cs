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
    public class EfDeleteUserCommand : IDeleteUserCommand
    {
        private readonly ProjekatContext _con;
        
        public EfDeleteUserCommand(ProjekatContext con)
        {
            _con = con;
        }
        public int Id => 17;

        public string Name => "Delete User Command";

        public void Execute(int req)
        {
            var user = _con.Users.Include(x => x.CartItems)
                .Where(x => x.Id == req && x.IsDeleted == false).FirstOrDefault();
            if (user == null)
            {
                throw new InvalidEntityException(req, typeof(User));
            }

            user.DeletedAt = DateTime.UtcNow;
            user.IsActive = false;
            user.IsDeleted = true;

            foreach(var ci in user.CartItems)
            {
                ci.IsDeleted = true;
                ci.IsActive = false;
                ci.DeletedAt = DateTime.UtcNow;
            }

            _con.SaveChanges();
        }
    }
}
