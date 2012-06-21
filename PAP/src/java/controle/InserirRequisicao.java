/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
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
public class InserirRequisicao extends HttpServlet {

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
            out.println("<title>Servlet InserirRequisicao</title>");
            out.println("</head>");
            out.println("<body>");

            try {
                String cpf = "";
                ArrayList<Produto> produtos = (ArrayList<Produto>) session.getAttribute("produtos");
                if(request.getParameter("cpf") != null){
                cpf = request.getParameter("cpf");
                }
                

                double valor = 0;

                String nome = request.getParameter("nome");
                String oficina = request.getParameter("oficina");
                String telefone = request.getParameter("telefone");

                RequisicaoDAO rDB = new RequisicaoDAO();
                rDB.conectar();
                Mecanico m = new Mecanico();
                MecanicoDAO mDB = new MecanicoDAO();

                mDB.conectar();

                Requisicao r = new Requisicao();

                if (mDB.carregaPorCpf(cpf) == null) {
                    m.setCpf(cpf);
                    m.setNome(nome);
                    m.setOficina(oficina);
                    m.setTelefone(telefone);
                    mDB.inserir(m);
                } else {
                    m = mDB.carregaPorCpf(cpf);
                }

                for (Produto p : produtos) {
                    valor += (p.getPreco() * p.getQuantidade());
                }

                r.setMecanico(m);
                r.setValor(valor);
                r.setProdutos(produtos);
                r.setCpfMecanico(m.getCpf());

                TimeZone.setDefault(TimeZone.getTimeZone("Brazil/East"));
                DateFormat horaF = new SimpleDateFormat("HH:mm:ss");
                DateFormat dataF = new SimpleDateFormat("dd/MM/yyyy");
                DateFormat dataMysql = new SimpleDateFormat("yyyy/MM/dd");

                Date date = new Date();


                String hora = horaF.format(date);
                //out.print("Hora Normal: "+hora);
                //out.print("<br />");
                String dataNormal = dataF.format(date);
                //out.print("Data Formato Brasil: "+dataNormal);
                //out.print("<br />");
                String dataBancoDados = dataMysql.format(date);
                //out.print("Data Formato Banco de Dados MySQL: "+dataBancoDados);
                //out.print("<br />");

                r.setDataEmissao(dataNormal);
                r.setHoraEmissao(hora);

                r.setCpfMecanico(cpf);

                int id_requisicao = rDB.inserir(r);

                ProdutoDAO pDB = new ProdutoDAO();

                pDB.conectar();
                for (Produto p : produtos) {
                    pDB.vincularProdutoRequisicao(p.getId(), id_requisicao);
                }
                pDB.desconectar();

                rDB.desconectar();

                mDB.desconectar();

                out.print("<script language='JavaScript'>");
                out.print(" alert('Registros inseridos com sucesso!');");
                out.print(" window.open('listar_requisicao.jsp','_parent');");
                out.print("</script>");

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
