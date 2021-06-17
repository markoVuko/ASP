using ASP.Application.DTO;
using ASP.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Validators
{
    public class EditProductValidator : AbstractValidator<ProductDto>
    {
        public EditProductValidator(ProjekatContext con)
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .MinimumLength(3)
                .MaximumLength(30)
                .WithMessage("Product name must be at least 3 and no more than 30 characters.")
                .Must((prod, n) => !con.Products.Any(p => p.Name == n && p.Id != prod.Id))
                .WithMessage("This product already exists.");
            RuleFor(x => x.Price)
                .NotEmpty()
                .GreaterThan(0)
                .WithMessage("Price must be more than zero!");
            RuleFor(x => x.Description)
                .NotEmpty()
                .WithMessage("Description can not be empty!");
            RuleFor(x => x.CategoryId)
                .NotNull()
                .WithMessage("Category Id can not be empty!")
                .DependentRules(() => {
                    RuleFor(x => x.CategoryId).Must(x =>
                    {
                        return con.Categories.Any(c => c.Id == x);
                    }).WithMessage("Category id must belong to real category");
                });


        }
    }
}
