package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Company;
import com.beans.Manages;
import com.operations.CompanyOperations;
import com.operations.ManagesOperations;
import com.operations.impl.CompanyOperationsImpl;
import com.operations.impl.ManagesOperationsImpl;

/**
 * Servlet implementation class HistoryServlet
 */
@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CompanyOperations cop = new CompanyOperationsImpl();
		
		List <Company> c = cop.findAll();
		ManagesOperations mop = new ManagesOperationsImpl();
		List <Manages> m = mop.findAll();
		request.setAttribute("table1", c);
		request.setAttribute("table2", m);
		HttpSession session2=request.getSession(false);
		RequestDispatcher dispatcher = request.getRequestDispatcher("history.jsp");
		dispatcher.forward(request, response);
	}

}
