using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO.Model
{
    public class Produto
    {
        public int Id { get; set; }
        public DateTime Criacao { get; set; }
        public DateTime Modificacao { get; set; }
        public string Nome { get; set; }
        public string Codigo { get; set; }
        public decimal PrecoBase { get; set; }
        public string GrupoProduto { get; set; }
    }
}
