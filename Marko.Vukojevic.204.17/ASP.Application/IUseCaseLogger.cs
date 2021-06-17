using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application
{
    public interface IUseCaseLogger
    {
        void Log(IAppActor actor, IUseCase uC, object request);
    }
}
