using ASP.Application.DTO;
using ASP.Domain;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Core
{
    public class CommentProfile : Profile
    {
        public CommentProfile()
        {
            CreateMap<Comment, CommentDto>()
                .ForMember(
                dest => dest.Username,
                map => map.MapFrom(sors => sors.User.Username))
                .ForMember(
                dest => dest.PostedAt,
                map => map.MapFrom(sors => sors.CreatedAt));
            CreateMap<CommentDto, Comment>();
        }
    }
}
