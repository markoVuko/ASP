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
    public class OrderController : ControllerBase
    {
        private readonly IAppActor _actor;
        private readonly ExecutionAgent _exec;

        public OrderController(IAppActor actor, ExecutionAgent exec)
        {
            _actor = actor;
            _exec = exec;
        }
        // GET: api/Order
        [HttpGet]
        public IActionResult Get([FromServices] IGetOrdersQuery query, [FromQuery] OrderSearchDto orderSDto)
        {
            return Ok(_exec.ExecuteQuery(query, orderSDto));
        }

        // GET: api/Order/5
        [HttpGet("{id}", Name = "GetOrder")]
        public IActionResult Get(int id, [FromServices] IGetOrderQuery query)
        {
            return Ok(_exec.ExecuteQuery(query, id));
        }

        // POST: api/Order
        [HttpPost]
        public void Post([FromBody] OrderDto dto, [FromServices] ICreateOrderCommand comm)
        {
            _exec.ExecuteCommand(comm, dto);
        }

        // PUT: api/Order/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] OrderDto dto, [FromServices] IEditOrderCommand comm)
        {
            dto.Id = id;
            _exec.ExecuteCommand(comm, dto);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id, [FromServices] IDeleteOrderCommand comm)
        {
            _exec.ExecuteCommand(comm, id);
        }
    }
}
