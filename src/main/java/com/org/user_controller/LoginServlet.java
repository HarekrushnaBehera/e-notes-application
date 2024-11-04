package com.org.user_controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.Notes;
import com.org.dto.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getParameter("email");
		String pwd = req.getParameter("password");
		
		UserDao udao = new UserDao();
		User user = udao.fetchUserByEmailAndPassword(email, pwd);
		HttpSession session = req.getSession();
		if (user != null) {
			session.setAttribute("userObj", user);
			res.sendRedirect("home.jsp");
		} else {
			session.setAttribute("msg", "Invalid Credentials");
			res.sendRedirect("login.jsp");
		}
	}
}
