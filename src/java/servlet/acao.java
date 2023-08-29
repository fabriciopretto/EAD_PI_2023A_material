/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.CategoriaDAO;
import dao.UsuarioDAO;
import entidade.Categoria;
import entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pretto
 */
public class acao extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet acao</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet acao at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
//        processRequest(request, response);

        System.out.println("Estou no GET.");

        String parametro1 = request.getParameter("param1");
        String pagina = request.getParameter("pagina");
        String prod = request.getParameter("produto");

        System.out.println("Param 1: " + parametro1);
        System.out.println("Página: " + pagina);
        System.out.println("Produto: " + prod);

        // -------------------------------------------------------------------
        String a = request.getParameter("a");

        if (a.equals("editarCateg")) {
            String id = request.getParameter("id");
            int codigo = Integer.parseInt(id);

            Categoria categoria = new CategoriaDAO().consultar(codigo);

            request.setAttribute("categoria", categoria);

            encaminharPagina("categoria.jsp", request, response);
        }

        if (a.equals("excluirCateg")) {
            String id = request.getParameter("id");
            int codigo = Integer.parseInt(id);

            if (new CategoriaDAO().excluir(codigo)) {
                encaminharPagina("categoria.jsp", request, response);
            } else {
                encaminharPagina("erro.jsp", request, response);
            }
        }

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
//        processRequest(request, response);

        System.out.println("Estou no POST.");

        String primeiroNome = request.getParameter("fname");
        String segundoNome = request.getParameter("lname");

        System.out.println("Primeiro nome: " + primeiroNome);
        System.out.println("Segundo nome: " + segundoNome);

        if (new UsuarioDAO().autenticar(primeiroNome, segundoNome) != null) {
//            response.sendRedirect("sucesso.jsp");
            request.setAttribute("xxx", 1); // exemplo
            //   encaminharPagina("sucesso.jsp", request, response);
        } else {
            //  encaminharPagina("erro.jsp", request, response);
        }
        // encaminhamentos comentados na U7 apos implementacao do LOGIN

        //---------------------------------------------------------------------
        String a = request.getParameter("a");

        if (a.equals("salvarCateg")) {
            String codigo = request.getParameter("codigo");
            String descricao = request.getParameter("descricao");

            Categoria categoria = new Categoria();
            int id = Integer.parseInt(codigo);
            categoria.setCodigo(id);
            categoria.setDescricao(descricao);

            if (id == 0) {
                if (new CategoriaDAO().salvar(categoria)) {
                    encaminharPagina("sucesso.jsp", request, response);
                } else {
                    encaminharPagina("erro.jsp", request, response);
                }
            } else {
                if (new CategoriaDAO().atualizar(categoria)) {
                    encaminharPagina("sucesso.jsp", request, response);
                } else {
                    encaminharPagina("erro.jsp", request, response);
                }
            }
        }

        if (a.equals("login")) {
            // logica do login
            // pegar usuario
            // pegar senha
            // autenticar = verificar
            // sucesso = vai pro sistema || erro = login de novo

            String user = request.getParameter("user");
            String passwd = request.getParameter("passwd");

            System.out.println("User: " + user);
            System.out.println("Passwd: " + passwd);

            Usuario usuario = new UsuarioDAO().autenticar(user, passwd);

            if (usuario != null) {
                HttpSession sessao = request.getSession();
                sessao.setAttribute("user", usuario);

                encaminharPagina("menu.jsp", request, response);
            } else {
                encaminharPagina("erro.jsp", request, response);
            }
        }

        if (a.equals("logout")) {
            HttpSession sessao = request.getSession();
            sessao.invalidate();

            response.sendRedirect("login.jsp");
        }

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

    private void encaminharPagina(String pagina, HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher rd = request.getRequestDispatcher(pagina);
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println("Erro ao encaminhar: " + e);
        }
    }

}
