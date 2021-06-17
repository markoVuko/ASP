using ASP.Application.DTO;
using ASP.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Validators
{
    public class CreateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public CreateCategoryValidator(ProjekatContext con)
        {
            RuleFor(x => x.Name)
            .NotEmpty()
            .MinimumLength(3)
            .MaximumLength(30)
            .WithMessage("Category name must be at least 3 and no more than 30 characters.")
            .DependentRules(() =>
            {
                RuleFor(x => x.Name).Must(name =>
                {
                    return !con.Categories.Any(c => c.Name == name);
                }).WithMessage("This category name is taken already!");
            });
        }
    }
}
