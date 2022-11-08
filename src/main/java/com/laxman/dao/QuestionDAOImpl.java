package com.saransh.dao;

import com.saransh.entity.Question;



import com.saransh.dao.QuestionDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by CryptoSingh1337 on 6/1/2021
 *
 * It is a DAO implementation of {@link CustomerDAO}
 */

@Repository
public class QuestionDAOImpl implements QuestionDAO {

    private SessionFactory factory;
    @Override
    public void addQuestion(Question question) {
        Session session = factory.getCurrentSession();
        session.saveOrUpdate(question);
    }

    @Override
    public Question getQuestion(int id) {
        Session session = factory.getCurrentSession();
        return session.get(Question.class, id);
    }
    @Override
    public List<Question> getQuestions(int sortBy) {
        String sort;
        switch (sortBy) {
            case 1: sort = "name";
                break;
            case 2: sort = "diff";
                break;
            default:
                sort = "id";
        }
        Session session = factory.getCurrentSession(); // get hibernate session.
        String queryString = "from Question order by " + sort;
        Query<Question> query = session.createQuery(queryString, Question.class); // create query.
        return query.getResultList(); // execute query and get customers list.
    }

    @Override
    public void deleteQuestion(int id) {
        Session session = factory.getCurrentSession(); // get hibernate session.
        Query query = session.createQuery("delete from Question where id=:qID");
        query.setParameter("qID", id);
        query.executeUpdate(); // delete the customer from the database.
    }

    @Override
    public List<Question> searchQuestion(int type ,String searchString) {
        Session session = factory.getCurrentSession();
        Query<Question> query;
        if(type==0) {
        	query= session.createQuery("from Question where tag like :search", Question.class);
        }
        else {
        	query = session.createQuery("from Question where name like :search", Question.class);
        }
        searchString = "%" + searchString.trim() + "%";
        query.setParameter("search", searchString);
        return query.getResultList();
    }
    @Override
    public List<Question> searchQuestionByTagAndSheetName(String tag ,String sheetName){
    	Session session=factory.getCurrentSession();
    	Query<Question> query=session.createQuery("from Question where tag like :search1 and sheetName like :search2",Question.class);
    	tag="%"+ tag.trim() +"%";
    	sheetName="%"+ sheetName.trim() +"%";
    	query.setParameter("search1",tag);
    	query.setParameter("search2",sheetName);
    	return query.getResultList();
    }
   
    @Autowired
    public void setFactory(SessionFactory factory) {
        this.factory = factory;
    }

	    

    
}
