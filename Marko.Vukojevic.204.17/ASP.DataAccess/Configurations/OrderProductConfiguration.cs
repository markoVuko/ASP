using ASP.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.DataAccess.Configurations
{
    public class OrderProductConfiguration : IEntityTypeConfiguration<OrderProduct>
    {
        public void Configure(EntityTypeBuilder<OrderProduct> builder)
        {
            builder.Property(x => x.Image).IsRequired();
            builder.Property(x => x.Name).IsRequired();
            builder.Property(x => x.Amount).IsRequired();
            builder.Property(x => x.Price).IsRequired();
        }
    }
}
