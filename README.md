# Teste de Seleção para Web Form

## Do Banco de Dados
- Gere um banco de dados com o arquivo **script.sql** na raiz do projeto;
- O banco tem 4 tabelas (Pessoa, Produto, Pedido de Venda e Item de Pedido de Venda);
- O sistema deve seguir a estrutura citada

## Especificação de alguns campos das tabelas:
- Pessoa:
  - Status: **V** (Vendedor) ou **C** (Cliente)
- Produto:
  - ValorBase: É o preço unitário do produto
- PedidoVenda:
  - Status: **A** (Aberto), **L** (Liberado), **F** (Finalizado), **C** (Cancelado)
  - DataLiberacao: Preenchido com data e hora atual quando o pedido for liberado
  - DataEntrega: Preenchido com a data e hora atual quando o pedido for Finalizado

## Atividade
### Backlog: (Implemente isto)
- Na tela de Lista (Venda/VendaLista.aspx) deverá ser adicionada um link executar a ação de liberação do pedido.
- Na tela de Cadastro (Venda/PedidoVenda.aspx): Deverá ser implementado o CRUD, lembrando que deverá adicionar e remover produtos no item 
- Associar botões as suas respectivas ações (Aberto, Liberado, Finalizado, Cancelado)
- Adicionar o ValorBase do produto ao ValorUnitário no item do pedido
- Exibir uma lista de produtos ao abrir a tela de adicionar item
- Exibir uma lista de clientes (tem 2 campos neste espaço, mas pode substituir por um selectlist)
- Exibir uma lista de clientes (tem 2 campos neste espaço, mas pode substituir por um selectlist)
## Regras:
- Não utilizar ORM (entityframework por exemplo)
- As telas devem ser apenas complementadas, não substituir por tela nova
- Utilizar recursos disponíveis no WebForms
- Utilizar a biblioteca "DAO" para executar os acessos a dados (Lá tem o exemplo do pedido de venda.
- Ao finalizar envie um email com anexo ou disponibiliza o link do projeto zipado para que possamos baixar e analisa-los

**Boa sorte!**
