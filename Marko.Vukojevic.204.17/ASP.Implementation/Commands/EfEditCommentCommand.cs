using ASP.Application;
using ASP.Application.Commands;
using ASP.Application.DTO;
using ASP.Application.Exceptions;
using ASP.DataAccess;
using ASP.Domain;
using ASP.Implementation.Validators;
using AutoMapper;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Commands
{
    public class EfEditCommentCommand : IEditCommentCommand
    {
        private readonly ProjekatContext _con;
        private readonly CreateCommentValidator _val;
        private readonly IAppActor _actor;

        public EfEditCommentCommand(ProjekatContext con, CreateCommentValidator val, IAppActor actor)
        {
            _con = con;
            _val = val;
            _actor = actor;
        }
        public int Id => 23;

        public string Name => "Edit Comment Command";

        public void Execute(CommentDto req)
        {
            _val.ValidateAndThrow(req);
            var comment = _con.Comments.Where(x => x.IsDeleted == false && x.Id == req.Id)
                .Include(x=>x.User)
                .FirstOrDefault();
            if (comment == null)
            {
                throw new InvalidEntityException(req.Id, typeof(Comment));
            }
            if (!_actor.UseCases.Contains(40))
            {
                if (_actor.Id != comment.UserId)
                {
                    throw new UnauthorizedAccessException();
                }
            }
            if (!string.IsNullOrEmpty(req.Content))
            {
                comment.Content = req.Content;
            }

            comment.ModifiedAt = DateTime.UtcNow;

            _con.SaveChanges();
        }
    }
}
