using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO.Model
{
    public class PedidoVenda
    {
        //[Id] INT IDENTITY(1, 1) NOT NULL,
        public int Id { get; set; }
        //[Criacao]         DATETIME DEFAULT(getdate()) NOT NULL,
        public DateTime Criacao { get; set; }
        //[Modificacao]     DATETIME DEFAULT(getdate()) NOT NULL,
        public DateTime Modificacao { get; set; }
        //[ClienteId]       INT NOT NULL,
        public int ClienteId { get; set; }
        //[VendedorId] INT NOT NULL,
        public int VendedorId { get; set; }
        //[Status] CHAR(1) DEFAULT((0)) NOT NULL,
        public string Status { get; set; }
        //[DataLiberacao]   DATETIME NULL,
        public DateTime? DataLiberacao { get; set; }
        //[TotalProdutos]   MONEY DEFAULT((0)) NOT NULL,
        public decimal TotalProdutos { get; set; }
        //[QuantidadeItens] INT DEFAULT((0)) NOT NULL,
        public int QuantidadeItens { get; set; }
        //[ValorDesconto]   MONEY DEFAULT((0)) NOT NULL,
        public decimal ValorDesconto { get; set; }
        //[ValorAcrescimo]  MONEY DEFAULT((0)) NOT NULL,
        public decimal ValorAcrescimo { get; set; }
        //[DataEntrega]     DATETIME NULL,
        public DateTime? DataEntrega { get; set; }

        public Pessoa Cliente { get; set; }
        public Pessoa Vendedor { get; set; }
        public List<PedidoVendaItem> Itens { get; set; }
    }
}
