package util;


import java.sql.Connection;
import java.sql.DriverManager;

public class BancoDados {
    
    public static Connection getConexao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_senai"
                    + "?useTimezone=true&serverTimezone=America/Sao_Paulo&autoReconnect=true&useSSL=false",
                    "root", "123456");
            return conn;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
}