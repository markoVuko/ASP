using ASP.Application.DTO;
using ASP.DataAccess;
using FluentValidation;
using FluentValidation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Validators
{
    public class CreateRoleValidator : AbstractValidator<RoleDto>
    {
        public CreateRoleValidator(ProjekatContext con)
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .MinimumLength(3)
                .MaximumLength(20)
                .WithMessage("Role must be at least 3 characters, and no more than 20 characters long.")
                .Must(name => !con.Roles.Any(r => r.Name == name))
                .WithMessage("The role you're trying to create already exists.");
        }
    }
}
