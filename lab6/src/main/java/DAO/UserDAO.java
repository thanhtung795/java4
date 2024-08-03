package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import entity.User;
import utils.JpaUtils;

public class UserDAO {
	private EntityManager em = JpaUtils.getEntityManager();

	public User findById(int id) {
		return em.find(User.class, id);
	}

	public List<User> findByRole(boolean role) {
		String jpql = "Select o from User o where o.admin=:role1";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("role1", role);
		return query.getResultList();
	}

	public List<User> findByKeyWord(String keyword) {
		String jpql = "Select o from User o where o.fullname like ?0";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter(0, keyword);
		return query.getResultList();
	}

	public User findOne(String username, String password) {
		String jpql = "Select o from User o where o.id=:id and o.password=:pass";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("id", username);
		query.setParameter("pass", password);
		return query.getSingleResult();
	}

	public User findByEmail(String email) {
		String jpql = "Select o from User o where o.email=:email";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("email", email);
		return query.getSingleResult();
	}

	public List<User> findPage(int page, int size) {
		String jpql = "Select o from User o";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setFirstResult(page * size);
		query.setMaxResults(size);
		return query.getResultList();
	}

	public int countAll() {
		String jpql = "SELECT COUNT(o) FROM User o";
		Query query = em.createQuery(jpql);
		return ((Long) query.getSingleResult()).intValue();
	}

	public List<User> findAll() {
		String jpql = "Select o from User o";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		return query.getResultList();
	}
}
