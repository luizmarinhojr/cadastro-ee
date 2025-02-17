<%-- 
    Document   : ProdutoDados
    Created on : Feb 15, 2025, 10:32:09 PM
    Author     : monster
--%>

<%@page import="cadastroee.model.Produtos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dados do Produto</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body class="container">
        <h1>Dados do Produto</h1>
        
        <%
            Produtos produto = (Produtos) request.getAttribute("produto");
            String acao = produto != null ? "alterar" : "incluir";
        %>
        
        <form class="form" action="ServletProdutoFC" method="post">
            <input type="hidden" name="acao" value="<%= acao %>">
            <%
                if (acao.equals("alterar")) {
                    out.println("<input type=\"hidden\" name=\"id\" value=\"" + produto.getProdutoID() + "\">");
                }
            %>
            <div class="mb-3">
                <label class="form-label">Nome:</label>
                <input class="form-control" type="text" name="nome" value="<%= acao == "alterar" ? produto.getNome() : "" %>" required>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Quantidade:</label>
                <input class="form-control" type="text" name="quantidade" value="<%= acao == "alterar" ? produto.getQuantidade() : "" %>" required>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Preço de venda:</label>
                <input class="form-control" type="text" name="preco" value="<%= acao == "alterar" ? produto.getPrecoVenda() : "" %>" required>
            </div>
            
            <button class="btn btn-primary" type="submit"><%= acao == "alterar" ? "Alterar Produto" : "Incluir Produto" %></button>
        </form>
    </body>
</html>
