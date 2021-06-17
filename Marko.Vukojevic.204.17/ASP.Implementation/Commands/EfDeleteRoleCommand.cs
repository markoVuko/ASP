using ASP.Application.Commands;
using ASP.Application.Exceptions;
using ASP.DataAccess;
using ASP.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Commands
{
    public class EfDeleteRoleCommand : IDeleteRoleCommand
    {
        private readonly ProjekatContext _con;
        
        public EfDeleteRoleCommand(ProjekatContext con)
        {
            _con = con;
        }
        public int Id => 2;

        public string Name => "Delete Role Command";

        public void Execute(int req)
        {
            var role = _con.Roles.Find(req);
            if (role == null)
            {
                throw new InvalidEntityException(req, typeof(Role));
            }

            if (_con.Users.Any(x => x.RoleId == role.Id))
            {
                throw new Exception("Can not delete objects that are tied up");
            }

            role.DeletedAt = DateTime.UtcNow;
            role.IsActive = false;
            role.IsDeleted = true;

            _con.SaveChanges();
        }
    }
}
