/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Mecanico;
import modelo.MecanicoDAO;
import modelo.Produto;
import modelo.ProdutoDAO;
import modelo.Requisicao;
import modelo.RequisicaoDAO;

/**
 *
 * @author DaviDBL
 */
public class AlterarRequisicao extends HttpServlet {
   
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
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlterarRequisicao</title>");  
            out.println("</head>");
            out.println("<body>");

            try {
                ArrayList<Produto> produtos = (ArrayList<Produto>) session.getAttribute("produtos");
                String cpf = request.getParameter("cpf");

                double valor=0;

                String nome = request.getParameter("nome");
                String oficina = request.getParameter("oficina");
                String telefone = request.getParameter("telefone");

                RequisicaoDAO rDB = new RequisicaoDAO();
                rDB.conectar();
                Mecanico m = new Mecanico();
                MecanicoDAO mDB = new MecanicoDAO();

                mDB.conectar();

                Requisicao r = new Requisicao();

                if(mDB.carregaPorCpf(cpf) == null){
                m.setNome(nome);
                m.setOficina(oficina);
                m.setTelefone(telefone);
                r.setMecanico(m);
                mDB.alterar(m);
                }else{
                m = mDB.carregaPorCpf(cpf);
                }

                for(Produto p:produtos){
                valor += (p.getPreco() * p.getQuantidade());
                }

                r.setValor(valor);
                r.setProdutos(produtos);

                TimeZone.setDefault(TimeZone.getTimeZone("Brazil/East"));
                String horaF = "HH:mm:ss";
                String dataF = "dd/MM/yyyy";
                String data = new SimpleDateFormat(dataF).format(new Date());
                String hora = new SimpleDateFormat(horaF).format(new Date());

                r.setDataEmissao(data);
                r.setHoraEmissao(hora);

                r.setCpfMecanico(cpf);

                rDB.alterar(r);

                ProdutoDAO pDB = new ProdutoDAO();

                pDB.conectar();
                for(Produto p:produtos){
                    pDB.vincularProdutoRequisicao(p.getId(), rDB.carregaPorDataHoraValor(data, hora, valor).getId());
                }
                pDB.desconectar();

                rDB.desconectar();

                mDB.desconectar();

            } catch (Exception e) {
                out.print(e);
            }

            out.println("</body>");
            out.println("</html>");
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
