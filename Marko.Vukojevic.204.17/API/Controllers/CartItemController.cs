using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using API.Core;
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
    public class CartItemController : ControllerBase
    {
        private readonly IAppActor _actor;
        private readonly ExecutionAgent _exec;

        public CartItemController(IAppActor actor, ExecutionAgent exec)
        {
            _actor = actor;
            _exec = exec;
        }
        // GET: api/CartItem
        [HttpGet]
        public IActionResult Get([FromServices] IGetCartItemsQuery query, [FromQuery] CartItemSearchDto orderSDto)
        {
            return Ok(_exec.ExecuteQuery(query, orderSDto));
        }

        // GET: api/CartItem/5
        [HttpGet("{id}", Name = "GetCartItem")]
        public IActionResult Get(int id, [FromServices] IGetCartItemQuery query)
        {
            return Ok(_exec.ExecuteQuery(query, id));
        }

        // POST: api/CartItem
        [HttpPost]
        public void Post([FromBody] CartItemDto dto, [FromServices] ICreateCartItemCommand comm)
        {
            _exec.ExecuteCommand(comm, dto);
        }

        // PUT: api/CartItem/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] CartItemDto dto, [FromServices] IEditCartItemCommand comm)
        {
            dto.Id = id;
            _exec.ExecuteCommand(comm, dto);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id, [FromServices] IDeleteCartItemCommand comm)
        {
            _exec.ExecuteCommand(comm, id);
        }
    }
}
