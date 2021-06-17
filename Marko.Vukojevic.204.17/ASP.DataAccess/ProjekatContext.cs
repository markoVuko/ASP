using ASP.DataAccess.Configurations;
using ASP.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace ASP.DataAccess
{
    public class ProjekatContext : DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new OrderConfiguration());
            modelBuilder.ApplyConfiguration(new ProductConfiguration());
            modelBuilder.ApplyConfiguration(new OrderProductConfiguration());
            modelBuilder.ApplyConfiguration(new CommentConfiguration());
            modelBuilder.ApplyConfiguration(new RoleConfiguration());
            modelBuilder.ApplyConfiguration(new CategoryConfiguration());
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.ApplyConfiguration(new CartItemConfiguration());
        }
        protected override void OnConfiguring(DbContextOptionsBuilder dcoBuilder)
        {
            dcoBuilder.UseSqlServer(@"Data Source=.\SQLEXPRESS;Initial Catalog=ASP.204.17;Integrated Security=True");
            base.OnConfiguring(dcoBuilder);
        }
        public DbSet<User> Users { get; set; }
        public DbSet<CartItem> CartItems { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }
        public DbSet<OrderProduct> OrderProducts { get; set; }
    }
}
