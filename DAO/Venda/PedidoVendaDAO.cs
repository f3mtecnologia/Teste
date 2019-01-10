using DAO.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DAO.Venda
{
    public class PedidoVendaDAO : BaseDAO
    {

        public DataTable Listar(string busca)
        {
            string sql = @"select pdv.Id PedidoId , cli.Nome Cliente, ven.Nome Vendedor, pdv.TotalProdutos ValorTotal, pdv.Status, pdv.DataEntrega
from
			PedidoVenda			pdv
	join	Pessoa				cli	on	pdv.ClienteId = cli.Id
	join	Pessoa				ven	on	pdv.VendedorId = ven.Id
where
	cli.Nome like '%' + @Busca + '%' or ven.Nome like '%' + @Busca + '%'";

            SqlCommand sqlCommand = new SqlCommand(sql, Connection);
            SqlParameter param = sqlCommand.CreateParameter();
            param.ParameterName = "@Busca";
            param.DbType = System.Data.DbType.String;
            param.Value = busca;

            sqlCommand.Parameters.Add(param);

            SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);

            DataSet pdv = new DataSet();
            adapter.Fill(pdv, "Customers");

            return pdv.Tables[0];

        }

        private PedidoVenda Montar(DataRow dataRow)
        {
            var result = new PedidoVenda
            {
                Id = Convert.ToInt32(dataRow["Id"]),
                Criacao = Convert.ToDateTime(dataRow["Criacao"]),
                Modificacao = Convert.ToDateTime(dataRow["Modificacao"]),
                ClienteId = Convert.ToInt32(dataRow["ClienteId"]),
                VendedorId = Convert.ToInt32(dataRow["VendedorId"]),
                Status = dataRow["Status"].ToString(),
                DataLiberacao = dataRow["DataLiberacao"] == DBNull.Value ? null : (DateTime?)Convert.ToDateTime(dataRow["DataLiberacao"]),
                TotalProdutos = Convert.ToDecimal(dataRow["TotalProdutos"]),
                QuantidadeItens = Convert.ToInt32(dataRow["QuantidadeItens"]),
                ValorDesconto = Convert.ToDecimal(dataRow["ValorDesconto"]),
                ValorAcrescimo = Convert.ToDecimal(dataRow["ValorAcrescimo"]),
                DataEntrega = dataRow["DataEntrega"] == DBNull.Value ? null : (DateTime?)Convert.ToDateTime(dataRow["DataEntrega"])
            };

            return result;
        }

        public void Update(Dictionary<string, object> valores)
        {
            Connection.Open();
            string sql = @"UPDATE dbo.PedidoVenda SET Status = @Status, DataLiberacao = @DataLiberacao WHERE Id = @Id";
            SqlCommand Update = new SqlCommand(sql, Connection);

            Update.Parameters.Add("@Id", SqlDbType.Int, 32, "Id");
            Update.Parameters.Add("@Status", SqlDbType.Char, 1, "Status");
            Update.Parameters.Add("@DataLiberacao", SqlDbType.DateTime, 8, "DataLiberacao");


            Update.Parameters["@Id"].Value = int.Parse(valores["Id"].ToString());
            Update.Parameters["@Status"].Value = valores["Status"].ToString();
            Update.Parameters["@DataLiberacao"].Value = Convert.ToDateTime(valores["DataLiberacao"].ToString());

            Update.ExecuteNonQuery();
        }

        public List<Pessoa> ListPessoa(string tipo)
        {
            string sql = @"select Id, Nome from Pessoa where Tipo = @Tipo";


            SqlCommand sqlCommand = new SqlCommand(sql, Connection);
            SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);

            sqlCommand.Parameters.Add("@Tipo", SqlDbType.Char, 1, "Tipo");
            sqlCommand.Parameters["@Tipo"].Value = tipo;

            DataSet pdv = new DataSet();
            adapter.Fill(pdv, "Customers");
            List<Pessoa> listVendedor = new List<Pessoa>();

            for (int i = 0; i < pdv.Tables[0].Rows.Count; i++)
            {
                Pessoa p = new Pessoa();
                p.Id = int.Parse(pdv.Tables[0].Rows[i][0].ToString());
                p.Nome = pdv.Tables[0].Rows[i][1].ToString();
                listVendedor.Add(p);
            }
            return listVendedor;
        }

        public DataTable ListPedidoItem(int idPedido)
        {
            string sql = @"select * from dbo.PedidoVendaItem where PedidoVendaId = @PedidoVendaId";


            SqlCommand sqlCommand = new SqlCommand(sql, Connection);
            SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);

            sqlCommand.Parameters.Add("@PedidoVendaId", SqlDbType.Int, 32, "PedidoVendaId");
            sqlCommand.Parameters["@PedidoVendaId"].Value = idPedido;

            DataSet pdv = new DataSet();
            adapter.Fill(pdv, "Customers");

            return pdv.Tables[0];
        }

        public DataTable ListProduto()
        {
            string sql = @"select * from dbo.Produto";


            SqlCommand sqlCommand = new SqlCommand(sql, Connection);
            SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);

            DataSet pdv = new DataSet();
            adapter.Fill(pdv, "Customers");

            return pdv.Tables[0];
        }

        public Produto ListProduto(string Produto)
        {
            string sql = @"select * from dbo.Produto where Nome = @Nome ";


            SqlCommand sqlCommand = new SqlCommand(sql, Connection);
            SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);

            sqlCommand.Parameters.Add("@Nome", SqlDbType.VarChar, 50, "Nome");
            sqlCommand.Parameters["@Nome"].Value = Produto;

            DataSet pdv = new DataSet();
            adapter.Fill(pdv, "Customers");

            Produto p = new Produto();
            p.Id = int.Parse(pdv.Tables[0].Rows[0][0].ToString());
            p.Criacao = Convert.ToDateTime(pdv.Tables[0].Rows[0][1].ToString());
            p.Modificacao = Convert.ToDateTime(pdv.Tables[0].Rows[0][2].ToString());

            return p;
        }

    }
}
