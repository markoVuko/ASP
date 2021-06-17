using ASP.Application;
using ASP.Application.Commands;
using ASP.Application.Queries;
using ASP.Implementation.Commands;
using ASP.Implementation.Queries;
using ASP.Implementation.Validators;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API.Core
{
    public static class ContainerExtensions
    {
        public static void AddUseCases(this IServiceCollection services)
        {
            services.AddTransient<ICreateRoleCommand, EfCreateRoleCommand>();
            services.AddTransient<IDeleteRoleCommand, EfDeleteRoleCommand>();
            services.AddTransient<IEditRoleCommand, EfEditRoleCommand>();
            services.AddTransient<IGetRoleQuery, EfGetRoleQuery>();
            services.AddTransient<IGetRolesQuery, EfGetRolesQuery>();

            services.AddTransient<ICreateCategoryCommand, EfCreateCategoryCommand>();
            services.AddTransient<IDeleteCategoryCommand, EfDeleteCategoryCommand>();
            services.AddTransient<IEditCategoryCommand, EfEditCategoryCommand>();
            services.AddTransient<IGetCategoriesQuery, EfGetCategoriesQuery>();
            services.AddTransient<IGetCategoryQuery, EfGetCategoryQuery>();

            services.AddTransient<ICreateOrderCommand, EfCreateOrderCommand>();
            services.AddTransient<IDeleteOrderCommand, EfDeleteOrderCommand>();
            services.AddTransient<IEditOrderCommand, EfEditOrderCommand>();
            services.AddTransient<IGetOrdersQuery, EfGetOrdersQuery>();
            services.AddTransient<IGetOrderQuery, EfGetOrderQuery>();

            services.AddTransient<ICreateProductCommand, EfCreateProductCommand>();
            services.AddTransient<IDeleteProductCommand, EfDeleteProductCommand>();
            services.AddTransient<IEditProductCommand, EfEditProductCommand>();
            services.AddTransient<IGetProductsQuery, EfGetProductsQuery>();
            services.AddTransient<IGetProductQuery, EfGetProductQuery>();

            services.AddTransient<ICreateCommentCommand, EfCreateCommentCommand>();
            services.AddTransient<IDeleteCommentCommand, EfDeleteCommentCommand>();
            services.AddTransient<IEditCommentCommand, EfEditCommentCommand>();
            services.AddTransient<IGetCommentsQuery, EfGetCommentsQuery>();
            services.AddTransient<IGetCommentQuery, EfGetCommentQuery>();

            services.AddTransient<ICreateCartItemCommand, EfCreateCartItemCommand>();
            services.AddTransient<IDeleteCartItemCommand, EfDeleteCartItemCommand>();
            services.AddTransient<IEditCartItemCommand, EfEditCartItemCommand>();
            services.AddTransient<IGetCartItemsQuery, EfGetCartItemsQuery>();
            services.AddTransient<IGetCartItemQuery, EfGetCartItemQuery>();

            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddTransient<IEditUserCommand, EfEditUserCommand>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            services.AddTransient<IGetUsersQuery, EfGetUsersQuery>();
            services.AddTransient<IGetUserQuery, EfGetUserQuery>();

            services.AddTransient<IGetUseCaseLogsQuery, EfGetUseCaseLogsQuery>();
            services.AddTransient<IGetUseCaseLogQuery, EfGetUseCaseLogQuery>();
        }

        public static void AddValidators(this IServiceCollection services)
        {
            services.AddTransient<CreateRoleValidator>();
            services.AddTransient<CreateCommentValidator>();
            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<EditUserValidator>();
            services.AddTransient<EditCategoryValidator>();
            services.AddTransient<EditProductValidator>();
            services.AddTransient<CreateProductValidator>();
            services.AddTransient<CreateOrderValidator>();
            services.AddTransient<CreateCategoryValidator>();
            services.AddTransient<CreateCartItemValidator>();
        }

        public static void AddJwtActor(this IServiceCollection services)
        {
            services.AddTransient((Func<IServiceProvider, IAppActor>)(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    //throw new InvalidOperationException("Actor data doesnt exist in token.");
                    return new GuestActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<Core.JwtActor>(actorString);

                return actor;

            }));
        }

        public static void AddJwtAuth(this IServiceCollection services)
        {
            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }

        public static void AddSwaggerExt(this IServiceCollection services)
        {
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Projekat 204/17", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                          {
                            Reference = new OpenApiReference
                              {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                              },
                              Scheme = "oauth2",
                              Name = "Bearer",
                              In = ParameterLocation.Header,

                            },
                            new List<string>()
                          }
                    });
            });
        }
    }
}
