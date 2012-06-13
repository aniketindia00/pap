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
public class ProdutoDAO extends DataBaseDAO {

    public ProdutoDAO() throws Exception {
    }

    public void inserir(Produto pd) throws SQLException{

        PreparedStatement pst;
        String sql = "INSERT INTO produto (id_produto, nome, cod_barras, preco) values(?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,pd.getId());
        pst.setString(2, pd.getNome());
        pst.setString(3, pd.getCodBarras());
        pst.setDouble(3, pd.getPreco());
        pst.execute();

    }

    public ArrayList<Produto> listar() throws SQLException{

        ArrayList<Produto> lista = new ArrayList<Produto>();
        PreparedStatement pst;
        String sql = "SELECT * FROM produto";
        pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Produto pd = new Produto(rs.getInt("id_produto"),rs.getString("nome"),rs.getString("cod_barras"),rs.getDouble("preco"));
            lista.add(pd);
        }
        return lista;

    }

    public void alterar(Produto pd) throws SQLException{

        PreparedStatement pst;
        String sql ="UPDATE produto SET nome=?, cod_barras=?, preco=?  WHERE id_produto=?";
        pst =conn.prepareStatement(sql);
        pst.setString(1,pd.getNome());
        pst.setString(2,pd.getCodBarras());
        pst.setDouble(3,pd.getPreco());
        pst.setInt(4,pd.getId());
        pst.execute();

    }

    public Produto carregaPorId(int id) throws SQLException{
        Produto pd = new Produto();
        PreparedStatement pst;
        String sql ="SELECT * FROM menu WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,id);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
        pd.setId(rs.getInt("id_produto"));
        pd.setNome(rs.getString("nome"));
        pd.setCodBarras(rs.getString("cod_barras"));
        pd.setPreco(rs.getDouble("preco"));
        }
        return pd;

    }

    public void excluir(Produto pd) throws SQLException{

        PreparedStatement pst;
        String sql ="DELETE FROM produto WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,pd.getId());
        pst.execute();

    }

    public void vincularProduto(int id_produto, int id_orcamento) throws SQLException{

        PreparedStatement pst;
        String sql = "INSERT INTO orcamento_produto (id_produto,id_orcamento) values(?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_produto);
        pst.setInt(2,id_orcamento);
        pst.execute();

    }

    public void desvincularProduto(int id_produto, int id_orcamento) throws SQLException{

        PreparedStatement pst;
        String sql = "DELETE FROM orcamento_produto WHERE id_produto=? AND id_orcamento=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_produto);
        pst.setInt(2,id_orcamento);
        pst.execute();

    }

    /*
    public ArrayList<Produto> menusPerfil(int id_perfil) throws SQLException {

        ArrayList<Produto> lista = new ArrayList<Produto>();
        PreparedStatement pst;
        String sql = "SELECT m.* FROM menu as m, "
                + "menu_perfil as mp "
                + "WHERE mp.id_perfil=? "
                + "AND mp.id_menu = m.id";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_perfil);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Produto m = new Produto(rs.getInt("id"),rs.getString("menu"),rs.getString("link"),rs.getString("icone"));
            lista.add(m);
        }
        return lista;

    }

    public ArrayList<Produto> menusNaoPerfil(int id_perfil) throws SQLException {

        ArrayList<Produto> lista = new ArrayList<Produto>();
        PreparedStatement pst;
        String sql = "SELECT * FROM menu as m WHERE id NOT IN(SELECT id_menu FROM menu_perfil WHERE id_perfil=?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_perfil);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Produto m = new Produto(rs.getInt("id"),rs.getString("menu"),rs.getString("link"),rs.getString("icone"));
            lista.add(m);
        }
        return lista;

    }

    public void vincularMenu(int id_menu, int id_perfil) throws SQLException{

        PreparedStatement pst;
        String sql = "INSERT INTO menu_perfil (id_menu,id_perfil) values(?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_menu);
        pst.setInt(2,id_perfil);
        pst.execute();

    }

    public void desvincularMenu(int id_menu, int id_perfil) throws SQLException{

        PreparedStatement pst;
        String sql = "DELETE FROM menu_perfil WHERE id_menu=? AND id_perfil=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_menu);
        pst.setInt(2,id_perfil);
        pst.execute();

    }*/

}
