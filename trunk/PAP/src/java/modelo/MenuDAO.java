package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MenuDAO extends DataBaseDAO {

    public MenuDAO() throws Exception {
    }

    public void inserir(Menu m) throws SQLException{

        PreparedStatement pst;
        String sql = "INSERT INTO menu (menu,link,icone) values(?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1,m.getMenu());
        pst.setString(2, m.getLink());
        pst.setString(3, m.getIcone());
        pst.execute();

    }

    public ArrayList<Menu> listar() throws SQLException{

        ArrayList<Menu> lista = new ArrayList<Menu>();
        PreparedStatement pst;
        String sql = "SELECT * FROM menu";
        pst = conn.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Menu m = new Menu(rs.getInt("id"),rs.getString("menu"),rs.getString("link"),rs.getString("icone"));
            lista.add(m);
        }
        return lista;

    }

    public ArrayList<Menu> menusPerfil(int id_perfil) throws SQLException {

        ArrayList<Menu> lista = new ArrayList<Menu>();
        PreparedStatement pst;
        String sql = "SELECT m.* FROM menu as m, "
                + "menu_perfil as mp "
                + "WHERE mp.id_perfil=? "
                + "AND mp.id_menu = m.id";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_perfil);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Menu m = new Menu(rs.getInt("id"),rs.getString("menu"),rs.getString("link"),rs.getString("icone"));
            lista.add(m);
        }
        return lista;

    }

    public ArrayList<Menu> menusNaoPerfil(int id_perfil) throws SQLException {

        ArrayList<Menu> lista = new ArrayList<Menu>();
        PreparedStatement pst;
        String sql = "SELECT * FROM menu as m WHERE id NOT IN(SELECT id_menu FROM menu_perfil WHERE id_perfil=?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_perfil);
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            Menu m = new Menu(rs.getInt("id"),rs.getString("menu"),rs.getString("link"),rs.getString("icone"));
            lista.add(m);
        }
        return lista;

    }

    public void alterar(Menu m) throws SQLException{

        PreparedStatement pst;
        String sql ="UPDATE menu SET menu=?, link=?, icone=?  WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setString(1,m.getMenu());
        pst.setString(2,m.getLink());
        pst.setString(3,m.getIcone());
        pst.setInt(4,m.getId());
        pst.execute();

    }
    
    public Menu carregaPorId(int id) throws SQLException{
        Menu m = new Menu();
        PreparedStatement pst;
        String sql ="SELECT * FROM menu WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,id);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
        m.setId(rs.getInt("id"));
        m.setMenu(rs.getString("menu"));
        m.setLink(rs.getString("link"));
        m.setIcone(rs.getString("icone"));
        }
        return m;

    }

    public void excluir(Menu m) throws SQLException{

        PreparedStatement pst;
        String sql ="DELETE FROM menu WHERE id=?";
        pst =conn.prepareStatement(sql);
        pst.setInt(1,m.getId());
        pst.execute();

    }

    public void vincularMenu(int id_menu, int id_perfil) throws SQLException{

        PreparedStatement pst;
        String sql = "INSERT INTO menu_perfil (id_menu,id_perfil) values(?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_menu);
        pst.setInt(2,id_perfil);
        pst.execute();

    }

    public void desvincularMenu(int id_menu, int id_perfil) throws SQLException{

        PreparedStatement pst;
        String sql = "DELETE FROM menu_perfil WHERE id_menu=? AND id_perfil=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1,id_menu);
        pst.setInt(2,id_perfil);
        pst.execute();

    }


}
