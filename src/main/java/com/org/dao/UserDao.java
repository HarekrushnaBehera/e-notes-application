package com.org.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.org.dto.User;
import com.org.utilities.Helper;

public class UserDao {
	
	public void saveAndUpdateUser(User user) {
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		et.begin();
		em.merge(user);
		et.commit();
	}
	
	
	public User fetchUserByEmailAndPassword(String email, String password) {
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("select u from User u where u.email=?1 and u.password=?2");
		query.setParameter(1, email);
		query.setParameter(2, password);
		List<User> list = query.getResultList();
		
		if (list.isEmpty())
			return null;
		return list.get(0);
	}
	
	
	public void deleteUserById(int id) {
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		User user = em.find(User.class, id);
		et.begin();
		em.remove(user);
		et.commit();
	}
	
	
	public User fetchUserById(int id) {
		EntityManagerFactory emf = Helper.getEMF();
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("select u from User u where u.id=?1");
		query.setParameter(1, id);
		List<User> list = query.getResultList();
		
		if (list.isEmpty())
			return null;
		return list.get(0);
	}
}
