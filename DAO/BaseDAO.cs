using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public abstract class BaseDAO
    {
        protected SqlConnection Connection { get; private set; } = new SqlConnection(ConfigurationManager.ConnectionStrings["conTeste"].ConnectionString);
    }
}
