package cadastroee.servlets;

import cadastroee.model.Produto;
import cadastroee.session.ProdutoFacadeLocal;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ServletProdutoFC extends HttpServlet {

    @EJB
    private ProdutoFacadeLocal facade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if (acao == null || acao.equals("listar")) {

            List<Produto> produtos = facade.findAll();
            request.setAttribute("produtos", produtos);
            request.getRequestDispatcher("/ProdutoLista.jsp").forward(request, response);

        } else if (acao.equals("formIncluir")) {

            request.getRequestDispatcher("/ProdutoDados.jsp").forward(request, response);

        } else if (acao.equals("incluir")) {

            Produto p = new Produto();
            p.setNome(request.getParameter("nome"));
            p.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            p.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));

            facade.create(p);

            response.sendRedirect("ServletProdutoFC?acao=listar");

        } else if (acao.equals("formAlterar")) {

            Long id = Long.parseLong(request.getParameter("id"));
            Produto produto = facade.find(id);

            request.setAttribute("produto", produto);
            request.getRequestDispatcher("/ProdutoDados.jsp").forward(request, response);

        } else if (acao.equals("alterar")) {

            Long id = Long.parseLong(request.getParameter("id"));

            Produto p = facade.find(id);

            p.setNome(request.getParameter("nome"));
            p.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            p.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));

            facade.edit(p);

            response.sendRedirect("ServletProdutoFC?acao=listar");

        } else if (acao.equals("excluir")) {

            Long id = Long.parseLong(request.getParameter("id"));

            Produto p = facade.find(id);

            facade.remove(p);

            response.sendRedirect("ServletProdutoFC?acao=listar");
        }
    }
}