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
    public partial class VendaLista : System.Web.UI.Page
    {
        PedidoVendaDAO pvDao = new PedidoVendaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            dgBusca.DataSource = pvDao.Listar(busca.Text);
            dgBusca.DataBind();
        }

        protected void AbrirVenda_Click(object sender, EventArgs e)
        {
            Response.Redirect($"~/Venda/PedidoVenda.aspx?id={dgBusca.Items[Convert.ToInt32(((LinkButton)sender).CommandArgument)].Cells[3].Text}");
        }

        protected void Liberarpedido_Click(object sender, EventArgs e)
        {
            var id = dgBusca.Items[Convert.ToInt32(((LinkButton)sender).CommandArgument)].Cells[3].Text;
            Dictionary<string, object> obj = new Dictionary<string, object>();
            obj.Add("Id", id);
            obj.Add("Status", "L");
            obj.Add("DataLiberacao", DateTime.Now);
            pvDao.Update(obj);
        }

        protected void Incluir_Click(object sender, EventArgs e)
        {
            Response.Redirect($"~/Venda/PedidoVenda.aspx?");
        }

    }
}