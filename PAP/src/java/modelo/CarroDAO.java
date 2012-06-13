package modelo;

import java.sql.PreparedStatement;
import java.sql.SQLException;

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


}
