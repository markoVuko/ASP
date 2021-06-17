using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application
{
    public interface IAppActor
    {
        int Id { get; }
        string Identity { get; }
        IEnumerable<int> UseCases { get; }
    }
}
