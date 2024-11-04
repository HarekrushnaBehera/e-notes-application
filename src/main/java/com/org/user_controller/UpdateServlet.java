package com.org.user_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.User;

@WebServlet("/update_profile")
public class UpdateServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("uid"));
		String name = req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		long mobile = Long.parseLong(req.getParameter("mobile"));
		
		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setAge(age);
		user.setEmail(email);
		user.setPassword(pwd);
		user.setMobile(mobile);
		
		UserDao udao = new UserDao();
		udao.saveAndUpdateUser(user);
		
		HttpSession session = req.getSession();
		session.setAttribute("profile_update", "Profile Updated Successfully");
		res.sendRedirect("notes.jsp");
	}
}
