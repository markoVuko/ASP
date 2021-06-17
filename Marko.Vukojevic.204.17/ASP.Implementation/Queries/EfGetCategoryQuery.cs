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
    public class EfGetCategoryQuery : IGetCategoryQuery
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;

        public EfGetCategoryQuery(ProjekatContext con, IMapper mapper)
        {
            _con = con;
            _mapper = mapper;
        }
        public int Id => 14;

        public string Name => "Get Category Query";

        public CategoryDto Execute(int id)
        {
            var cat = _con.Categories.Where(x => x.Id == id && x.IsDeleted == false).FirstOrDefault();
            if (cat == null)
            {
                throw new InvalidEntityException(id, typeof(Category));
            }

            return _mapper.Map<CategoryDto>(cat);
        }
    }
}
