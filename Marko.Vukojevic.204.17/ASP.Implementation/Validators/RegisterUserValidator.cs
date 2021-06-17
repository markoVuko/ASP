using ASP.Application.DTO;
using ASP.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Validators
{
    public class RegisterUserValidator : AbstractValidator<RegisterUserDto>
    {
        public RegisterUserValidator(ProjekatContext con)
        {
            RuleFor(x => x.Username)
                .NotEmpty()
                .MinimumLength(3)
                .MaximumLength(20)
                .WithMessage("Username can not be less than 3 or more than 20 characters!")
                .WithMessage("Username can not be less than 3 or more than 20 characters!")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Username).Must((user, username) =>
                    {
                        return !con.Users.Any(u => u.Username == username);
                    })
                    .WithMessage("This username is already taken by another user!");
                });
            //RuleFor(x => x.RoleId)
            //    .GreaterThan(0)
            //    .WithMessage("Role id can not be less than 1!")
            //    .DependentRules(() =>
            //    {
            //        RuleFor(x => x.RoleId).Must(id =>
            //        {
            //            return con.Roles.Any(r => r.Id == id && r.IsDeleted==false);
            //        }).WithMessage("Role id must belong to a real role!");
            //    });

            RuleFor(x => x.Password)
                .NotEmpty()
                .MinimumLength(8)
                .MaximumLength(30)
                .WithMessage("Password can not be less than 8 or more than 30 characters!");

            RuleFor(x => x.FirstName)
                .NotEmpty()
                .MinimumLength(3)
                .MaximumLength(30)
                .WithMessage("First name must be at least 3 and no more than 30 characters!");

            RuleFor(x => x.LastName)
                .NotEmpty()
                .MinimumLength(3)
                .MaximumLength(30)
                .WithMessage("Last name must be at least 3 and no more than 30 characters!");

            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress()
                .WithMessage("Please enter a valid email!")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Email).Must((user, email) =>
                    {
                        return !con.Users.Any(u => u.Email == email);
                    })
                    .WithMessage("This email is already taken by another user!");
                });
        }
    }
}
