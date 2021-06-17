using ASP.Application.DTO;
using ASP.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Implementation.Validators
{
    public class CreateOrderProductValidator : AbstractValidator<OrderProductDto>
    {
        public CreateOrderProductValidator(ProjekatContext con)
        {
            RuleFor(x => x.Name)
            .NotEmpty();

            RuleFor(x => x.Amount)
            .NotEmpty()
            .GreaterThan(0)
            .WithMessage("Amount can not be less 1!");

            RuleFor(x => x.Price)
            .NotEmpty()
            .GreaterThan(0)
            .WithMessage("Price can not be less than 1!");
        }
    }
}
