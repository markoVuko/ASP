using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Domain
{
    public class UserUseCase : Entity
    {
        public int UseCaseId { get; set; }
        public virtual User User { get; set; }
        public int UserId { get; set; }
    }
}
