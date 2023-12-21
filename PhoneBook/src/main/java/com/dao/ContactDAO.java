package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;

public class ContactDAO {
	
	private Connection conn;

	public ContactDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean saveContact(Contact c) {
		boolean f = false;
		
		try {
			
			String query1 = "insert into UserContacts values(CID_Increment.nextval,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query1);
			psmt.setString(1, c.getName());
			psmt.setString(2, c.getEmailaddress());
			psmt.setString(3, c.getPhone());
			psmt.setString(4, c.getAbout());
			psmt.setInt(5, c.getUserId());
			
			int i = psmt.executeUpdate();
			
			if(i != 0) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<Contact> getAllContacts(int uid) {
		
		List<Contact> list = new ArrayList<Contact>();
		Contact c = null;
		try {
			String query2="select * from UserContacts where userid = ?";
			PreparedStatement psmt = conn.prepareStatement(query2);
			psmt.setInt(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				c = new Contact();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmailaddress(rs.getString(3));
				c.setPhone(rs.getString(4));
				c.setAbout(rs.getString(5));
				c.setUserId(uid);
				list.add(c);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Contact getContactById(int cid) {
		
		Contact c = new Contact();
		
		try {
			
			PreparedStatement psmt = conn.prepareStatement("select * from UserContacts where ID = ?");
			psmt.setInt(1, cid);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmailaddress(rs.getString(3));
				c.setPhone(rs.getString(4));
				c.setAbout(rs.getString(5));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return c;
		
	}
	
	public boolean updateContact(Contact c) {
		
		boolean f = false;
		
		try {
			
			String query1 = "update UserContacts set name=?,emailaddress=?,phone=?,about=? where id = ?";
			PreparedStatement psmt = conn.prepareStatement(query1);
			psmt.setString(1, c.getName());
			psmt.setString(2, c.getEmailaddress());
			psmt.setString(3, c.getPhone());
			psmt.setString(4, c.getAbout());
			psmt.setInt(5, c.getId());
			
			int i = psmt.executeUpdate();
			
			if(i != 0) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	public boolean deleteContact(int id) {
		
		boolean f = false;
		
		try {
			
			String query = "delete from UserContacts where id = ?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, id);
			
			int i = psmt.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
