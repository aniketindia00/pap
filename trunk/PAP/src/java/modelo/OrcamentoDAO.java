/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Daniel
 */
public class OrcamentoDAO extends DataBaseDAO{

    public OrcamentoDAO() throws Exception {
    }

    public int inserir(Orcamento o) throws SQLException{
        int id = 0;
        PreparedStatement pst;
        PreparedStatement pst1;
        String sql = "INSERT INTO orcamento ( id_cliente, data_emissao, hora_emissao, valor,id_carro) values(?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, o.getIdCliente());
        pst.setString(2, o.getDataEmissao());
        pst.setString(3, o.getHoraEmissao());
        pst.setDouble(4, o.getValor());
        pst.setInt(5, o.getIdCarro());
        pst.execute();
        String sql1 ="SELECT * FROM orcamento WHERE data_emissao=? AND hora_emissao=? AND id_cliente=?";
        pst1 =conn.prepareStatement(sql1);
        pst1.setString(1, o.getDataEmissao());
        pst1.setString(2, o.getHoraEmissao());
        pst1.setInt(3, o.getIdCliente());
        ResultSet rs = pst1.executeQuery();
        if(rs.next()){
        id = rs.getInt("id");
        }
        return id;
    }

    public void alterar(Orcamento o) throws SQLException{

        PreparedStatement pst;

        String sql ="UPDATE orcamento SET id_cliente=?, data_emissao=?, hora_emissao=?, valor=?, id_carro=?  WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1, o.getIdCliente());
        pst.setString(2, o.getDataEmissao());
        pst.setString(3, o.getHoraEmissao());
        pst.setDouble(4, o.getValor());
        pst.setInt(5, o.getIdCarro());
        pst.setInt(6, o.getId());
        pst.execute();


    }



    public void excluir(Orcamento o) throws SQLException{

        PreparedStatement pst;
        String sql ="DELETE FROM orcamento WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1, o.getId());
        pst.execute();

    }

        public Orcamento carregaPorId(int id) throws SQLException, Exception{
        Orcamento o = new Orcamento();
        ProdutoDAO pDB = new ProdutoDAO();
        ClienteDAO cDB = new ClienteDAO();
        PreparedStatement pst;
        String sql ="SELECT * FROM orcamento WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,id);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
        o.setId(rs.getInt("id"));
        o.setDataEmissao(rs.getString("data_emissao"));
        o.setHoraEmissao(rs.getString("hora_emissao"));
        o.setValor(rs.getDouble("valor"));
        o.setIdCliente(rs.getInt("id_cliente"));
        o.setIdCarro(rs.getInt("id_carro"));
        pDB.conectar();
        o.setProdutos(pDB.produtosOrcamento(o.getId()));
        pDB.desconectar();
        cDB.conectar();
        o.setCliente(cDB.carregaPorId(o.getIdCliente()));
        cDB.desconectar();
        }
        return o;

    }
        
        
        public Orcamento carregaPorDataHoraCliente(String data, String hora, int id_cliente) throws SQLException, Exception{
        Orcamento o = new Orcamento();
        ProdutoDAO pDB = new ProdutoDAO();
        ClienteDAO cDB = new ClienteDAO();
        PreparedStatement pst;
        String sql ="SELECT * FROM orcamento WHERE data_emissao=? AND hora_emissao=? AND id_cliente=?";
        pst =conn.prepareStatement(sql);
        pst.setString(1,data);
        pst.setString(2,hora);
        pst.setInt(3,id_cliente);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
        o.setId(rs.getInt("id"));
        o.setDataEmissao(rs.getString("data_emissao"));
        o.setHoraEmissao(rs.getString("hora_emissao"));
        o.setValor(rs.getDouble("valor"));
        o.setIdCliente(rs.getInt("id_cliente"));
        o.setIdCarro(rs.getInt("id_carro"));
        pDB.conectar();
        o.setProdutos(pDB.produtosOrcamento(o.getId()));
        pDB.desconectar();
        cDB.conectar();
        o.setCliente(cDB.carregaPorId(o.getIdCliente()));
        cDB.desconectar();
        }
        return o;

    }


        public ArrayList<Orcamento> listar() throws SQLException, Exception{
        ArrayList<Orcamento> lista = new ArrayList<Orcamento>();
        ProdutoDAO pDB = new ProdutoDAO();
        ClienteDAO cDB = new ClienteDAO();
        PreparedStatement pst;
        String sql ="SELECT * FROM orcamento";
        pst =conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
        Orcamento o = new Orcamento();
        o.setId(rs.getInt("id"));
        o.setDataEmissao(rs.getString("data_emissao"));
        o.setHoraEmissao(rs.getString("hora_emissao"));
        o.setValor(rs.getDouble("valor"));
        o.setIdCliente(rs.getInt("id_cliente"));
        o.setIdCarro(rs.getInt("id_carro"));
        pDB.conectar();
        o.setProdutos(pDB.produtosOrcamento(o.getId()));
        pDB.desconectar();
        cDB.conectar();
        o.setCliente(cDB.carregaPorId(o.getIdCliente()));
        cDB.desconectar();
        lista.add(o);
        }
        return lista;

    }
    public ArrayList<Orcamento> orcamentosCliente(int id_cliente) throws SQLException, Exception {

        ArrayList<Orcamento> lista = new ArrayList<Orcamento>();
        ProdutoDAO pDB = new ProdutoDAO();
        ClienteDAO cDB = new ClienteDAO();
        PreparedStatement pst;
        String sql = "SELECT * FROM orcamento WHERE id_cliente=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_cliente);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
        Orcamento o = new Orcamento();
        o.setId(rs.getInt("id"));
        o.setDataEmissao(rs.getString("data_emissao"));
        o.setHoraEmissao(rs.getString("hora_emissao"));
        o.setValor(rs.getDouble("valor"));
        o.setIdCliente(rs.getInt("id_cliente"));
        o.setIdCarro(rs.getInt("id_carro"));
        pDB.conectar();
        o.setProdutos(pDB.produtosOrcamento(o.getId()));
        pDB.desconectar();
        cDB.conectar();
        o.setCliente(cDB.carregaPorId(o.getIdCliente()));
        cDB.desconectar();
        lista.add(o);
        }
        return lista;

    }

    
}
