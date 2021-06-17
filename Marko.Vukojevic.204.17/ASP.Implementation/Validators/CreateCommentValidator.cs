using ASP.Application.DTO;
using ASP.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.Implementation.Validators
{
    public class CreateCommentValidator : AbstractValidator<CommentDto>
    {
        public CreateCommentValidator(ProjekatContext con)
        {
            RuleFor(x => x.Content)
                .NotEmpty()
                .WithMessage("Your comment can not be empty!")
                .MaximumLength(250)
                .WithMessage("Your comment can't be longer than 250 characters!");

            RuleFor(x => x.ProductId)
                .GreaterThan(0)
                .WithMessage("Product id must not be less than 1!")
                .DependentRules(() =>
                {
                    RuleFor(x => x.ProductId).Must(x =>
                      {
                          return con.Products.Any(p => p.Id == x && p.IsDeleted == false);
                      }).WithMessage("Product id must belong to a real product!");
                });
        }
    }
}
