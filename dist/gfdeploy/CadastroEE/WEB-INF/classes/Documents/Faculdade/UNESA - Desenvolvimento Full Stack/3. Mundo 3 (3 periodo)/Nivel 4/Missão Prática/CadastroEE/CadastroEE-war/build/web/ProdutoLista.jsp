<%-- 
    Document   : ProdutoLista
    Created on : Feb 15, 2025, 9:33:17 PM
    Author     : monster
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="cadastroee.model.Produtos" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de produtos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body class="container">
        <h1>Listagem de Produtos</h1>
        <a class="btn btn-primary m-2" href="ServletProdutoFC?acao=formIncluir">Novo Produto</a>
        
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Quantidade</th>
                    <th scope="col">Preço de venda</th>
                    <th scope="col">Opções</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Produtos> produtos = (List<Produtos>) request.getAttribute("produtos");
                    
                    for (Produtos produto: produtos) {
                        out.println("<tr>");
                        out.println("<td>" + produto.getProdutoID() + "</td>");
                        out.println("<td>" + produto.getNome() + "</td>");
                        out.println("<td>" + produto.getQuantidade() + "</td>");
                        out.println("<td>" + produto.getPrecoVenda() + "</td>");
                        out.println("<td>");
                        out.println("<a class=\"btn btn-primary btn-sm\" href=\"ServletProdutoFC?acao=formAlterar&id=" + produto.getProdutoID() + "\">Alterar</a>");
                        out.println("<a class=\"btn btn-danger btn-sm\" href=\"ServletProdutoFC?acao=excluir&id=" + produto.getProdutoID() + "\">Excluir</a>");
                        out.println("</td>");
                        out.println("</tr>");
                    } 
                %>
            </tbody>
        </table>
    </body>
</html>
