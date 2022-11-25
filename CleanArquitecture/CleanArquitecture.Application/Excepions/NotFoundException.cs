namespace CleanArchitecture.Application.Excepions
{
    public  class NotFoundException: ApplicationException
    {
        public NotFoundException(string name, object key): base($"Entity \"{name}\" ({key}) no fue encontrado")
        {

        }
    }
}
