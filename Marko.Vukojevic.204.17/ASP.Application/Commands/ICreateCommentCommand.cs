using ASP.Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.Commands
{
    public interface ICreateCommentCommand : ICommand<CommentDto>
    {
    }
}
