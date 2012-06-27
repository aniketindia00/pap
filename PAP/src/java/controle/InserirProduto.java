/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Produto;
import modelo.ProdutoDAO;

/**
 *
 * @author Daniel
 */
public class InserirProduto extends HttpServlet {
   
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
    if(session.getAttribute("produto") == null){
       response.sendRedirect("index.jsp?erro=1");
    }else{
            // TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InserirProduto</title>");  
            out.println("</head>");
            out.println("<body>");

            try {
                String nome = request.getParameter("nome");
                String cod_barras = request.getParameter("cod_barras");
                double preco = Double.parseDouble(request.getParameter("preco"));

                Produto p = new Produto();
                p.setNome(nome);
                p.setCodBarras(cod_barras);
                p.setPreco(preco);


                ProdutoDAO pDB = new ProdutoDAO();

                pDB.conectar();
                pDB.inserir(p);
                pDB.desconectar();

                out.print("<script language='JavaScript'>");
                out.print(" alert('Registros inseridos com sucesso!');");
                out.print(" window.open('listar_produto.jsp','_parent');");
                out.print("</script>");


            } catch (Exception e) {
                out.print(e);
            }

            out.println("</body>");
            out.println("</html>");
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
