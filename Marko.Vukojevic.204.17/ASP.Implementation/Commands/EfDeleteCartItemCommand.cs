using ASP.Application;
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
    public class EfDeleteCartItemCommand : IDeleteCartItemCommand
    {
        public int Id => 42;

        public string Name => "Delete Cart Item Command";

        private readonly ProjekatContext _con;
        private readonly IAppActor _actor;

        public EfDeleteCartItemCommand(ProjekatContext con, IAppActor actor)
        {
            _con = con;
            _actor = actor;
        }

        public void Execute(int id)
        {
            var ci = _con.CartItems.Where(ci => ci.Id == id).FirstOrDefault();
            if (ci == null)
            {
                throw new InvalidEntityException(id, typeof(CartItem));
            }

            if (!_actor.UseCases.Contains(40))
            {
                if (ci.UserId != _actor.Id)
                {
                    throw new UnauthorizedAccessException();
                }
            }

            ci.DeletedAt = DateTime.UtcNow;
            ci.IsActive = false;
            ci.IsDeleted = true;

            _con.SaveChanges();
        }
    }
}
