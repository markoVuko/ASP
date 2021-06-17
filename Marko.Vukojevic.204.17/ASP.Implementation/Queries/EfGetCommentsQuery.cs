using ASP.Application.DTO;
using ASP.Application.Queries;
using ASP.Application.Searches;
using ASP.DataAccess;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Queries
{
    public class EfGetCommentsQuery : IGetCommentsQuery
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;

        public EfGetCommentsQuery(ProjekatContext con, IMapper mapper)
        {
            _con = con;
            _mapper = mapper;
        }
        public int Id => 25;

        public string Name => "Get Comments Query";

        public PagedResponse<CommentDto> Execute(CommentSearchDto req)
        {
            var query = _con.Comments.Include(c => c.User)
                .Where(x => x.IsDeleted == false && x.Product.IsDeleted == false)
                .AsQueryable();
            if (!string.IsNullOrWhiteSpace(req.Content))
            {
                query = query.Where(x => x.Content.ToLower().Contains(req.Content.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(req.Username))
            {
                query = query.Where(x => x.User.Username.ToLower().Contains(req.Username.ToLower()));
            }

            var offset = req.PerPage * (req.Page - 1);

            var res = new PagedResponse<CommentDto>
            {
                PerPage = req.PerPage,
                CurrentPage = req.PerPage,
                TotalItems = query.Count(),
                Items = query.Skip(offset).Take(req.PerPage).Select(x => _mapper.Map<CommentDto>(x)).ToList()
            };

            return res;
        }
    }
}
