using Microsoft.Extensions.Configuration;
using System;
using System.IO;

namespace DAL
{
    public static class ConfigManager
    {
        private static IConfigurationRoot _config;

        static ConfigManager()
        {
            _config = new ConfigurationBuilder()
                .SetBasePath(AppContext.BaseDirectory)
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .Build();
        }

        public static string GetConnectionString(string name)
        {
            return _config.GetConnectionString(name);
        }
    }
}