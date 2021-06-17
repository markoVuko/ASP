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
    public class RoleController : ControllerBase
    {
        private readonly IAppActor _actor;
        private readonly ExecutionAgent _exec;

        public RoleController(IAppActor actor, ExecutionAgent exec)
        {
            _actor = actor;
            _exec = exec;
        }
        // GET: api/Role
        [HttpGet]
        public IActionResult Get([FromQuery] RoleSearchDto roleSDto, [FromServices] IGetRolesQuery query)
        {
            return Ok(_exec.ExecuteQuery(query,roleSDto));
        }

        // GET: api/Role/5
        [HttpGet("{id}", Name = "GetRole")]
        public IActionResult Get(int id,[FromServices] IGetRoleQuery query)
        {
            return Ok(_exec.ExecuteQuery(query,id));
        }

        // POST: api/Role
        [HttpPost]
        public void Post([FromBody] RoleDto dto, [FromServices] ICreateRoleCommand comm)
        {
            _exec.ExecuteCommand(comm,dto);
        }

        // PUT: api/Role/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] RoleDto dto, [FromServices] IEditRoleCommand comm)
        {
            dto.Id = id;
            _exec.ExecuteCommand(comm, dto);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteRoleCommand comm)
        {
            _exec.ExecuteCommand(comm, id);
            return NoContent();
        }
    }
}
