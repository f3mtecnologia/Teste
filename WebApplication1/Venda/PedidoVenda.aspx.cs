using DAO.Model;
using DAO.Venda;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Venda
{
    public partial class PedidoVenda : System.Web.UI.Page
    {
        PedidoVendaDAO pvDao = new PedidoVendaDAO();
        DAO.Model.PedidoVenda pv = new DAO.Model.PedidoVenda();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PopularDdlVendedor();
                PopularDdlCliente();
                if (!String.IsNullOrEmpty(Request.QueryString["Id"]))
                {
                    SelecionarPedido(Convert.ToInt32(Request.QueryString["Id"]));
                    txtPedidoID.Text = Request.QueryString["Id"].ToString();
                }
            }
            ValorTotal.Text = pv.TotalProdutos.ToString("0.00");
            ValorDesconto.Text = pv.ValorDesconto.ToString("0.00");
            ValorAcrescimo.Text = pv.ValorAcrescimo.ToString("0.00");
            QuantidadeItem.Text = pv.QuantidadeItens.ToString("0.00");
        }

        protected void AbrirVenda_Click(object sender, EventArgs e)
        {           

        }

        protected void SelecionarPedido(int id)
        {
            var pedido = pvDao.Obter(id);
            Id.Text = id.ToString();
            DataCriacao.Text = pedido.Criacao.ToString();
            DataModificacao.Text = pedido.Modificacao.ToString();
            Status.Text = pedido.Status.ToString();
            VendedorNome.SelectedIndex = pedido.VendedorId;
            ClienteNome.SelectedIndex = pedido.ClienteId;

            dgBusca.DataSource = pvDao.ListPedidoItem(id);
            dgBusca.DataBind();

            PopularDatalist();
        }


        protected void Salvar_Click(object sender, EventArgs e)
        {
            if (int.Parse(Id.Text) == 0)
            {
                Dictionary<string, object> obj = new Dictionary<string, object>();
                obj.Add("idCliente", ClienteNome.SelectedValue);
                obj.Add("idVendedor", VendedorNome.SelectedValue);
                obj.Add("Status", "A");
                pvDao.SalvarPedido(obj);
            }
            else
            {
                Dictionary<string, object> obj = new Dictionary<string, object>();
                obj.Add("Id", Id.Text);
                obj.Add("idCliente", ClienteNome.SelectedValue);
                obj.Add("idVendedor", VendedorNome.SelectedValue);
                obj.Add("Status", Status.Text);                
                pvDao.Editar(obj);
            }            
        }

        private void PopularDdlVendedor()
        {
            VendedorNome.DataSource = pvDao.ListPessoa("V");
            VendedorNome.DataValueField = "id";
            VendedorNome.DataTextField = "nome";
            VendedorNome.DataBind();
            VendedorNome.Items.Insert(0, "Selecione um Vendedor");
        }

        private void PopularDdlCliente()
        {
            ClienteNome.DataSource = pvDao.ListPessoa("C");
            ClienteNome.DataValueField = "id";
            ClienteNome.DataTextField = "nome";
            ClienteNome.DataBind();
            ClienteNome.Items.Insert(0, "Selecione um Cliente");
        }

        protected void AdicionarItem_Click(object sender, EventArgs e)
        {
            Dictionary<string, object> obj = new Dictionary<string, object>();
            obj.Add("PedidoVendaId", Convert.ToInt32(txtPedidoID.Text));
            obj.Add("ProdutoId", Convert.ToInt32(txtProdutoID.Text));
            obj.Add("Quantidade", Convert.ToInt32(AddQuantidade.Text));
            obj.Add("ValorUnitario", Convert.ToDouble(ValorUnitario.Text));

            pvDao.SalvarProdutoItem(obj);

            Response.Redirect($"~/Venda/PedidoVenda.aspx?id={txtPedidoID.Text}");
        }

        protected void PopularDatalist()
        {
            DataTable dt = pvDao.ListProduto();
            var value = new System.Text.StringBuilder();
            for (int i = 0; i < dt.Rows.Count; i++)
                value.Append(String.Format("<option value='{0}'>", dt.Rows[i][3]));
            produto.InnerHtml = value.ToString();
        }

        protected void txtproduto_TextChanged(object sender, EventArgs e)
        {
           Produto p = pvDao.ListProduto(txtproduto.Text);
            ValorUnitario.Text = p.PrecoBase.ToString("0.##");
            txtProdutoID.Text = p.Id.ToString();
            ScriptManager.RegisterStartupScript(this, GetType(), "LaucherServerSide", "$(function() {fucaoExibirModal();})", true);
        }

        protected void AddQuantidade_TextChanged(object sender, EventArgs e)
        {
            ValorItemTotal.Text = (Convert.ToDecimal(AddQuantidade.Text) * Convert.ToDecimal(ValorUnitario.Text)).ToString();
            ScriptManager.RegisterStartupScript(this, GetType(), "LaucherServerSide", "$(function() {fucaoExibirModal();})", true);
        }

        protected void dgBusca_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                var PedidoVendaId = e.Item.Cells[2].Text;
                var ProdutoId = e.Item.Cells[3].Text;

                Dictionary<string, object> obj = new Dictionary<string, object>();
                obj.Add("PedidoVendaId", int.Parse(PedidoVendaId));
                obj.Add("ProdutoId", int.Parse(ProdutoId));

                pvDao.DeletePedidoItem(obj);
                Response.Redirect($"~/Venda/PedidoVenda.aspx?id={txtPedidoID.Text}");
            }
        }
        protected void Liberar_Click(object sender, EventArgs e)
        {
            var id = Id.Text;
            Dictionary<string, object> obj = new Dictionary<string, object>();
            obj.Add("Id", id);
            obj.Add("Status", "L");
            obj.Add("DataLiberacao", DateTime.Now);
            pvDao.Update(obj);
            Response.Redirect($"~/Venda/PedidoVenda.aspx?id={txtPedidoID.Text}");
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            var id = Id.Text;
            Dictionary<string, object> obj = new Dictionary<string, object>();
            obj.Add("Id", id);
            obj.Add("Status", "C");
            obj.Add("DataLiberacao", DateTime.Now);
            pvDao.Update(obj);
            Response.Redirect($"~/Venda/PedidoVenda.aspx?id={txtPedidoID.Text}");
        }
    }
}