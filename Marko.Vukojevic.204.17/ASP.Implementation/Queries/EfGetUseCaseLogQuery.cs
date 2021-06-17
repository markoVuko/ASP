using ASP.Application.DTO;
using ASP.Application.Exceptions;
using ASP.Application.Queries;
using ASP.DataAccess;
using ASP.Domain;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Queries
{
    public class EfGetUseCaseLogQuery : IGetUseCaseLogQuery
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;

        public EfGetUseCaseLogQuery(ProjekatContext con, IMapper mapper)
        {
            _con = con;
            _mapper = mapper;
        }
        public int Id => 36;

        public string Name => "Get Use Case Log Query";

        public UseCaseLogDto Execute(int id)
        {
            var ucl = _con.UseCaseLogs.Where(ucl => ucl.Id == id).FirstOrDefault();
            if (ucl == null)
            {
                throw new InvalidEntityException(id, typeof(UseCaseLog));
            }

            return _mapper.Map<UseCaseLogDto>(ucl);
        }
    }
}
