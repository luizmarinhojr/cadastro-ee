/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cadastroee.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import cadastroee.controller.ProdutosFacadeLocal;
import cadastroee.model.Produtos;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.util.List;


public class ServletProdutoFC extends HttpServlet {
    
    @EJB
    private ProdutosFacadeLocal facade;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String acao = request.getParameter("acao");
        if (acao == null) {
            acao = "listar";
        }
        String destino = "ProdutoLista.jsp";
        
        switch(acao) {
            case "listar":
                List<Produtos> produtos = facade.findAll();
                request.setAttribute("produtos", produtos);
                break;
            case "incluir":
                Produtos produtoParaIncluir = new Produtos(
                        0L,
                        request.getParameter("nome"),
                        Integer.parseInt(request.getParameter("quantidade")),
                        Float.parseFloat(request.getParameter("preco"))
                );
                facade.create(produtoParaIncluir);
                request.setAttribute("produtos", facade.findAll());
                response.sendRedirect("ServletProdutoFC?acao=listar");
                return;
            case "alterar":
                Produtos produto = facade.find(Long.parseLong(request.getParameter("id")));
                produto.setNome(request.getParameter("nome"));
                produto.setPrecoVenda(Float.parseFloat(request.getParameter("preco")));
                produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
                produto.setNome(request.getParameter("nome"));
                facade.edit(produto);
                request.setAttribute("produtos", facade.findAll());
                response.sendRedirect("ServletProdutoFC?acao=listar");
                return;
            case "excluir":
                facade.remove(facade.find(Long.parseLong(request.getParameter("id"))));
                request.setAttribute("produtos", facade.findAll());
                response.sendRedirect("ServletProdutoFC?acao=listar");
                return;
            case "formIncluir":
                
            case "formAlterar":
                destino = "ProdutoDados.jsp";
                if (acao.equals("formAlterar")) {
                    request.setAttribute("produto", facade.find(Long.parseLong(request.getParameter("id"))));
                }
                break;
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
