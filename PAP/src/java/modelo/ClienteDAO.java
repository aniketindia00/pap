package modelo;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ClienteDAO extends DataBaseDAO {

    public ClienteDAO() throws Exception {
    }

        public void inserir(Cliente c) throws SQLException{

        PreparedStatement pst;
        String sql ="INSERT INTO cliente(perfil) VALUES(?)";
        pst =conn.prepareStatement(sql);
        pst.setString(1,p.getPerfil());
        pst.execute();

    }
}
