using ASP.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.DataAccess.Configurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.Property(x => x.Username).IsRequired();
            builder.Property(x => x.Email).IsRequired();
            builder.Property(x => x.Password).IsRequired();
            builder.Property(x => x.FirstName).IsRequired();
            builder.Property(x => x.LastName).IsRequired();
            builder.HasIndex(x => x.Username).IsUnique();
            builder.HasIndex(x => x.Email).IsUnique();

            builder.HasMany(x => x.Comments).WithOne(y => y.User)
                .HasForeignKey(x => x.UserId).OnDelete(DeleteBehavior.Cascade);

            builder.HasMany(x => x.Orders).WithOne(y => y.User)
                .HasForeignKey(x => x.UserId).OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.UserUseCases).WithOne(y => y.User)
                .HasForeignKey(x => x.UserId).OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(x => x.CartItems).WithOne(y => y.User)
                .HasForeignKey(x => x.UserId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
