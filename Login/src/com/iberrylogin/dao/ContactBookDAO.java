package com.iberrylogin.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.iberry.login.bean.contactBook;
import com.iberry.login.bean.userLogin;

public class ContactBookDAO 
{
	private static ResultSet rs;
	private static PreparedStatement pst;
	private static boolean status;

	public static Connection getConnection()
	{
		String url="jdbc:mysql://localhost:3306/?";
		//@SuppressWarnings("unused")
		//String dbName="useridschema";
		String driver="com.mysql.jdbc.Driver";
		String user="root";
		String password="1234";
		java.sql.Connection conn=null;
		try
		{
			Class.forName(driver).newInstance();
			conn=DriverManager.getConnection(url, user, password);
		}
		catch(Exception e)
		{
			System.out.println("SQL Error "+e);
		}
		return (Connection)conn;
	}

public static boolean loginValidate(contactBook contact)
{
	//System.out.println("In Validatees");
	try
	{
		Connection conn=userDAO.getConnection();
		System.out.println("Conn "+conn);
		pst = (PreparedStatement)conn.prepareStatement
		("insert into useridschema.contactbook (name, address, dob, tel, landlineno, website, cname) values(?,?,?,?,?,?,?)");
		
		pst.setString(1,contact.getName());
		pst.setString(2,contact.getAddress());
		pst.setString(3,contact.getDob());
		pst.setString(4,contact.getTelno());
		pst.setString(5,contact.getLandlineno());
		pst.setString(6,contact.getWebsite());
		pst.setString(7,contact.getCompanyName());
		
		rs = pst.executeQuery();
		status=rs.next();
		//System.out.println("Status is"+status);
		System.out.println(status);
		conn.close();
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
	return status;
}
}
