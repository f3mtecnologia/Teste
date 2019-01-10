using DAO.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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

        public PedidoVenda Obter(int isn)
        {
            string sql = @"select * from PedidoVenda pdv where Id = @Id";


            SqlCommand sqlCommand = new SqlCommand(sql, Connection);
            SqlParameter param = sqlCommand.CreateParameter();
            param.ParameterName = "@Id";
            param.DbType = System.Data.DbType.Int32;
            param.Value = isn;

            sqlCommand.Parameters.Add(param);

            SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);

            DataSet pdv = new DataSet();
            adapter.Fill(pdv, "Customers");

            return Montar(pdv.Tables[0].Rows[0]);
        }

        public PedidoVenda ObterPedido(int isn)
        {
            string sql = @"select * from PedidoVenda pdv where Id = @Id";


            SqlCommand sqlCommand = new SqlCommand(sql, Connection);
            SqlParameter param = sqlCommand.CreateParameter();
            param.ParameterName = "@Id";
            param.DbType = System.Data.DbType.Int32;
            param.Value = isn;

            sqlCommand.Parameters.Add(param);

            SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);

            DataSet pdv = new DataSet();
            adapter.Fill(pdv, "Customers");

            return Montar(pdv.Tables[0].Rows[0]);
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

        public void SalvarPedido(Dictionary<string, object> valores)
        {
            Connection.Open();
            string sql = "INSERT INTO dbo.PedidoVenda(Criacao, Modificacao, ClienteId, VendedorId, Status, DataLiberacao, TotalProdutos, QuantidadeItens, ValorDesconto, ValorAcrescimo, DataEntrega)" +
            "VALUES((getdate()), (getdate()), @ClienteId, @VendedorId, @Status, '', ((0)), ((0)), ((0)), ((0)), ''); ";

            SqlCommand Salvar = new SqlCommand(sql, Connection);
            Salvar.Parameters.Add("@ClienteId", SqlDbType.Int, 32, "ClienteId");
            Salvar.Parameters.Add("@VendedorId", SqlDbType.Int, 32, "VendedorId");
            Salvar.Parameters.Add("@Status", SqlDbType.Char, 1, "Status");

            Salvar.Parameters["@ClienteId"].Value = int.Parse(valores["idCliente"].ToString());
            Salvar.Parameters["@VendedorId"].Value = int.Parse(valores["idVendedor"].ToString());
            Salvar.Parameters["@Status"].Value = valores["Status"].ToString();

            Salvar.ExecuteNonQuery();
        }

        public void Editar(Dictionary<string, object> valores)
        {
            Connection.Open();
            string sql = "UPDATE PedidoVenda SET Modificacao = (getdate()), ClienteId = @ClienteId, VendedorId = @VendedorId, Status = @Status WHERE Id = @Id";

            SqlCommand Editar = new SqlCommand(sql, Connection);

            Editar.Parameters.Add("@Id", SqlDbType.Int, 32, "Id");
            Editar.Parameters.Add("@ClienteId", SqlDbType.Int, 32, "ClienteId");
            Editar.Parameters.Add("@VendedorId", SqlDbType.Int, 32, "VendedorId");
            Editar.Parameters.Add("@Status", SqlDbType.Char, 1, "Status");

            Editar.Parameters["@Id"].Value = int.Parse(valores["Id"].ToString());
            Editar.Parameters["@ClienteId"].Value = int.Parse(valores["idCliente"].ToString());
            Editar.Parameters["@VendedorId"].Value = int.Parse(valores["idVendedor"].ToString());
            Editar.Parameters["@Status"].Value = valores["Status"].ToString();

            Editar.ExecuteNonQuery();
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

        public void SalvarPedidoItem(Dictionary<string, object> valores)
        {
            Connection.Open();
            string sql = "INSERT INTO dbo.PedidoVenda(Criacao, Modificacao, ClienteId, VendedorId, Status, DataLiberacao, TotalProdutos, QuantidadeItens, ValorDesconto, ValorAcrescimo, DataEntrega)" +
            "VALUES((getdate()), (getdate()), @ClienteId, @VendedorId, @Status, '', ((0)), ((0)), ((0)), ((0)), ''); ";

            SqlCommand Salvar = new SqlCommand(sql, Connection);
            Salvar.Parameters.Add("@ClienteId", SqlDbType.Int, 32, "ClienteId");
            Salvar.Parameters.Add("@VendedorId", SqlDbType.Int, 32, "VendedorId");
            Salvar.Parameters.Add("@Status", SqlDbType.Char, 1, "Status");

            Salvar.Parameters["@ClienteId"].Value = int.Parse(valores["idCliente"].ToString());
            Salvar.Parameters["@VendedorId"].Value = int.Parse(valores["idVendedor"].ToString());
            Salvar.Parameters["@Status"].Value = valores["Status"].ToString();

            Salvar.ExecuteNonQuery();
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
            p.Nome = pdv.Tables[0].Rows[0][3].ToString();
            p.Codigo = pdv.Tables[0].Rows[0][4].ToString();
            p.PrecoBase = Convert.ToDecimal(pdv.Tables[0].Rows[0][5].ToString());
            p.GrupoProduto = pdv.Tables[0].Rows[0][5].ToString();

            return p;
        }

        public void SalvarProdutoItem(Dictionary<string, object> valores)
        {
            Connection.Open();
            string sql = "INSERT INTO PedidoVendaItem(PedidoVendaId,Criacao, Modificacao, ProdutoId, Quantidade, ValorUnitario, ValorDesconto, ValorAcrescimo, TipoPreco) VALUES(@PedidoVendaId, (getdate()), (getdate()), @ProdutoId, @Quantidade, @ValorUnitario, ((0)), ((0)), ('N'))";

            SqlCommand Salvar = new SqlCommand(sql, Connection);
            Salvar.Parameters.Add("@PedidoVendaId", SqlDbType.Int, 32, "PedidoVendaId");
            Salvar.Parameters.Add("@ProdutoId", SqlDbType.Int, 32, "ProdutoId");
            Salvar.Parameters.Add("@Quantidade", SqlDbType.Int, 32, "Quantidade");
            Salvar.Parameters.Add("@ValorUnitario", SqlDbType.Money, 32, "ValorUnitario");


            Salvar.Parameters["@PedidoVendaId"].Value = int.Parse(valores["PedidoVendaId"].ToString());
            Salvar.Parameters["@ProdutoId"].Value = int.Parse(valores["ProdutoId"].ToString());
            Salvar.Parameters["@Quantidade"].Value = int.Parse(valores["Quantidade"].ToString());
           Salvar.Parameters["@ValorUnitario"].Value = Convert.ToDouble(valores["ValorUnitario"].ToString());


            Salvar.ExecuteNonQuery();
        }

        public void DeletePedidoItem(Dictionary<string,object> valores)
        {
            Connection.Open();
            string sql = "DELETE FROM PedidoVendaItem WHERE ProdutoId=@ProdutoId AND PedidoVendaId=@PedidoVendaId";

            SqlCommand Delete = new SqlCommand(sql, Connection);
            Delete.Parameters.Add("@PedidoVendaId", SqlDbType.Int, 32, "PedidoVendaId");
            Delete.Parameters.Add("@ProdutoId", SqlDbType.Int, 32, "ProdutoId");

            Delete.Parameters["@PedidoVendaId"].Value = int.Parse(valores["PedidoVendaId"].ToString());
            Delete.Parameters["@ProdutoId"].Value = int.Parse(valores["ProdutoId"].ToString());

            Delete.ExecuteNonQuery();
        }

        public void DeletePedido(int id)
        {
            Connection.Open();
            string sql = "DELETE FROM PedidoVenda WHERE Id = @Id";

            SqlCommand Delete = new SqlCommand(sql, Connection);
            Delete.Parameters.Add("@Id", SqlDbType.Int, 32, "PedidoVendaId");

            Delete.Parameters["@Id"].Value = id;

            Delete.ExecuteNonQuery();
        }
    }
}
