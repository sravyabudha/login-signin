package com.iberrylogin.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iberry.login.bean.contactBook;
import com.iberrylogin.dao.ContactBookDAO;

/**
 * Servlet implementation class contactbookServet
 */
@WebServlet("/contactbookServet")
public class contactbookServet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contactbookServet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("newData");
		String tel=request.getParameter("telno");
		String dob=request.getParameter("dob");
		String address=request.getParameter("address");
		String website=request.getParameter("website");
		String cname=request.getParameter("companyname");
		String landlineno=request.getParameter("landlineno");
		contactBook contact=new contactBook(name, tel, dob, address, website, cname, landlineno);
		boolean co=ContactBookDAO.loginValidate(contact);
		if (co==true)
		{
			System.out.println(1);
		}
		doGet(request, response);
	}

}
