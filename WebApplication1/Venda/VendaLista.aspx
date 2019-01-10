<%@ Page Title="" Language="C#" MasterPageFile="~/ASCX/Site1.Master" AutoEventWireup="true" CodeBehind="VendaLista.aspx.cs" Inherits="WebApplication1.Venda.VendaLista" %>

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
                        Busca
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:TextBox runat="server" ID="busca" CssClass="form-control" />
                            <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary float-right mt-4" ID="btnBuscar" OnClick="btnBuscar_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="container mt-4">
            <asp:Button Text="Incluir Pedido" runat="server" CssClass="btn btn-primary float-right mt-4" ID="Incluir" OnClick="Incluir_Click" />
        </div>
    </div>
    <div class="container mt-4">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <asp:DataGrid runat="server" ID="dgBusca" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" HeaderStyle-CssClass="bg-dark text-white">
                            <Columns>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" CommandName="Excluir" CommandArgument="<%# Container.DataSetIndex %>" Text="Excluir"  OnClick="Excluir_Click" ID="Excluir" />

                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" CommandName="abrir" CommandArgument="<%# Container.DataSetIndex %>" Text="abrir" OnClick="AbrirVenda_Click" ID="AbrirVenda" />

                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" CommandArgument='<%#Eval("PedidoId")%>' Text="Liberar Pedido" OnClick="Liberarpedido_Click" ID="Liberarpedido" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="PedidoId" HeaderText="Codigo Pedido" ReadOnly="True"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Cliente" HeaderText="Cliente"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Vendedor" HeaderText="Vendedor"></asp:BoundColumn>
                                <asp:BoundColumn DataField="ValorTotal" HeaderText="Valor Total" DataFormatString="{0:C}" ItemStyle-CssClass="text-right">
                                    <ItemStyle CssClass="text-right"></ItemStyle>
                                </asp:BoundColumn>
                            </Columns>

                            <HeaderStyle CssClass="bg-dark text-white"></HeaderStyle>
                        </asp:DataGrid>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
