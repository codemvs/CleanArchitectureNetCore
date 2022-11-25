using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CleanArchitecture.Identity.Configurations
{
    public class UserRoleConfiguration : IEntityTypeConfiguration<IdentityUserRole<string>>
    {

        public void Configure(EntityTypeBuilder<IdentityUserRole<string>> builder)
        {
            builder.HasData(new IdentityUserRole<string>
            {
                RoleId = "1566e398-a728-4dc0-9c53-9d1a470e59f7",
                UserId = "96b7811b-b6fa-4a09-b593-3a8d28ab4993"
            },
            new IdentityUserRole<string>
            {
                RoleId = "aa0d1a91-188c-49b6-92c6-e9526ea9255c",
                UserId = "67911260-a222-4d97-8942-dbe864a79009"
            }
            );
        }
    }
}
