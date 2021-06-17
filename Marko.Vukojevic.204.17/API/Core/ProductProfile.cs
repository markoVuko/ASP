using ASP.Application.DTO;
using ASP.Domain;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Core
{
    public class ProductProfile : Profile
    {
        public ProductProfile()
        {
            CreateMap<Product, ProductDto>()
                .ForMember(
                dest => dest.Category,
                map => map.MapFrom(sors => sors.Category.Name));
            CreateMap<ProductDto, Product>();
        }
    }
}
