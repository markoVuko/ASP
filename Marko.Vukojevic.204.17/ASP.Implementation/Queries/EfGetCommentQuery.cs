using ASP.Application.DTO;
using ASP.Application.Exceptions;
using ASP.Application.Queries;
using ASP.DataAccess;
using ASP.Domain;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Queries
{
    public class EfGetCommentQuery : IGetCommentQuery
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;

        public EfGetCommentQuery(ProjekatContext con, IMapper mapper)
        {
            _con = con;
            _mapper = mapper;
        }
        public int Id => 24;

        public string Name => "Get Comment Query";

        public CommentDto Execute(int id)
        {
            var comment = _con.Comments.Include(c => c.User)
                .Where(x => x.Id == id && x.IsDeleted == false && x.Product.IsDeleted==false)
                .FirstOrDefault();
            if (comment == null)
            {
                throw new InvalidEntityException(id, typeof(Comment));
            }

            return _mapper.Map<CommentDto>(comment);
        }
    }
}
