package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.DataBaseDAO;
import modelo.Mecanico;

public class MecanicoDAO extends DataBaseDAO{

    public MecanicoDAO() throws Exception {
    }

    public void inserir(Mecanico me) throws SQLException{

        PreparedStatement pst;
        String sql ="INSERT INTO mecanico(cpf,nome,oficina,telefone) VALUES(?,?,?,?)";
        pst =conn.prepareStatement(sql);
        pst.setString(1,me.getCpf());
        pst.setString(2,me.getNome());
        pst.setString(3,me.getOficina());
        pst.setString(4,me.getTelefone());
        
        pst.execute();

    }
    
    public ArrayList<Mecanico> listar() throws SQLException, Exception{
        
        MecanicoDAO meDB =new MecanicoDAO();
        ArrayList<Mecanico> lista = new ArrayList<Mecanico>();
        PreparedStatement pst;
        String sql = "SELECT * FROM mecanico";
        pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            meDB.conectar();
            Mecanico me = new Mecanico(rs.getString("cpf"), rs.getString("oficina"), rs.getString("nome"),rs.getString("telefone"));
            meDB.desconectar();
            lista.add(me);
        }
        return lista;

    }

    public void excluir(Mecanico me) throws SQLException{

        PreparedStatement pst;
        String sql ="DELETE FROM mecanico WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setString(1,me.getCpf());
        pst.execute();

    }

    public Mecanico carregaPorCpf(String cpf) throws SQLException, Exception{
        Mecanico me = new Mecanico();
        MecanicoDAO meDB = new MecanicoDAO();
        PreparedStatement pst;
        String sql ="SELECT * FROM mecanico WHERE cpf=?";
        pst =conn.prepareStatement(sql);
        pst.setString(1,cpf);
        ResultSet rs = pst.executeQuery();
        meDB.desconectar();
        }
        return me;

    }

    public void alterar(Mecanico me) throws SQLException{

        PreparedStatement pst;
        String sql ="UPDATE mecanico SET cpf=?, nome=?, oficina=?,telefone=?  WHERE cpf=?";
        pst =conn.prepareStatement(sql);
        pst.setString(1,me.getCpf());
        pst.setString(2,me.getNome());
        pst.setString(3,me.getOficina());
        pst.setString(4,me.getTelefone());
        pst.execute();
     }


}
