package com.saransh.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import com.saransh.service.QuestionService;
import com.saransh.service.UserService;

public class ApplicationContextProvider implements ApplicationContextAware{

    private static ApplicationContext context;

    public static ApplicationContext getApplicationContext() {
        return context;
    }

    @Override
    public void setApplicationContext(ApplicationContext ac)
            throws BeansException {
        this.context = ac;
    }
    public static QuestionService getQuestionServiceImpl() {
    	return (QuestionService)context.getBean("questionServiceImpl");
    }
    public static UserService getUserServiceImpl() {
    	return (UserService) context.getBean("userServiceImpl");
    }
}