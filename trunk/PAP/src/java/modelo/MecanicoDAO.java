package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


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

        ArrayList<Mecanico> lista = new ArrayList<Mecanico>();
        PreparedStatement pst;
        String sql = "SELECT * FROM mecanico";
        pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Mecanico me = new Mecanico(rs.getString("cpf"), rs.getString("oficina"), rs.getString("nome"),rs.getString("telefone"));
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
        PreparedStatement pst;
        String sql ="SELECT * FROM mecanico WHERE cpf=?";
        pst =conn.prepareStatement(sql);
        pst.setString(1,cpf);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
        me.setCpf(rs.getString("cpf"));
        me.setOficina(rs.getString("oficina"));
        me.setNome(rs.getString("nome"));
        me.setTelefone(rs.getString("telefone"));

       }
        return me;

    }

    public void alterar(Mecanico me) throws SQLException{

        PreparedStatement pst;
        String sql ="UPDATE mecanico SET nome=?, oficina=?,telefone=?  WHERE cpf=?";
        pst =conn.prepareStatement(sql);
        pst.setString(1,me.getNome());
        pst.setString(2,me.getOficina());
        pst.setString(3,me.getTelefone());
        pst.setString(4,me.getCpf());
        pst.execute();
     }
}
