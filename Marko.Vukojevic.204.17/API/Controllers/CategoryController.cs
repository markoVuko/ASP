using System;
using System.Collections.Generic;
using System.IO;
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
    public class CategoryController : ControllerBase
    {
        private readonly IAppActor _actor;
        private readonly ExecutionAgent _exec;

        public CategoryController(IAppActor actor, ExecutionAgent exec)
        {
            _actor = actor;
            _exec = exec;
        }
        // GET: api/Category
        [HttpGet]
        public IActionResult Get([FromQuery] CategorySearchDto catSDto, [FromServices] IGetCategoriesQuery query)
        {
            return Ok(_exec.ExecuteQuery(query, catSDto));
        }

        // GET: api/Category/5
        [HttpGet("{id}", Name = "GetCategory")]
        public IActionResult Get(int id, [FromServices] IGetCategoryQuery query)
        {
            return Ok(_exec.ExecuteQuery(query, id));
        }

        // POST: api/Category
        [HttpPost]
        public void Post([FromForm] CategoryDto dto, [FromServices] ICreateCategoryCommand comm)
        {

            var guid = Guid.NewGuid();
            var ext = Path.GetExtension(dto.FormImage.FileName);
            var newFileName = guid + ext;

            var path = Path.Combine("wwwroot", "images", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                dto.FormImage.CopyTo(fileStream);
            }
            dto.Image = newFileName;
            _exec.ExecuteCommand(comm, dto);
        }

        // PUT: api/Category/5
        [HttpPut("{id}")]
        public void Put(int id, [FromForm] CategoryDto dto, [FromServices] IEditCategoryCommand comm)
        {
            if (dto.FormImage != null)
            {
                var guid = Guid.NewGuid();
                var ext = Path.GetExtension(dto.FormImage.FileName);
                var newFileName = guid + ext;

                var path = Path.Combine("wwwroot", "images", newFileName);

                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    dto.FormImage.CopyTo(fileStream);
                }
                dto.Image = newFileName;
            }
            dto.Id = id;
            _exec.ExecuteCommand(comm, dto);
        }

        // DELETE: api/Category/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCategoryCommand comm)
        {
            _exec.ExecuteCommand(comm, id);
            return NoContent();
        }
    }
}