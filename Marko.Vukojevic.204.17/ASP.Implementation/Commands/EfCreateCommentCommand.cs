using ASP.Application;
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
    public class EfCreateCommentCommand : ICreateCommentCommand
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;
        private readonly CreateCommentValidator _val;
        private readonly IAppActor _actor;

        public EfCreateCommentCommand(ProjekatContext con, IMapper mapper, CreateCommentValidator val, IAppActor actor)
        {
            _con = con;
            _mapper = mapper;
            _val = val;
            _actor = actor;
        }
        public int Id => 21;

        public string Name => "Create Comment Command";

        public void Execute(CommentDto req)
        {
            req.UserId = _actor.Id;
            _val.ValidateAndThrow(req);

            Comment comment = _mapper.Map<Comment>(req);
            comment.IsActive = true;
            comment.IsDeleted = false;
            comment.CreatedAt = DateTime.UtcNow;

            _con.Comments.Add(comment);
            _con.SaveChanges();
        }
    }
}
