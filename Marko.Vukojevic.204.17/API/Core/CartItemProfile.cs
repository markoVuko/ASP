using ASP.Application.DTO;
using ASP.Domain;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Core
{
    public class CartItemProfile : Profile
    {
        public CartItemProfile()
        {
            CreateMap<CartItem, CartItemDto>()
                .ForMember(
                dest => dest.Username,
                map => map.MapFrom(sors => sors.User.Username))
                .ForMember(
                dest => dest.Product,
                map => map.MapFrom(sors => sors.Product))
                .ForMember(
                dest => dest.UserId,
                map => map.MapFrom(sors => sors.User.Id))
                .ForMember(
                dest => dest.ProductId,
                map => map.MapFrom(sors => sors.Product.Id));
            CreateMap<CartItemDto, CartItem>();
        }
    }
}
