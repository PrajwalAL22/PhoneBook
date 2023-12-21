package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.entity.User;

public class UserDAO {
	
	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean userRegister(User u) {
		
		boolean f = false;
		
		try {
			String sql = "insert into users values (ID_Increment.nextval,?,?,?)";
			
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, u.getName());
			psmt.setString(2, u.getEmail());
			psmt.setString(3, u.getPassword());
			
			int i = psmt.executeUpdate();
			
			if(i==1) {
				f = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User loginUser(String email,String password) {
		
		User user = null;
		
		
		try {
			String query = "select * from users where EMAIL = ? and PASSWORD = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			
			psmt.setString(1, email);
			psmt.setString(2, password);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				user = new User(rs.getString(2),rs.getString(3),rs.getString(4));
				user.setId(rs.getInt(1));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;	
	}
	
}