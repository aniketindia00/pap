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
import modelo.Carro;
import modelo.CarroDAO;
import modelo.Cliente;
import modelo.ClienteDAO;
import modelo.Orcamento;
import modelo.OrcamentoDAO;
import modelo.Produto;
import modelo.ProdutoDAO;

/**
 *
 * @author André
 */
public class AlterarOrcamento extends HttpServlet {
   
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
            // TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InserirOrcamento</title>");  
            out.println("</head>");
            out.println("<body>");
            try {
                double valor = 0;
                ArrayList<Produto> produtos = (ArrayList<Produto>) session.getAttribute("produtos");
                int id = Integer.parseInt(request.getParameter("id"));
                int id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
                int id_carro = Integer.parseInt(request.getParameter("id_carro"));
                String nome = request.getParameter("nome");
                String telefone = request.getParameter("telefone");
                String modelo = request.getParameter("modelo");
                String marca = request.getParameter("marca");
                String ano = request.getParameter("ano");

                ClienteDAO cDB = new ClienteDAO();
                cDB.conectar();
                Cliente c = new Cliente();
                if(cDB.carregaPorNomeTelefone(nome, telefone) == null || cDB.carregaPorId(id_cliente) == null){
                c.setNome(nome);
                c.setTelefone(telefone);
                cDB.alterar(c);
                }else{
                c = cDB.carregaPorNomeTelefone(nome, telefone);
                }



                

                CarroDAO caDB = new CarroDAO();

                caDB.conectar();
                Carro ca = new Carro();

                if(id_carro == 0){
                ca.setAno(ano);
                ca.setIdCliente(cDB.carregaPorNomeTelefone(nome, telefone).getId());
                ca.setMarca(marca);
                ca.setModelo(modelo);
                caDB.alterar(ca);
                }else{
                ca = caDB.carregaPorId(id_carro);
                }
                

                OrcamentoDAO oDB = new OrcamentoDAO();
                oDB.conectar();

                TimeZone.setDefault(TimeZone.getTimeZone("Brazil/East"));
                String horaF = "HH:mm:ss";
                String dataF = "dd/MM/yyyy";
                String data = new SimpleDateFormat(dataF).format(new Date());
                String hora = new SimpleDateFormat(horaF).format(new Date());
                Orcamento o = new Orcamento();
                o.setDataEmissao(data);
                o.setHoraEmissao(hora);
                o.setIdCliente(cDB.carregaPorNomeTelefone(nome, telefone).getId());
                o.setIdCarro(caDB.carregaPorModeloAnoMarca(modelo, ano, marca).getId());
                o.setProdutos(produtos);
                for(Produto p:produtos){
                valor += (p.getPreco() * p.getQuantidade());
                }
                o.setValor(valor);
                oDB.alterar(o);

                ProdutoDAO pDB = new ProdutoDAO();

                pDB.conectar();
                for(Produto p:pDB.produtosOrcamento(id)){
                   pDB.desvincularProdutoOrcamento(p.getId(), id);
                }
                for(Produto p:produtos){
                   pDB.vincularProdutoOrcamento(p.getId(), id);
                }
                pDB.desconectar();


                cDB.desconectar();
                caDB.desconectar();
                oDB.desconectar();

                out.print("<script language='JavaScript'>");
                out.print(" alert('Registros alterados com sucesso!');");
                out.print(" window.open('listar_orcamento.jsp','_parent');");
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
