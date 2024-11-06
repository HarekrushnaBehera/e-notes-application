package com.org.user_controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/changepwd")
public class ChangePassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getParameter("email");
		System.out.println("changed");
		Properties p = new Properties();
		p.setProperty("mail.smtp.host", "smtp.gmail.com");
		p.setProperty("mail.smtp.port", "465");
		p.setProperty("mail.smtp.ssl.enable", "true");
		p.setProperty("mail.smtp.auth", "true");
		
		Session session = Session.getInstance(p, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("beheraharekrushna593@gmail.com", "djew molg gslg mmgm");
			}
		});

		session.setDebug(true);
		
		MimeMessage message = new MimeMessage(session);
		
		HttpSession session2 = req.getSession();

		try {
			message.setFrom("beheraharekrushna593@gmail.com");
			message.addRecipient(RecipientType.TO, new InternetAddress(email));
			message.setSubject("Here is your One Time Password for changing password in E-Notes Application. It is valid only for 5 minutes.");
			
			Random r = new Random();
			String gen_otp = ""+r.nextInt(9)+r.nextInt(9)+r.nextInt(9)+r.nextInt(9)+r.nextInt(9)+r.nextInt(9);
			int otp = Integer.parseInt(gen_otp);
			session2.setAttribute("genotp", otp);
			
			message.setText("Your 6-digit OTP is " + otp);

			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
