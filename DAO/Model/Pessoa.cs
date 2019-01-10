using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO.Model
{
    public class Pessoa
    {
        //[Id] INT IDENTITY(1, 1) NOT NULL,
        public int Id { get; set; }
        //[Criacao]         DATETIME DEFAULT(getdate()) NOT NULL,
        public DateTime Criacao { get; set; }
        //[Modificacao]     DATETIME DEFAULT(getdate()) NOT NULL,
        public DateTime Modificacao { get; set; }
        //[Nome]           VARCHAR(50) NOT NULL,
        public string Nome { get; set; }
        //[CPF]            VARCHAR(11) NOT NULL,
        public string CPF { get; set; }
        //[Grupo]          VARCHAR(30) NOT NULL,
        public string Grupo { get; set; }
        //[DataNascimento] DATETIME NOT NULL,
        public DateTime DataNascimento { get; set; }
        //[Tipo] CHAR(1)     NOT NULL,
        public string Tipo { get; set; }
        //[Ativo]          BIT DEFAULT((1)) NOT NULL
        public bool Ativo { get; set; }
    }
}
