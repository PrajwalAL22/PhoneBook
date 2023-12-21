package com.conn;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect {
	
	private static Connection conn;
	
	public static Connection getConn(){
		
		try {			
			Class.forName("oracle.jdbc.driver.OracleDriver");                          // LOADING DRIVER
			
			String url = "jdbc:oracle:thin:@LOCALHOST:1522:XE";
			
			conn = DriverManager.getConnection(url, "hr", "root");
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}          //REGISTERING DRIVER AND ESTABLISHING CONNECTION	
		
		System.out.println(conn);;
		return conn;
		
	}

}
