using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DAWEB2.Startup))]
namespace DAWEB2
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
