package com.saransh.service;

import com.saransh.dao.QuestionDAO;

import com.saransh.entity.Question;
import com.saransh.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by CryptoSingh1337 on 6/1/2021
 */

@Service
public class QuestionServiceImpl implements QuestionService {

    private QuestionDAO questionDAO;
    @Autowired
	private UserService userService;

    @Autowired
    public void setQuestionDAO(QuestionDAO questionDAO) {
        this.questionDAO = questionDAO;
    }
    @Override
    @Transactional
    public void addQuestion(Question question) {
    	 questionDAO.addQuestion(question);
    }

    @Override
	@Transactional
    public Question getQuestion(int id) {
        return  questionDAO.getQuestion(id);
    }

    @Override
    @Transactional
    public List<Question> getQuestions(int sortBy) {
        return  questionDAO.getQuestions(sortBy);
    }

    @Override
    @Transactional
    public void deleteQuestion(int id) {
    	 questionDAO.deleteQuestion(id);
    }

    @Override
    @Transactional
    public List<Question> searchQuestion(int type,String searchString) {
        return questionDAO.searchQuestion(type,searchString);
    }
    @Override
    @Transactional
    public List<Question> searchQuestionByTagAndSheetName(String tag ,String sheetName){
    	return questionDAO.searchQuestionByTagAndSheetName(tag, sheetName);
    }
    @Override
    @Transactional 
    public boolean markSolvedOrUnsolved(int qId , boolean checkSolved ) {
    	try {
    		Users user=userService.getUser(null);
			Question ques=questionDAO.getQuestion(qId);
			if(checkSolved)ques.getUsers().add(user);
			else ques.getUsers().remove(user);
			addQuestion(ques);
			return true;
			
	     } catch (Exception e) {
		   e.printStackTrace();
		   return false;
		}
   } 
   
}
