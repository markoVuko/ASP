using Microsoft.EntityFrameworkCore.Migrations;

namespace ASP.DataAccess.Migrations
{
    public partial class koncano : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_orderProducts_Orders_OrderId",
                table: "orderProducts");

            migrationBuilder.DropForeignKey(
                name: "FK_orderProducts_Products_ProductId",
                table: "orderProducts");

            migrationBuilder.DropPrimaryKey(
                name: "PK_orderProducts",
                table: "orderProducts");

            migrationBuilder.RenameTable(
                name: "orderProducts",
                newName: "OrderProducts");

            migrationBuilder.RenameIndex(
                name: "IX_orderProducts_ProductId",
                table: "OrderProducts",
                newName: "IX_OrderProducts_ProductId");

            migrationBuilder.RenameIndex(
                name: "IX_orderProducts_OrderId",
                table: "OrderProducts",
                newName: "IX_OrderProducts_OrderId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_OrderProducts",
                table: "OrderProducts",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_OrderProducts_Orders_OrderId",
                table: "OrderProducts",
                column: "OrderId",
                principalTable: "Orders",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_OrderProducts_Products_ProductId",
                table: "OrderProducts",
                column: "ProductId",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_OrderProducts_Orders_OrderId",
                table: "OrderProducts");

            migrationBuilder.DropForeignKey(
                name: "FK_OrderProducts_Products_ProductId",
                table: "OrderProducts");

            migrationBuilder.DropPrimaryKey(
                name: "PK_OrderProducts",
                table: "OrderProducts");

            migrationBuilder.RenameTable(
                name: "OrderProducts",
                newName: "orderProducts");

            migrationBuilder.RenameIndex(
                name: "IX_OrderProducts_ProductId",
                table: "orderProducts",
                newName: "IX_orderProducts_ProductId");

            migrationBuilder.RenameIndex(
                name: "IX_OrderProducts_OrderId",
                table: "orderProducts",
                newName: "IX_orderProducts_OrderId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_orderProducts",
                table: "orderProducts",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_orderProducts_Orders_OrderId",
                table: "orderProducts",
                column: "OrderId",
                principalTable: "Orders",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_orderProducts_Products_ProductId",
                table: "orderProducts",
                column: "ProductId",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
