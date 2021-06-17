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
    public class CommentController : ControllerBase
    {
        private readonly ExecutionAgent _exec;
        private readonly IAppActor _actor;

        public CommentController(ExecutionAgent exec, IAppActor actor)
        {
            _actor = actor;
            _exec = exec;
        }
        // GET: api/Comment
        [HttpGet]
        public IActionResult Get([FromQuery] CommentSearchDto dto, [FromServices] IGetCommentsQuery query)
        {
            return Ok(_exec.ExecuteQuery(query, dto));
        }

        // GET: api/Comment/5
        [HttpGet("{id}", Name = "GetComment")]
        public IActionResult Get(int id, [FromServices] IGetCommentQuery query)
        {
            return Ok(_exec.ExecuteQuery(query, id));
        }

        // POST: api/Comment
        [HttpPost]
        public void Post([FromBody] CommentDto dto, [FromServices] ICreateCommentCommand comm)
        {
            _exec.ExecuteCommand(comm, dto);
        }

        // PUT: api/Comment/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] CommentDto dto, [FromServices] IEditCommentCommand comm)
        {
            dto.Id = id;
            _exec.ExecuteCommand(comm, dto);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCommentCommand comm)
        {
            _exec.ExecuteCommand(comm, id);
            return NoContent();
        }
    }
}
