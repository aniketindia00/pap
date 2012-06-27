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
import modelo.Carro;
import modelo.CarroDAO;
import modelo.Cliente;
import modelo.ClienteDAO;
import modelo.Orcamento;
import modelo.OrcamentoDAO;

/**
 *
 * @author Alisson
 */
public class ExcluirCliente extends HttpServlet {

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
        try {
         // TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ExcluirCliente</title>");
            out.println("</head>");
            out.println("<body>");
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Cliente c = new Cliente();
                c.setId(id);

                ClienteDAO cDB = new ClienteDAO();
                CarroDAO caDB = new CarroDAO();
                caDB.conectar();
                OrcamentoDAO oDB = new OrcamentoDAO();
                oDB.conectar();
                cDB.conectar();
                ArrayList<Orcamento> orcamentos = oDB.orcamentosCliente(c.getId());
                for(Orcamento o:orcamentos){
                oDB.excluir(o);
                }
                ArrayList<Carro> carros = caDB.carrosCliente(c.getId());
                for(Carro ca:carros){
                caDB.excluir(ca);
                }
                
                cDB.excluir(c);
                oDB.desconectar();
                caDB.desconectar();
                cDB.desconectar();


                out.print("<script language='JavaScript'>");
                out.print(" alert('Registros deletados com sucesso!');");
                out.print(" window.open('listar_orcamento.jsp','_parent');");
                out.print("</script>");


            } catch (Exception e) {
                out.print(e);
            }
            out.println("</body>");
            out.println("</html>");
            }
         finally { 
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
