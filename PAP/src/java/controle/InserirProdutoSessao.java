/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Produto;
import modelo.ProdutoDAO;

/**
 *
 * @author PC
 */
public class InserirProdutoSessao extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InserirProdutoSessao</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InserirProdutoSessao at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
            try {
                ArrayList<Produto> produtos = new ArrayList<Produto>();
                if(session.getAttribute("produtos") != null){
                produtos =(ArrayList<Produto>) session.getAttribute("produtos");
                }
                int id = Integer.parseInt(request.getParameter("id"));
                ProdutoDAO pDB = new ProdutoDAO();
                pDB.conectar();
                Produto p = pDB.carregaPorId(id);
                pDB.desconectar();
                produtos.add(p);
                session.removeAttribute("produtos");
                session.setAttribute("produtos",produtos);
                response.sendRedirect("produtos_orcamento.jsp");
            } catch (Exception e) {
                out.print(e);
            }
        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
