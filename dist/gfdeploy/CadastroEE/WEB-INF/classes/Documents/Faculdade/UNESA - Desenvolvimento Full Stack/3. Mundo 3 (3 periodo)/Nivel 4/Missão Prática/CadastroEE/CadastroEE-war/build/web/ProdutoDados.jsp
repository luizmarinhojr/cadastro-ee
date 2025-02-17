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
    </head>
    <body>
        <h1>Dados do Produto</h1>
        
        <%
            Produtos produto = (Produtos) request.getAttribute("produto");
            String acao = produto != null ? "alterar" : "incluir";
        %>
        
        <form action="ServletProdutoFC" method="post">
            <input type="hidden" name="acao" value="<%= acao %>">
            <%
                if (acao.equals("alterar")) {
                    out.println("<input type=\"hidden\" name=\"id\" value=\"" + produto.getProdutoID() + "\">");
                }
            %>
            <label>Nome:</label>
            <input type="text" name="nome" value="<%= acao == "alterar" ? produto.getNome() : "" %>" required>
            
            <label>Quantidade:</label>
            <input type="text" name="quantidade" value="<%= acao == "alterar" ? produto.getQuantidade() : "" %>" required>
            
            <label>Preço de venda:</label>
            <input type="text" name="preco" value="<%= acao == "alterar" ? produto.getPrecoVenda() : "" %>" required>
            
            <button type="submit"><%= acao == "alterar" ? "Alterar Produto" : "Incluir Produto" %></button>
        </form>
    </body>
</html>
