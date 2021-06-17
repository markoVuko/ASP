using ASP.Application;
using ASP.Application.Commands;
using ASP.Application.DTO;
using ASP.DataAccess;
using ASP.Domain;
using ASP.Implementation.Validators;
using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace ASP.Implementation.Commands
{
    public class EfRegisterUserCommand : IRegisterUserCommand
    {
        private readonly ProjekatContext _con;
        private readonly IMapper _mapper;
        private readonly RegisterUserValidator _val;
        private readonly IEmailSender _sender;

        public EfRegisterUserCommand(ProjekatContext con, IMapper mapper, RegisterUserValidator val, IEmailSender sender)
        {
            _con = con;
            _mapper = mapper;
            _val = val;
            _sender = sender;
        }
        public int Id => 16;

        public string Name => "Register User Command";

        public void Execute(RegisterUserDto req)
        {
            _val.ValidateAndThrow(req);

            var user = new User
            {
                FirstName = req.FirstName,
                LastName = req.LastName,
                Email = req.Email,
                Username = req.Username,
                Password = GetMd5Hash(req.Password),
                Address = req.Address,
                City = req.City,
                Country = req.Country,
                RoleId = 2,
                CreatedAt=DateTime.UtcNow,
                IsDeleted=false,
                IsActive=true
            };

            var useCases = new[] { 9, 10, 21, 26, 22, 23, 24, 25, 28, 29, 30, 41, 42, 43, 44, 45 }; 
            var uCs = new List<UserUseCase>();
            foreach(var uC in useCases)
            {
                //var uUC = new UserUseCase { UseCaseId = uC };
                //user.UserUseCases.Add(uUC);
                uCs.Add(new UserUseCase
                {
                    UseCaseId = uC,
                    CreatedAt=DateTime.UtcNow,
                    IsActive=true,
                    IsDeleted=false
                });
            }
            user.UserUseCases = uCs;

            _con.Users.Add(user);
            _con.SaveChanges();

            _sender.sendEmail(new EmailDto
            {
                EmailTo = req.Email,
                Content = "You have successfully registered on our site!",
                Subject = "You have been registered"
                
            });
        }

        public string GetMd5Hash(string input)
        {
            using MD5 md5Hash = MD5.Create();
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();

            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
    }
}
