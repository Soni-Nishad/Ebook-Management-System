package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.UserDAOImp1;
import com.entity.User;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phone");
			String pass = req.getParameter("password");			
			
			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			
			HttpSession session = req.getSession();
			UserDAOImp1  dao1 = new UserDAOImp1(DBconnect.getCon());
			boolean f = dao1.checkPassword(id, pass);
			if(f)
			{
				boolean f2 = dao1.updateProfile(us);
				if(f2) {
					session.setAttribute("succMsg", " Profile Update Successfully...");
					resp.sendRedirect("edit_profile.jsp");
				}else {
					session.setAttribute("failedMsg", "Something wrong on server... ");
					resp.sendRedirect("edit_profile.jsp");
				}
			}else {
				session.setAttribute("failedMsg", "Your Password is incorrect");
				resp.sendRedirect("edit_profile.jsp");
			}
			
			
			}catch(Exception e)
			{
				e.printStackTrace();
			}
	}

}

