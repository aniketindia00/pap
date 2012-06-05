package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseDAO {

    public static final String DRIVER = "com.mysql.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/java3_vesp";
    public static final String SENHA = "root";
    public static final String USER = "root";
    protected Connection conn;

    public DataBaseDAO() throws Exception {
        Class.forName(DRIVER);
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());

    }

    public void conectar() throws SQLException {
        conn = DriverManager.getConnection(URL, USER, SENHA);
    }

    public void desconectar() throws SQLException {
        if(conn!=null){
            conn.close();
            DriverManager.deregisterDriver(new com.mysql.jdbc.Driver());
        }
        
    }
}
