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
        String sql = "INSERT INTO requisicao (id, cpf_mecanico, data_emissao, hora_emissao, valor) values(?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,r.getId());
        pst.setString(2, r.getCpfMecanico());
        pst.setString(3, r.getDataEmissao());
        pst.setString(4, r.getHoraEmissao());
        pst.setDouble(5, r.getValor());
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
    /*
    public ArrayList<Orcamento> listar() throws SQLException{

        ArrayList<Orcamento> lista = new ArrayList<Orcamento>();
        PreparedStatement pst;
        String sql = "SELECT * FROM orcamento";
        pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Orcamento o = new Orcamento(rs.getInt("id_produto"),rs.getString("nome"),rs.getString("cod_barras"),rs.getDouble("preco"));
            lista.add(o);
        }
        return lista;

    }*/

}
