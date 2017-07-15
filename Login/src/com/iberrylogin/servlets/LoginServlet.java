package com.iberrylogin.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iberry.login.bean.userLogin;
import com.iberrylogin.dao.userDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter out=response.getWriter();
		
		String user=request.getParameter("username");
		String pass=request.getParameter("password");
		
		//System.out.println("Details "+user+pass);
		
		userLogin user1=new userLogin(user, pass);
		
		boolean stat=userDAO.loginValidate(user1);
		//System.out.println("Statusss "+stat);
		
		if(stat==true)
		{
			System.out.println("Success");
			RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
			rd.include(request, response);
			out.close();
		}
		else
		{
			System.out.println("Error");
			RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
			rd.include(request, response);
			out.close();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
