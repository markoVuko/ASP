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
    public class EfDeleteCommentCommand : IDeleteCommentCommand
    {
        private readonly ProjekatContext _con;
        private readonly IAppActor _actor;

        public EfDeleteCommentCommand(ProjekatContext con, IAppActor actor)
        {
            _con = con;
            _actor = actor;
        }
        public int Id => 22;

        public string Name => "Delete Comment Command";

        public void Execute(int id)
        {
            var comment = _con.Comments.Find(id);
            if (comment == null)
            {
                throw new InvalidEntityException(id, typeof(Comment));
            }
            if (!_actor.UseCases.Contains(40))
            {
                if (_actor.Id != comment.UserId)
                {
                    throw new UnauthorizedAccessException();
                }
            }

            comment.DeletedAt = DateTime.UtcNow;
            comment.IsActive = false;
            comment.IsDeleted = true;

            _con.SaveChanges();
        }
    }
}
