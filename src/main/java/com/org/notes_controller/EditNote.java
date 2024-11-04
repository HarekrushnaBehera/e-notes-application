package com.org.notes_controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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

@WebServlet("/editnote")
public class EditNote extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int note_id = Integer.parseInt(req.getParameter("nid"));
		String title = req.getParameter("title");
		String desc = req.getParameter("desc");
		
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatobj = DateTimeFormatter.ofPattern("dd-MM-yy HH:mm");
		String time = now.format(formatobj);
		
		Notes notes = new Notes();
		notes.setId(note_id);
		notes.setContent(desc);
		notes.setTime(time);
		notes.setTitle(title);
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("userObj");
		
		List<Notes> list = new ArrayList<Notes>();
		list.add(notes);
		
		user.setNote(list);
		notes.setUser(user);
		
		UserDao udao = new UserDao();
		udao.saveAndUpdateUser(user);
		
		session.setAttribute("update_msg", "Note Updated Successfully");
		res.sendRedirect("notes.jsp");
	}
}
