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
public class OrcamentoDAO extends DataBaseDAO{

    public OrcamentoDAO() throws Exception {
    }

    public void inserir(Orcamento o) throws SQLException{

        PreparedStatement pst;
        String sql = "INSERT INTO orcamento (id, id_cliente, data_emissao, hora_emissao, valor) values(?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,o.getId());
        pst.setInt(2, o.getIdCliente());
        pst.setString(3, o.getDataEmissao());
        pst.setString(4, o.getDataEmissao());
        pst.setDouble(5, o.getValor());
        pst.execute();

    }

    public void alterar(Orcamento o) throws SQLException{

        PreparedStatement pst;
        String sql ="UPDATE orcamento SET id_cliente=?, data_emissao=?, hora_emissao=?, valor=?  WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1, o.getIdCliente());
        pst.setString(2, o.getDataEmissao());
        pst.setString(3, o.getHoraEmissao());
        pst.setDouble(4, o.getValor());
        pst.setInt(5, o.getId());
        pst.execute();

    }



    public void excluir(Orcamento o) throws SQLException{

        PreparedStatement pst;
        String sql ="DELETE FROM orcamento WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1, o.getId());
        pst.execute();

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

    }

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
    */
    

}
