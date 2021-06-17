using ASP.Application.DTO;
using ASP.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.Queries
{
    public interface IGetRolesQuery : IQuery<RoleSearchDto,PagedResponse<RoleDto>>
    {
    }
}
