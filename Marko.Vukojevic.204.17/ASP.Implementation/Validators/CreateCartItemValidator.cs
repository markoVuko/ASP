using ASP.Application.DTO;
using ASP.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Validators
{
    public class CreateCartItemValidator : AbstractValidator<CartItemDto>
    {
        public CreateCartItemValidator(ProjekatContext con)
        {
            RuleFor(x => x.Amount)
            .NotEmpty()
            .GreaterThan(0)
            .WithMessage("Amount can not be less 1!");

            RuleFor(x => x.ProductId)
            .NotNull()
            .GreaterThan(0)
            .WithMessage("Product id must be greater than 0!")
            .DependentRules(() =>
            {
                RuleFor(x => x.ProductId).Must(x =>
                {
                    return con.Products.Any(u => u.Id == x);
                }).WithMessage("Product id must belong to a real user");
            });
        }
    }
}
