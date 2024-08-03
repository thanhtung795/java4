package edu.poly.dao;

import java.util.List;

import edu.poly.entity.user;
import edu.poly.utils.JpaUtils;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

public class UserDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	@Override
	protected void finalize() throws Throwable{
		em.close();
		super.finalize();
	}
	
	public user create(user entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw new RuntimeException(e);
			// TODO: handle exception
		}
	}
	
	public user update(user entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
			// TODO: handle exception
		}
	}
	
	public user remove(String id) {
		try {
			em.getTransaction().begin();
			user entity = this.findById(id);
			em.remove(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
			// TODO: handle exception
		}
	}
	
	public user findById(String id) {
		return em.find(user.class, id);
	}
	
	public List<user> findByRole(boolean role) {
		String jpql = "Select o from Users o where o.admin=:role";
		TypedQuery<user> query = em.createQuery(jpql, user.class);
		query.setParameter("role", role);
		List<user> list = query.getResultList();
		return list;
	}
	
	public List<user> findByKeyWord(String keyword) {
		String jpql = "Select o from Users o where o.fullname like ?0";
		TypedQuery<user> query = em.createQuery(jpql, user.class);
		query.setParameter(0, keyword);
		List<user> list = query.getResultList();
		return list;
	}
	
	public user findOne(String username, String password) {
		String jpql = "Select o from Users o where o.id=:id and o.password=:pass";
		TypedQuery<user> query = em.createQuery(jpql, user.class);
		query.setParameter("id", username);
		query.setParameter("pass", password);
		return query.getSingleResult();
	}
	
	public user findByEmail(String email) {
		String jpql = "Select o from Users o where o.email=:email";
		TypedQuery<user> query = em.createQuery(jpql, user.class);
		query.setParameter("email", email);
		return query.getSingleResult();
	}
	
	public List<user> findPage(int page, int size) {
		String jpql = "Select o from Users o";
		TypedQuery<user> query = em.createQuery(jpql, user.class);
		query.setFirstResult(page*size);	
		query.setMaxResults(size);
		List<user> list = query.getResultList();
		return list;
	}
	
	public List<user> findAll(){
		String jpql = "Select o from Users o";
		TypedQuery<user> query = em.createQuery(jpql, user.class);
		List<user> list = query.getResultList();
		return list;
	}
}
