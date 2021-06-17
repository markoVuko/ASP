using ASP.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.DataAccess.Configurations
{
    public class ProductConfiguration : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.Property(x => x.Name).IsRequired();
            builder.HasIndex(x => x.Name).IsUnique();
            builder.Property(x => x.Price).IsRequired();
            builder.Property(x => x.Description).IsRequired();
            builder.Property(x => x.Image).IsRequired();

            builder.HasMany(x => x.Comments).WithOne(y => y.Product)
                .HasForeignKey(x => x.ProductId).OnDelete(DeleteBehavior.Cascade);

            builder.HasMany(x => x.OrderProducts).WithOne(y => y.Product)
                .HasForeignKey(x => x.ProductId).OnDelete(DeleteBehavior.Cascade);

            builder.HasMany(x => x.CartItems).WithOne(y => y.Product)
                .HasForeignKey(x => x.ProductId).OnDelete(DeleteBehavior.Cascade);

        }
    }
}
