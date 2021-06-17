using ASP.Application.DTO;
using ASP.Domain;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Core
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<User, UserDto>()
                .ForMember(
                dest => dest.Role,
                map => map.MapFrom(sors => sors.Role.Name))
                .ForMember(
                dest => dest.RegisteredAt,
                map => map.MapFrom(sors => sors.CreatedAt));
            CreateMap<UserDto, User>();
        }
    }
}
