using System;

namespace CleanArchitecture.Domain.Common
{
    // Se declara la clase de tipo abstracta para que no permita instancias o creacion de objeto
    public abstract class BaseDomainModel
    {
        public int Id { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? LastModifiedDate { get; set; }
        public string? LastModifiedBy { get; set; }
    }
}
