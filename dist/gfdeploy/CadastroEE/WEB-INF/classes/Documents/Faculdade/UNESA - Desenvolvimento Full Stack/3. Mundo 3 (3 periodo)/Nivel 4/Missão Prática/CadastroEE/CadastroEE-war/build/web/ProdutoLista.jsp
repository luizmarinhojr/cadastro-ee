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
    </head>
    <body>
        <h2>Listagem de Produtos</h2>
        <a href="ServletProdutoFC?acao=formIncluir">Novo Produto</a>
        
        <table>
            <thead>
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
                        out.println("<a href=\"ServletProdutoFC?acao=formAlterar&id=" + produto.getProdutoID() + "\">Alterar</a>");
                        out.println("<a href=\"ServletProdutoFC?acao=excluir&id=" + produto.getProdutoID() + "\">Excluir</a>");
                        out.println("</td>");
                        out.println("</tr>");
                    } 
                %>
            </tbody>
        </table>
    </body>
</html>
