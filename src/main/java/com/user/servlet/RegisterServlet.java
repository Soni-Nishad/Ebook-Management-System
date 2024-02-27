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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phone");
			String pass = req.getParameter("pass");
			String check = req.getParameter("check");			
			
			User us = new User();
			
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(pass);
			
			HttpSession session = req.getSession();
			
			if(check != null)
			{
				UserDAOImp1 dao1 = new UserDAOImp1(DBconnect.getCon());
				boolean f2 = dao1.checkUser(email);	
				if(f2)
				{
					boolean f = dao1.userRegister(us);
					if(f) {
						session.setAttribute("succMsg", " Registeration Successfully...");
						resp.sendRedirect("register.jsp");
					}			
					else {
						session.setAttribute("failedMsg", "Something wrong on server... ");
						resp.sendRedirect("register.jsp");
					}	
				}else {
					session.setAttribute("failedMsg", "User Already Exist Try Another Email id");
					resp.sendRedirect("register.jsp");
				}
			}
			else {
				session.setAttribute("failedMsg", "Please check Agree Terms & Condition ");
				resp.sendRedirect("register.jsp");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
