using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CleanArchitecture.Identity.Configurations
{
    internal class RoleConfiguration : IEntityTypeConfiguration<IdentityRole>
    {
        public void Configure(EntityTypeBuilder<IdentityRole> builder)
        {
            builder.HasData(
                new IdentityRole()
                {
                    Id = "1566e398-a728-4dc0-9c53-9d1a470e59f7",
                    Name = "Administrator",
                    NormalizedName = "ADMINISTRATOR"
                },
                new IdentityRole()
                {
                    Id = "aa0d1a91-188c-49b6-92c6-e9526ea9255c",
                    Name = "Operator",
                    NormalizedName = "OPERATOR"
                }
                );
        }
    }
}
