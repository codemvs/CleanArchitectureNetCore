namespace CleanArchitecture.Application.Excepions
{
    public class BadRequestExceptions : ApplicationException
    {
        public BadRequestExceptions(string message): base(message)
        {
        }
    }
}
