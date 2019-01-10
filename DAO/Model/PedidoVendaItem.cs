using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO.Model
{
    public class PedidoVendaItem
    {
        //[Id] INT IDENTITY(1, 1) NOT NULL,
        public int Id { get; set; }
        //[PedidoVendaId]  INT NOT NULL,
        public int PedidoVendaId { get; set; }
        //[Criacao]         DATETIME DEFAULT(getdate()) NOT NULL,
        public DateTime Criacao { get; set; }
        //[Modificacao]     DATETIME DEFAULT(getdate()) NOT NULL,
        public DateTime Modificacao { get; set; }
        //[ProdutoId]      INT NOT NULL,
        public int ProdutoId { get; set; }
        //[Quantidade] INT NOT NULL,
        public int Quantidade { get; set; }
        //[ValorUnitario] MONEY NOT NULL,
        public decimal ValorUnitario { get; set; }
        //[ValorDesconto] MONEY DEFAULT((0)) NOT NULL,
        public decimal ValorDesconto { get; set; }
        //[ValorAcrescimo] MONEY DEFAULT((0)) NOT NULL,
        public decimal ValorAcrescimo { get; set; }
        //[TipoPreco]      CHAR(1) DEFAULT('N') NOT NULL
        public string TipoPreco { get; set; }

        public PedidoVenda PedidoVenda { get; set; }
    }
}
