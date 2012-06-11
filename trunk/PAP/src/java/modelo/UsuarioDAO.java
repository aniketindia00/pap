package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsuarioDAO extends DataBaseDAO {

    public UsuarioDAO() throws Exception {
    }

    public void inserir(Usuario u) throws SQLException{

        PreparedStatement pst;
        String sql = "INSERT INTO usuario (id_perfil,nome,login,senha,telefone) values(?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,u.getIdPerfil());
        pst.setString(2, u.getNome());
        pst.setString(3, u.getLogin());
        pst.setString(4, u.getSenha());
        pst.setString(5, u.getTelefone());
        pst.execute();

    }

    public ArrayList<Usuario> listar() throws SQLException, Exception{
        
        PerfilDAO pDB =new PerfilDAO();
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        PreparedStatement pst;
        String sql = "SELECT * FROM usuario";
        pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Usuario u = new Usuario();
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setLogin(rs.getString("login"));
                u.setSenha(rs.getString("senha"));
                u.setIdPerfil(rs.getInt("id_perfil"));
                u.setTelefone(rs.getString("telefone"));
                pDB.conectar();
                u.setPerfil(pDB.carregaPorId(rs.getInt("id_perfil")));
                pDB.desconectar();
            lista.add(u);
        }
        return lista;

    }

    public Usuario logar(String user,String senha) throws SQLException,Exception {
        PerfilDAO pDB =new PerfilDAO();
        MD5Encrypter md5 = new MD5Encrypter();
        PreparedStatement pst;
        String sql = "SELECT * FROM usuario WHERE login=?";
        pst=conn.prepareStatement(sql);
        pst.setString(1,user);
        ResultSet rs = pst.executeQuery();
        Usuario u = new Usuario();
        if(rs.next()){
            if(md5.encryptMD5(senha).equals(rs.getString("senha"))){
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setLogin(rs.getString("login"));
                u.setIdPerfil(rs.getInt("id_perfil"));
                u.setTelefone(rs.getString("telefone"));
                pDB.conectar();
                u.setPerfil(pDB.carregaPorId(rs.getInt("id_perfil")));
                pDB.desconectar();
            }
        }


        return u;
    }

    public void alterar(Usuario u) throws SQLException{

        PreparedStatement pst;
        String sql ="UPDATE usuario SET nome=?, login=?, senha=?, telefone=?, id_perfil=?  WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setString(1, u.getNome());
        pst.setString(2, u.getLogin());
        pst.setString(3, u.getSenha());
        pst.setString(4, u.getTelefone());
        pst.setInt(5, u.getIdPerfil());
        pst.setInt(6,u.getId());
        pst.execute();

    }


        public Usuario carregaPorId(int id) throws SQLException, Exception{
        Usuario u = new Usuario();
        PerfilDAO pDB = new PerfilDAO();
        PreparedStatement pst;
        String sql ="SELECT * FROM usuario WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,id);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
        u.setId(rs.getInt("id"));
        u.setNome(rs.getString("nome"));
        u.setLogin(rs.getString("login"));
        u.setSenha(rs.getString("senha"));
        u.setIdPerfil(rs.getInt("id_perfil"));
        u.setTelefone(rs.getString("telefone"));
        pDB.conectar();
        u.setPerfil(pDB.carregaPorId(rs.getInt("id_perfil")));
        pDB.desconectar();
        }
        return u;

    }

    public void excluir(Usuario u) throws SQLException{

        PreparedStatement pst;
        String sql ="DELETE FROM usuario WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,u.getId());
        pst.execute();

    }

    public boolean temPermissao(String uri,String context, Usuario user){
        boolean result = false;
        String path = null;
        for(Menu m:user.getPerfil().getMenus()){
        path = context +"/"+ m.getLink();
        if(path.equals(uri)){
            result = true;
        }
        }
        return result;
    }


    
}


