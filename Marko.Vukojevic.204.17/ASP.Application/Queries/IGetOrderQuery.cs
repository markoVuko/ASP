﻿using ASP.Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.Application.Queries
{
    public interface IGetOrderQuery : IQuery<int, OrderDto>
    {
    }
}
