package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CarroDAO extends DataBaseDAO {

    public CarroDAO() throws Exception {
    }

    public void inserir(Carro c) throws SQLException{
        PreparedStatement pst;
        String sql = "INSERT INTO carro (id_cliente,modelo,ano,marca) values(?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,c.getIdCliente());
        pst.setString(2, c.getModelo());
        pst.setString(3, c.getAno());
        pst.setString(4, c.getMarca());
        pst.execute();
    }

    public ArrayList<Carro> listar() throws SQLException{
        ArrayList<Carro> lista = new ArrayList<Carro>();
        PreparedStatement pst;
        String sql = "SELECT * FROM usuario";
        pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Carro c = new Carro();
                c.setId(rs.getInt("id"));
                c.setIdCliente(rs.getInt("id_cliente"));
                c.setModelo(rs.getString("modelo"));
                c.setAno(rs.getString("ano"));
                c.setMarca(rs.getString("marca"));
            lista.add(c);
        }
        return lista;
    }

    public void alterar(Carro c) throws SQLException{

        PreparedStatement pst;
        String sql ="UPDATE carro SET id_cliente=?, modelo=?, ano=?, telefone=?, id_perfil=?  WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1, c.getIdCliente());
        pst.setString(2, c.getModelo());
        pst.setString(3, c.getAno());
        pst.setString(4, c.getMarca());
        pst.setInt(5,c.getId());
        pst.execute();

    }

        public Carro carregaPorId(int id) throws SQLException{
        Carro c = new Carro();
        PreparedStatement pst;
        String sql ="SELECT * FROM carro WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,id);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
            c.setId(rs.getInt("id"));
            c.setIdCliente(rs.getInt("id_cliente"));
            c.setModelo(rs.getString("modelo"));
            c.setAno(rs.getString("ano"));
            c.setMarca(rs.getString("marca"));
        }
        return c;

    }

        public Carro carregaPorModeloAnoMarca(String modelo, String ano, String marca) throws SQLException{
        Carro c = new Carro();
        PreparedStatement pst;
        String sql ="SELECT * FROM carro WHERE modelo=? AND ano=? AND  marca=?";
        pst =conn.prepareStatement(sql);
        pst.setString(1,modelo);
        pst.setString(2,ano);
        pst.setString(3,marca);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
            c.setId(rs.getInt("id"));
            c.setIdCliente(rs.getInt("id_cliente"));
            c.setModelo(rs.getString("modelo"));
            c.setAno(rs.getString("ano"));
            c.setMarca(rs.getString("marca"));
        }
        return c;

    }

        public void excluir(Carro c) throws SQLException{

        PreparedStatement pst;
        String sql ="DELETE FROM carro WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,c.getId());
        pst.execute();

    }

    public ArrayList<Carro> carrosCliente(int id_cliente) throws SQLException {

        ArrayList<Carro> lista = new ArrayList<Carro>();
        PreparedStatement pst;
        String sql = "SELECT * FROM carro WHERE id_cliente=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_cliente);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Carro c = new Carro(rs.getInt("id"),rs.getString("modelo"),rs.getString("ano"),rs.getString("marca"),rs.getInt("id_cliente"));
            lista.add(c);
        }
        return lista;

    }


}
