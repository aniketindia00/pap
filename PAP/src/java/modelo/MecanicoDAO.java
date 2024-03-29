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
        String sql ="DELETE FROM mecanico WHERE cpf=?";
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
        me.setNome(rs.getString("nome"));
        me.setOficina(rs.getString("oficina"));
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

    public ArrayList<Mecanico> autocompletar(String query) throws SQLException{
        ArrayList<Mecanico> lista = new ArrayList<Mecanico>();
        PreparedStatement pst;
        query = "%"+query+"%";
        String sql= "SELECT * FROM mecanico WHERE nome LIKE '"+query+"'";
        pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
        Mecanico m = new Mecanico();
        m.setCpf(rs.getString("cpf"));
        m.setNome(rs.getString("nome"));
        m.setOficina(rs.getString("oficina"));
        m.setTelefone(rs.getString("telefone"));
        lista.add(m);
        }
        return lista;
    }

}
