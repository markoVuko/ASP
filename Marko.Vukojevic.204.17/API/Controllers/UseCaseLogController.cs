using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASP.Application;
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
    public class UseCaseLogController : ControllerBase
    {
        private readonly IAppActor _actor;
        private readonly ExecutionAgent _exec;

        public UseCaseLogController(IAppActor actor, ExecutionAgent exec)
        {
            _actor = actor;
            _exec = exec;
        }

        // GET: api/UseCaseLog
        [HttpGet]
        public IActionResult Get([FromQuery] UseCaseLogSearchDto dto, [FromServices] IGetUseCaseLogsQuery q)
        {
            return Ok(_exec.ExecuteQuery(q, dto));
        }

        // GET api/UseCaseLog/5

        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetUseCaseLogQuery query)
        {
            return Ok(_exec.ExecuteQuery(query, id));
        }
    }
}
