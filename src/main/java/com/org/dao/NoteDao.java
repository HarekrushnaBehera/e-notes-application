package com.org.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.org.dto.Notes;
import com.org.dto.User;
import com.org.utilities.Helper;

public class NoteDao {
	
	public List<Notes> fetchNotesByUserId(int id) {
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager em = emf.createEntityManager();
		
		User user = em.find(User.class, id);
		
		return user.getNote();
	}
	
	
	public List<Notes> fetchNotesByTitle(String title) {
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager em = emf.createEntityManager();
		
		Query query = em.createQuery("select n from Notes n where n.title=?1");
		query.setParameter(1, title);
		List<Notes> notes = query.getResultList();
		return notes;
	}
	
	
	public void deleteNotesById(int id) {
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		Notes notes = em.find(Notes.class, id);
		
		et.begin();
		em.remove(notes);
		et.commit();
	}
}
