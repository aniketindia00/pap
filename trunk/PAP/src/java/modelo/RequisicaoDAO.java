/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

import java.sql.PreparedStatement;
import java.sql.SQLException;

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
        pst.setString(3, r.getDataEmissao());
        pst.setDouble(3, r.getValor());
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
    /*
    public Orcamento carregaPorId(int id) throws SQLException{
        Orcamento o = new Orcamento();
        PreparedStatement pst;
        String sql ="SELECT * FROM menu WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,id);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
        o.setId(rs.getInt("id_produto"));
        o.setNome(rs.getString("nome"));
        o.setCodBarras(rs.getString("cod_barras"));
        o.setPreco(rs.getDouble("preco"));
        }
        return o;

    }

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
