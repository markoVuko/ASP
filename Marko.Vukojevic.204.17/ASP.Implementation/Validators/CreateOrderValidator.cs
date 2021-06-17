using ASP.Application.DTO;
using ASP.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Implementation.Validators
{
    public class CreateOrderValidator : AbstractValidator<OrderDto>
    {
        public CreateOrderValidator(ProjekatContext con)
        {
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
                .WithMessage("Please enter a valid email!");

            RuleFor(x => x.Address)
                .NotEmpty()
                .MinimumLength(6)
                .MaximumLength(50)
                .WithMessage("Address must be at least 6 and no more than 50 characters!");

            RuleFor(x => x.City)
                .NotEmpty()
                .MinimumLength(3)
                .MaximumLength(20)
                .WithMessage("City must be at least 3 and no more than 20 characters!");

            RuleFor(x => x.Country)
                .NotEmpty()
                .MinimumLength(3)
                .MaximumLength(20)
                .WithMessage("Country must be at least 3 and no more than 20 characters!");

            RuleFor(x => x.Phone)
                .Matches(@"^0\d{7,8}$")
                .WithMessage("Phone must be in a valid format.");

        }
    }
}
