package com.saransh.service;
import com.saransh.entity.Question;
import com.saransh.entity.Users;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public interface QuestionService {
    
    void addQuestion(Question question);
    Question getQuestion(int id);
    List<Question> getQuestions(int sortBy);
    void deleteQuestion(int id);
    List<Question> searchQuestion(int type,String searchString);
    List<Question> searchQuestionByTagAndSheetName(String tag ,String sheetName);
    boolean markSolvedOrUnsolved(int qId , boolean checkSolved);
}
