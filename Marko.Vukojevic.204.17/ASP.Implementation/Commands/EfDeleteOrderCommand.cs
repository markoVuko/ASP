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
    public class EfDeleteOrderCommand : IDeleteOrderCommand
    {
        private readonly ProjekatContext _con;
        private readonly IAppActor _actor;

        public EfDeleteOrderCommand(ProjekatContext con, IAppActor actor)
        {
            _con = con;
            _actor = actor;
        }
        public int Id => 27;

        public string Name => "Delete Order Command";

        public void Execute(int id)
        {
            
                var order = _con.Orders.Where(o => o.Id == id).First();
                if (order == null)
                {
                    throw new InvalidEntityException(id, typeof(Order));
                }

                order.DeletedAt = DateTime.UtcNow;
                order.IsActive = false;
                order.IsDeleted = true;

                foreach (var op in order.OrderProducts)
                {
                    op.DeletedAt = DateTime.UtcNow;
                    op.IsActive = false;
                    op.IsDeleted = true;
                }

                _con.SaveChanges();
            
        }
    }
}
