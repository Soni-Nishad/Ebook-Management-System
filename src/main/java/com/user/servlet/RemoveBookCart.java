package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.CartDAOImpl;

@WebServlet("/remove_book")

public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int cid = Integer.parseInt(req.getParameter("cid"));
		CartDAOImpl dao1 = new CartDAOImpl(DBconnect.getCon());
		boolean f = dao1.deleteBook(bid, uid, cid);
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Book Removed from Cart");
			resp.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("failedMsg", "Something wrong on server");
			resp.sendRedirect("checkout.jsp");
		}
	}
	
	

}
