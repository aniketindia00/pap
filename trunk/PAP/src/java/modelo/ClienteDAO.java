package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClienteDAO extends DataBaseDAO {

    public ClienteDAO() throws Exception {
    }

    public void inserir(Cliente c) throws SQLException{
        PreparedStatement pst;
        String sql ="INSERT INTO cliente(nome,telefone) VALUES(?,?)";
        pst =conn.prepareStatement(sql);
        pst.setString(1,c.getNome());
        pst.setString(2,c.getTelefone());
        pst.execute();

    }
    public ArrayList<Cliente> listar() throws SQLException, Exception{
        CarroDAO cDB = new CarroDAO();
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        PreparedStatement pst;
        String sql = "SELECT * FROM cliente";
        pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setTelefone(rs.getString("telefone"));
            cDB.conectar();
            c.setCarros(cDB.carrosCliente(c.getId()));
            cDB.desconectar();
            lista.add(c);
        }
        return lista;

    }

    public Cliente carregaPorId(int id) throws SQLException, Exception{
        Cliente c = new Cliente();
        CarroDAO cDB = new CarroDAO();
        PreparedStatement pst;
        String sql ="SELECT * FROM cliente WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,id);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setTelefone(rs.getString("telefone"));
            cDB.conectar();
            c.setCarros(cDB.carrosCliente(c.getId()));
            cDB.desconectar();
        }
        return c;

    }

    public void excluir(Cliente c) throws SQLException{

        PreparedStatement pst;
        String sql ="DELETE FROM cliente WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,c.getId());
        pst.execute();

    }

    public void alterar(Cliente c) throws SQLException{

        PreparedStatement pst;
        String sql ="UPDATE cliente SET nome=?, telefone=? WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setString(1,c.getNome());
        pst.setString(2,c.getTelefone());
        pst.setInt(3,c.getId());
        pst.execute();

    }


}
