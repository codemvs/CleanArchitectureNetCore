using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CleanArchitecture.Identity.Migrations
{
    public partial class GenerateTables2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "1566e398-a728-4dc0-9c53-9d1a470e59f7",
                column: "ConcurrencyStamp",
                value: "f5f7ae6f-b92e-41ee-bf82-3dbb777fd36d");

            migrationBuilder.UpdateData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "aa0d1a91-188c-49b6-92c6-e9526ea9255c",
                column: "ConcurrencyStamp",
                value: "b2b8c060-2dd2-4773-b4fc-1b6cc775f7d8");

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "67911260-a222-4d97-8942-dbe864a79009",
                columns: new[] { "ConcurrencyStamp", "NormalizedEmail", "PasswordHash", "SecurityStamp" },
                values: new object[] { "d13007e7-287d-40e2-8684-14055a8f795b", "test@localhost.com", "AQAAAAEAACcQAAAAEJSu94bWHZcSPUVNrIzSATx0UP8XlJF01vBMjV7MgF95HFgzmVbc3bYbNX2w4wegvA==", "9e7e5a24-c4e4-4f70-ba11-ae326ba21e48" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "96b7811b-b6fa-4a09-b593-3a8d28ab4993",
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "a849c0f1-328a-4deb-a7ec-bdec5677881c", "AQAAAAEAACcQAAAAEE4jzgNprtlCtzE5zaml9g15AOJm9mqZ75A0NOGD5wS3GFxgByUt6JwvT2bY0QSRIQ==", "11a984ba-5311-4e6b-a71f-f8d2e820aacb" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "1566e398-a728-4dc0-9c53-9d1a470e59f7",
                column: "ConcurrencyStamp",
                value: "6d891233-ab5d-44b7-86d2-bb585a6d49aa");

            migrationBuilder.UpdateData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "aa0d1a91-188c-49b6-92c6-e9526ea9255c",
                column: "ConcurrencyStamp",
                value: "71b7ca82-d45f-49cb-8ea0-f25311280950");

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "67911260-a222-4d97-8942-dbe864a79009",
                columns: new[] { "ConcurrencyStamp", "NormalizedEmail", "PasswordHash", "SecurityStamp" },
                values: new object[] { "ed59b5d1-bbbf-4ed2-8a30-70affedce87b", "admin@localhost.com", "AQAAAAEAACcQAAAAEGRy/8K/TuBMaOHcbHJpLTYECzyoo1F6+6gQJoENo0FEV3BRmUHPP4vGhMnZXHnXlg==", "6b1b2da1-a90c-4ade-82f1-dd494214ab8b" });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "96b7811b-b6fa-4a09-b593-3a8d28ab4993",
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "17be88bd-b6bd-4e7d-8fb3-4f2d3775f653", "AQAAAAEAACcQAAAAEKwoPHOSJ/PJHV176PMfJElA6A2mvZyPdQ8V+hqPflEuZw080RqnitvofZBgZ8kLwg==", "ec365b7e-e8cf-48d0-87da-e4eaa8ed77b5" });
        }
    }
}
