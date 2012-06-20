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
public class RequisicaoDAO extends DataBaseDAO{

    public RequisicaoDAO() throws Exception {
    }

    
    public void inserir(Requisicao r) throws SQLException{

        PreparedStatement pst;
        String sql = "INSERT INTO requisicao (cpf_mecanico, data_emissao, hora_emissao, valor) values(?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, r.getCpfMecanico());
        pst.setString(2, r.getDataEmissao());
        pst.setString(3, r.getHoraEmissao());
        pst.setDouble(4, r.getValor());
        pst.execute();

    }

    public void alterar(Requisicao r) throws SQLException{

        PreparedStatement pst;
        String sql ="UPDATE requisicao SET cpf_mecanico=?, data_emissao=?, hora_emissao=?, valor=?  WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setString(1, r.getCpfMecanico());
        pst.setString(2, r.getDataEmissao());
        pst.setString(3, r.getHoraEmissao());
        pst.setDouble(4, r.getValor());
        pst.setInt(5, r.getId());
        pst.execute();

    }

    

    public void excluir(Requisicao r) throws SQLException{

        PreparedStatement pst;
        String sql ="DELETE FROM requisicao WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1, r.getId());
        pst.execute();

    }
    
    public Requisicao carregaPorId(int id) throws SQLException, Exception{
        Requisicao r = new Requisicao();
        ProdutoDAO pDB = new ProdutoDAO();
        MecanicoDAO mDB = new MecanicoDAO();
        PreparedStatement pst;
        String sql ="SELECT * FROM requisicao WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,id);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
        r.setId(rs.getInt("id"));
        r.setDataEmissao(rs.getString("data_emissao"));
        r.setHoraEmissao(rs.getString("hora_emissao"));
        r.setValor(rs.getDouble("valor"));
        r.setCpfMecanico(rs.getString("cpf_mecanico"));
        pDB.conectar();
        r.setProdutos(pDB.produtosRequisicao(r.getId()));
        pDB.desconectar();
        mDB.conectar();
        r.setMecanico(mDB.carregaPorCpf(r.getCpfMecanico()));
        mDB.desconectar();
        }
        return r;

    }

        public Requisicao carregaPorDataHoraValor(String data, String hora, double valor) throws SQLException, Exception{
        Requisicao r = new Requisicao();
        ProdutoDAO pDB = new ProdutoDAO();
        MecanicoDAO mDB = new MecanicoDAO();
        PreparedStatement pst;
        String sql ="SELECT * FROM requisicao WHERE data_emisssao=? AND hora_emissao=? AND valor=?";
        pst =conn.prepareStatement(sql);
        pst.setString(1,data);
        pst.setString(2,hora);
        pst.setDouble(3,valor);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
        r.setId(rs.getInt("id"));
        r.setDataEmissao(rs.getString("data_emissao"));
        r.setHoraEmissao(rs.getString("hora_emissao"));
        r.setValor(rs.getDouble("valor"));
        r.setCpfMecanico(rs.getString("cpf_mecanico"));
        pDB.conectar();
        r.setProdutos(pDB.produtosRequisicao(r.getId()));
        pDB.desconectar();
        mDB.conectar();
        r.setMecanico(mDB.carregaPorCpf(r.getCpfMecanico()));
        mDB.desconectar();
        }
        return r;

    }

        public ArrayList<Requisicao> listar() throws SQLException, Exception{
        ArrayList<Requisicao> lista = new ArrayList<Requisicao>();
        Requisicao r = new Requisicao();
        ProdutoDAO pDB = new ProdutoDAO();
        MecanicoDAO mDB = new MecanicoDAO();
        PreparedStatement pst;
        String sql ="SELECT * FROM requisicao";
        pst =conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
        r.setId(rs.getInt("id"));
        r.setDataEmissao(rs.getString("data_emissao"));
        r.setHoraEmissao(rs.getString("hora_emissao"));
        r.setValor(rs.getDouble("valor"));
        r.setCpfMecanico(rs.getString("cpf_mecanico"));
        pDB.conectar();
        r.setProdutos(pDB.produtosRequisicao(r.getId()));
        pDB.desconectar();
        mDB.conectar();
        r.setMecanico(mDB.carregaPorCpf(r.getCpfMecanico()));
        mDB.desconectar();
        lista.add(r);
        }
        return lista;

    }

        public ArrayList<Requisicao> requisicoesMecanico(String cpf_mecanico) throws SQLException, Exception {

        ArrayList<Requisicao> lista = new ArrayList<Requisicao>();
        ProdutoDAO pDB = new ProdutoDAO();
        PreparedStatement pst;
        String sql = "SELECT * FROM requisicao WHERE cpf_mecanico=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1,cpf_mecanico);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Requisicao r = new Requisicao();
            r.setId(rs.getInt("id"));
            r.setDataEmissao(rs.getString("data_emissao"));
            r.setHoraEmissao(rs.getString("hora_emissao"));
            r.setValor(rs.getDouble("valor"));
            r.setCpfMecanico(rs.getString("cpf_mecanico"));
            pDB.conectar();
            r.setProdutos(pDB.produtosRequisicao(r.getId()));
            pDB.desconectar();
            lista.add(r);
        }
        return lista;

    }

}
