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
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter out=response.getWriter();
		
		String un=request.getParameter("username1");
		String pas=request.getParameter("password1");
		
		userLogin user1=new userLogin(un, pas);
		
		boolean stat=userDAO.loginValidate(user1);
		System.out.println("Statusss "+stat);
		
		if(stat==true)
		{
			System.out.println("User Name already exists");
			RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
			rd.include(request, response);
			out.close();
		}
		else
		{
			System.out.println("Done");
			userDAO.logoutValidate(user1);
			RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
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
