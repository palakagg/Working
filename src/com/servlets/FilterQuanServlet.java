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

import com.beans.Transaction;
import com.operations.TransactionOperations;
import com.operations.impl.TransactionOperationsImpl;

/**
 * Servlet implementation class FilterQuanServlet
 */
@WebServlet("/filterquan")
public class FilterQuanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilterQuanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		TransactionOperations top1 = new TransactionOperationsImpl();
		List<Transaction> trans1 = top1.filterquantity();
		HttpSession session2=request.getSession(false);
		request.setAttribute("transactions",trans1);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
		dispatcher.forward(request, response);
	}

}
