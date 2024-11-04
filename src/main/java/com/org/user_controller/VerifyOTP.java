package com.org.user_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/checkotp")
public class VerifyOTP extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int user_otp = Integer.parseInt(req.getParameter("otp"));
		
		HttpSession session = req.getSession();
		int gen_otp = (int) session.getAttribute("otp");
		if (user_otp == gen_otp) {
			session.setAttribute("changed", "Password Updated Successfully");
			res.sendRedirect("profile.jsp");
		} else {
			session.setAttribute("mismatch", "Invalid OTP");
		}
	}
}
