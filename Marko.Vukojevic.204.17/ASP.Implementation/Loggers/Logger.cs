using ASP.Application;
using ASP.DataAccess;
using ASP.Domain;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Implementation.Loggers
{
    public class Logger : IUseCaseLogger
    {
        private readonly ProjekatContext _con;

        public Logger(ProjekatContext con)
        {
            _con = con;
        }
        public void Log(IAppActor actor, IUseCase uC, object req)
        {
            _con.UseCaseLogs.Add(new UseCaseLog
            {
                Actor = actor.Identity,
                Data = JsonConvert.SerializeObject(req),
                Name = uC.Name
            });

            _con.SaveChanges();
        }
    }
}
