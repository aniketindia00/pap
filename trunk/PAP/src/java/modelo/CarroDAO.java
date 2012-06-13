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


}
