<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cadastroee.model.Produto"%>

<%
    Produto produto = (Produto) request.getAttribute("produto");

    boolean alterar = produto != null;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Produto</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">

    <h1><%= alterar ? "Alterar Produto" : "Novo Produto" %></h1>

    <form method="post" action="ServletProdutoFC">

        <input type="hidden" name="acao"
               value="<%= alterar ? "alterar" : "incluir" %>">

        <% if (alterar) { %>
            <input type="hidden" name="id" value="<%= produto.getId() %>">
        <% } %>

        <div class="mb-3">
            <label class="form-label">Nome</label>

            <input type="text"
                   name="nome"
                   class="form-control"
                   value="<%= alterar ? produto.getNome() : "" %>">
        </div>

        <div class="mb-3">
            <label class="form-label">Quantidade</label>

            <input type="number"
                   name="quantidade"
                   class="form-control"
                   value="<%= alterar ? produto.getQuantidade() : "" %>">
        </div>

        <div class="mb-3">
            <label class="form-label">Preço Venda</label>

            <input type="text"
                   name="precoVenda"
                   class="form-control"
                   value="<%= alterar ? produto.getPrecoVenda() : "" %>">
        </div>

        <button type="submit" class="btn btn-success">
            Salvar
        </button>

        <a href="ServletProdutoFC?acao=listar" class="btn btn-secondary">
            Voltar
        </a>

    </form>

</div>

</body>
</html>