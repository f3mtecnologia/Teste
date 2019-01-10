<%@ Page Title="" Language="C#" MasterPageFile="~/ASCX/Site1.Master" AutoEventWireup="true" CodeBehind="PedidoVenda.aspx.cs" Inherits="WebApplication1.Venda.PedidoVenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-4">
        <div class="row">
            <div class="col">
                <h2 class="display-4 mb-4">Pedido de Venda</h2>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        Pedido de Venda
                    </div>
                    <div class="card-body container-fluid">
                        <div class="row">
                            <div class="form-group col col-lg-2 ">
                                <label>Código</label>
                                <asp:TextBox runat="server" ID="Id" CssClass="form-control" ReadOnly="true" />
                                <asp:TextBox runat="server" ID="txtPedidoID" CssClass="form-control" ReadOnly="true" Visible="false"/>
                            </div>
                            <div class="form-group col">
                                <label>Data Criação</label>
                                <asp:TextBox runat="server" ID="DataCriacao" CssClass="form-control" ReadOnly="true" />
                            </div>
                            <div class="form-group col">
                                <label>Última Modificação</label>
                                <asp:TextBox runat="server" ID="DataModificacao" CssClass="form-control" ReadOnly="true" />
                            </div>
                            <div class="form-group col">
                                <label>Status</label>
                                <asp:TextBox runat="server" ID="Status" CssClass="form-control" ReadOnly="true"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col">
                                <label>Cliente</label>
                                <div class="container-fluid">
                                    <div class="row">
                                        <asp:DropDownList runat="server" ID="ClienteNome" CssClass="form-control col" AutoPostBack="true" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col">
                                <label>Vendedor</label>
                                <div class="container-fluid">
                                    <div class="row">
                                        <asp:DropDownList runat="server" ID="VendedorNome" CssClass="form-control col" AutoPostBack="true" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col">
                                <label>Qnt. Itens</label>
                                <asp:TextBox runat="server" ID="QuantidadeItem" CssClass="form-control" />
                            </div>
                            <div class="form-group col">
                                <label>Valor Total Itens</label>
                                <asp:TextBox runat="server" ID="ValorTotal" CssClass="form-control" />
                            </div>
                            <div class="form-group col">
                                <label>Valor Desc.</label>
                                <asp:TextBox runat="server" ID="ValorDesconto" CssClass="form-control" />
                            </div>
                            <div class="form-group col">
                                <label>Valor Acresc.</label>
                                <asp:TextBox runat="server" ID="ValorAcrescimo" CssClass="form-control" />
                            </div>
                            <div class="form-group col">
                                <label>Valor Total</label>
                                <asp:TextBox runat="server" ID="ValorPedido" CssClass="form-control" />
                            </div>
                        </div>
                        <div>
                            <asp:Button CssClass="btn btn-primary" ID="Salvar" Text="Salvar" runat="server" OnClick="Salvar_Click" />
                            <asp:Button CssClass="btn btn-light" Text="Liberar" ID="Liberar" runat="server" OnClick="Liberar_Click"/>
                            <asp:Button CssClass="btn btn-danger" Text="Cancelar" ID="Cancelar" runat="server" OnClick="Cancelar_Click" />
                        </div>
                        <div class="mt-4">
                            <button type="button" class="btn btn-light" data-toggle="modal" data-target="#AddItem" runat="server">Adicionar Item</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-4">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <asp:DataGrid runat="server" ID="dgBusca" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" HeaderStyle-CssClass="bg-dark text-white" OnDeleteCommand="dgBusca_DeleteCommand">
                                <Columns>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" CommandName="Delete" CommandArgument="<%# Container.DataSetIndex %>" Text="Excluir" ID="delete"/>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="Id" HeaderText="Id" ReadOnly="True"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="PedidoVendaId" HeaderText="PedidoVendaId"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="ProdutoId" HeaderText="ProdutoId"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="Quantidade" HeaderText="Quantidade" ItemStyle-CssClass="text-right">
                                        <ItemStyle CssClass="text-right"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="ValorUnitario" HeaderText="Valor Unitario" DataFormatString="{0:C}" ItemStyle-CssClass="text-right">
                                        <ItemStyle CssClass="text-right"></ItemStyle>
                                    </asp:BoundColumn>                                                                        
                                    <asp:BoundColumn DataField="TipoPreco" HeaderText="Cliente"></asp:BoundColumn>
                                </Columns>
                                <HeaderStyle CssClass="bg-dark text-white"></HeaderStyle>
                            </asp:DataGrid>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="AddItem" tabindex="-1" role="dialog" style="height: auto; width: auto;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Adicionar Item</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="form-group col">
                                <label>Produto</label>
                                <asp:TextBox runat="server" ID="txtproduto" CssClass="form-control" list="ContentPlaceHolder1_produto" OnTextChanged="txtproduto_TextChanged" AutoPostBack="true"></asp:TextBox>                                
                                <datalist id="produto" runat="server" >                                    
                                </datalist>                               
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col">
                                <label>Qtd</label>
                                <asp:TextBox runat="server" ID="txtProdutoID" CssClass="form-control" ReadOnly="true" Visible="false"/>                                
                                <asp:TextBox runat="server" ID="AddQuantidade" CssClass="form-control" AutoPostBack="true" OnTextChanged="AddQuantidade_TextChanged"></asp:TextBox>
                            </div>

                            <div class="form-group col">
                                <label>Vlr. Unitario</label>
                                <asp:TextBox runat="server" ID="ValorUnitario" DataFormatString="{0:C}" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="form-group col">
                                <label>Vlr. Total</label>
                                <asp:TextBox runat="server" ID="ValorItemTotal" DataFormatString="{0:C}" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <asp:Button CssClass="btn btn-primary" Text="Adicionar" ID="AdicionarItem" runat="server" OnClick="AdicionarItem_Click" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        function fucaoExibirModal() {
            $('#AddItem').modal();
        }
    </script>
</asp:Content>
