
package com.rays.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.rays.dto.UserDTO;

@Repository
public class UserDAOHibImpl {

	@Autowired
	public SessionFactory sessionFactory;

	public long add(UserDTO dto) throws DataAccessException {
		long pk = (Long) sessionFactory.getCurrentSession().save(dto);
		return pk;
	}

	public void update(UserDTO dto) throws DataAccessException {
		sessionFactory.getCurrentSession().update(dto);
	}

	public UserDTO delete(long id) throws DataAccessException {
		UserDTO dto = findByPk(id);
		sessionFactory.getCurrentSession().delete(dto);
		return dto;
	}

	public UserDTO findByPk(long pk) throws DataAccessException {
		UserDTO dto = null;
		dto = (UserDTO) sessionFactory.getCurrentSession().get(UserDTO.class, pk);
		return dto;
	}



	

	public List search(UserDTO dto, int pageNo, int pageSize) {
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(UserDTO.class);
	
			
		if (pageSize > 0) {
			pageNo = (pageNo - 1) * pageSize;
			criteria.setFirstResult(pageNo);
			criteria.setMaxResults(pageSize);
		}
		List list = criteria.list();
		return list;
	}
}
