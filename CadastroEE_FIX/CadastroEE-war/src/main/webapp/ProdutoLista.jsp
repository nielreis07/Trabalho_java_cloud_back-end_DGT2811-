<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cadastroee.model.Produto"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Produtos</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">

    <h1 class="mb-4">Cadastro de Produtos</h1>

    <a href="ServletProdutoFC?acao=formIncluir" class="btn btn-primary mb-3">
        Incluir Produto
    </a>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Quantidade</th>
                <th>Preço Venda</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>

        <%
            List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");

            if (produtos != null) {
                for (Produto p : produtos) {
        %>

        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getNome() %></td>
            <td><%= p.getQuantidade() %></td>
            <td><%= p.getPrecoVenda() %></td>
            <td>
                <a class="btn btn-warning btn-sm"
                   href="ServletProdutoFC?acao=formAlterar&id=<%= p.getId() %>">
                   Alterar
                </a>

                <a class="btn btn-danger btn-sm"
                   href="ServletProdutoFC?acao=excluir&id=<%= p.getId() %>">
                   Excluir
                </a>
            </td>
        </tr>

        <%
                }
            }
        %>

        </tbody>
    </table>

</div>

</body>
</html>