using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(OUD_Perfume_Project.Startup))]
namespace OUD_Perfume_Project
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
