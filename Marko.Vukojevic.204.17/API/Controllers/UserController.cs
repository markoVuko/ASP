using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASP.Application;
using ASP.Application.Commands;
using ASP.Application.DTO;
using ASP.Application.Queries;
using ASP.Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IAppActor _actor;
        private readonly ExecutionAgent _exec;
        public UserController(IAppActor actor, ExecutionAgent exec)
        {
            _actor = actor;
            _exec = exec;
        }
        // GET: api/User
        [HttpGet]
        public IActionResult Get([FromQuery] UserSearchDto roleSDto, [FromServices] IGetUsersQuery query)
        {
            return Ok(_exec.ExecuteQuery(query, roleSDto));
        }

        // GET: api/User/5
        [HttpGet("{id}", Name = "GetUser")]
        public IActionResult Get(int id, [FromServices] IGetUserQuery query)
        {
            return Ok(_exec.ExecuteQuery(query, id));
        }

        // PUT: api/User/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] UserDto dto, [FromServices] IEditUserCommand comm)
        {
            dto.Id = id;
            _exec.ExecuteCommand(comm, dto);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteUserCommand comm)
        {
            _exec.ExecuteCommand(comm, id);
            return NoContent();
        }
    }
}
