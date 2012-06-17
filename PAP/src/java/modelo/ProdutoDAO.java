/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author Daniel
 */
public class ProdutoDAO extends DataBaseDAO {

    public ProdutoDAO() throws Exception {
    }

    public void inserir(Produto pd) throws SQLException{

        PreparedStatement pst;
        String sql = "INSERT INTO produto (nome, cod_barras, preco) values(?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, pd.getNome());
        pst.setString(2, pd.getCodBarras());
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
            Produto pd = new Produto(rs.getInt("id"),rs.getString("nome"),rs.getString("cod_barras"),rs.getDouble("preco"));
            lista.add(pd);
        }
        return lista;

    }

    public void alterar(Produto pd) throws SQLException{

        PreparedStatement pst;
        String sql ="UPDATE produto SET nome=?, cod_barras=?, preco=?  WHERE id=?";
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
        String sql ="SELECT * FROM produto WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,id);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
        pd.setId(rs.getInt("id"));
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

    public void vincularProdutoOrcamento(int id_produto, int id_orcamento) throws SQLException{

        PreparedStatement pst;
        String sql = "INSERT INTO orcamento_produto (id_produto,id_orcamento) values(?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_produto);
        pst.setInt(2,id_orcamento);
        pst.execute();

    }

    public void desvincularProdutoOrcamento(int id_produto, int id_orcamento) throws SQLException{

        PreparedStatement pst;
        String sql = "DELETE FROM orcamento_produto WHERE id_produto=? AND id_orcamento=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_produto);
        pst.setInt(2,id_orcamento);
        pst.execute();

    }

    public ArrayList<Produto> produtosOrcamento(int id_orcamento) throws SQLException {

        ArrayList<Produto> lista = new ArrayList<Produto>();
        PreparedStatement pst;
        String sql = "SELECT p.* FROM produto as p, "
                + "produto_orcamento as po "
                + "WHERE po.id_orcamento=? "
                + "AND po.id_produto = p.id";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_orcamento);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Produto p = new Produto(rs.getInt("id"),rs.getString("nome"),rs.getString("cod_barras"),rs.getDouble("preco"));
            lista.add(p);
        }
        return lista;

    }

    public ArrayList<Produto> produtosNaoOrcamento(int id_orcamento) throws SQLException {

        ArrayList<Produto> listaN = new ArrayList<Produto>();
        PreparedStatement pst;
        String sql = "SELECT * FROM produto as p WHERE id NOT IN(SELECT id_produto FROM produto_orcamento WHERE id_orcamento=?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_orcamento);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Produto p = new Produto(rs.getInt("id"),rs.getString("nome"),rs.getString("cod_barras"),rs.getDouble("preco"));
            listaN.add(p);
        }
        return listaN;

    }

    public void vincularProdutoRequisicao(int id_produto, int id_requisicao) throws SQLException{

        PreparedStatement pst;
        String sql = "INSERT INTO requisicao_produto (id_requisicao,id_produto) values(?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_requisicao);
        pst.setInt(2,id_produto);
        pst.execute();

    }

    public void desvincularProdutoRequisicao(int id_produto, int id_requisicao) throws SQLException{

        PreparedStatement pst;
        String sql = "DELETE FROM requisicao_produto WHERE id_produto=? AND id_requisicao=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_produto);
        pst.setInt(2,id_requisicao);
        pst.execute();

    }

    public ArrayList<Produto> produtosRequisicao(int id_requisicao) throws SQLException {

        ArrayList<Produto> lista = new ArrayList<Produto>();
        PreparedStatement pst;
        String sql = "SELECT p.* FROM produto as p, "
                + "produto_requisicao as pr "
                + "WHERE pr.id_requisicao=? "
                + "AND pr.id_produto = p.id";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_requisicao);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Produto p = new Produto(rs.getInt("id"),rs.getString("nome"),rs.getString("cod_barras"),rs.getDouble("preco"));
            lista.add(p);
        }
        return lista;

    }

    public ArrayList<Produto> produtosNaoRequisicao(int id_requisicao) throws SQLException {

        ArrayList<Produto> listaN = new ArrayList<Produto>();
        PreparedStatement pst;
        String sql = "SELECT * FROM produto as p WHERE id NOT IN(SELECT id_produto FROM produto_requisicao WHERE id_requisicao=?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_requisicao);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Produto p = new Produto(rs.getInt("id"),rs.getString("nome"),rs.getString("cod_barras"),rs.getDouble("preco"));
            listaN.add(p);
        }
        return listaN;

    }

    public ArrayList<Produto> listaResumida(int qnt, String coluna, String query) throws SQLException{
        int aux = qnt;
        ArrayList<Produto> lista = new ArrayList<Produto>();
        PreparedStatement pst;
        if(!coluna.equalsIgnoreCase("id")){
        query="%"+query+"%";
        }
        String sql= "SELECT * FROM produto WHERE "+coluna+" LIKE '"+query+"'";
        pst = conn.prepareStatement(sql);
        //pst.setString(1, coluna);
        //pst.setString(2, query);
        ResultSet rs = pst.executeQuery();
        rs.last();
        int rows = rs.getRow();
        if(rows<qnt){
        aux  = rows;
        }
        for(int i = 1; i <= aux; i++){
            rs.absolute(i);
            Produto p = new Produto(rs.getInt("id"),rs.getString("nome"),rs.getString("cod_barras"),rs.getDouble("preco"));
            lista.add(p);
        }
        return lista;
    }


}
