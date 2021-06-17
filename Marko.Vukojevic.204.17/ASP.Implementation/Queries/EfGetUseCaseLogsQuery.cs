using ASP.Application.DTO;
using ASP.Application.Queries;
using ASP.Application.Searches;
using ASP.DataAccess;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Queries
{
    public class EfGetUseCaseLogsQuery : IGetUseCaseLogsQuery
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;

        public EfGetUseCaseLogsQuery(ProjekatContext con, IMapper mapper)
        {
            _mapper = mapper;
            _con = con;
        }
        public int Id => 37;

        public string Name => "Get Use Case Logs Query";

        public PagedResponse<UseCaseLogDto> Execute(UseCaseLogSearchDto req)
        {
            var query = _con.UseCaseLogs.AsQueryable();
            if (!string.IsNullOrEmpty(req.Name))
            {
                query = query.Where(ucl => ucl.Name == req.Name);
            }
            if (!string.IsNullOrEmpty(req.Actor))
            {
                query = query.Where(ucl => ucl.Actor == req.Actor);
            }
            if (req.DateFrom > DateTime.MinValue)
            {
                query = query.Where(ucl => ucl.CreatedAt >= req.DateFrom);
            }
            if (req.DateTo > DateTime.MinValue)
            {
                query = query.Where(ucl => ucl.CreatedAt <= req.DateTo);
            }

            var offset = req.PerPage * (req.Page - 1);

            var res = new PagedResponse<UseCaseLogDto>
            {
                PerPage = req.PerPage,
                CurrentPage = req.Page,
                TotalItems = query.Count(),
                Items = query.Skip(offset).Take(req.PerPage).Select(x => _mapper.Map<UseCaseLogDto>(x)).ToList()
            };

            return res;
        }
    }
}
