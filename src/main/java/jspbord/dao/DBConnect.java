package jspbord.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    public Connection conn = null;
    private String url = "jdbc:mysql://localhost:3306/javaboard";
    private String option = "?useUnicode=true&characterEncoding=utf-8";
    private String user = "root";
    private String pass = "20001109";
    public DBConnect() {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			this.conn = DriverManager.getConnection(url+option, user, pass);
			System.out.println("db���� ����");
		} catch (ClassNotFoundException e) {
		
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
    }
	
}
