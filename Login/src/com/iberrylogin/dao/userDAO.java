package com.iberrylogin.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.iberry.login.bean.userLogin;

public class userDAO 
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

	public static boolean loginValidate(userLogin user1)
	{
		//System.out.println("In Validatees");
		try
		{
			Connection conn=userDAO.getConnection();
			System.out.println("Conn "+conn);
			pst = (PreparedStatement)conn.prepareStatement
			("select * from useridschema.userlogin where idUserLogin=? and password=?");
			pst.setString(1,user1.getIdUserLogin());
			pst.setString(2,user1.getPassword());
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
	
	public static boolean logoutValidate(userLogin user1)
	{
		System.out.println("In Validatees");
		try
		{
			Connection conn=userDAO.getConnection();
			System.out.println("Conn "+conn);
			pst = (PreparedStatement)conn.prepareStatement
			("insert into useridschema.userlogin (idUserLogin,password) values(?,?)");
			pst.setString(1,user1.getIdUserLogin());
			System.out.println(user1.getIdUserLogin());
			pst.setString(2,user1.getPassword());
			pst.executeUpdate();
			
			//System.out.println("Status is"+status);
			System.out.println(status);
			conn.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return true;
	}
	
}
