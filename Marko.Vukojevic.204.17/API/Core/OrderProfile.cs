using ASP.Application.DTO;
using ASP.Domain;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Core
{
    public class OrderProfile : Profile
    {
        public OrderProfile()
        {
            CreateMap<Order, OrderDto>()
                .ForMember(
                dest => dest.DateOfOrder,
                map => map.MapFrom(sors => sors.CreatedAt));
            CreateMap<OrderDto, Order>();
        }
    }
}
