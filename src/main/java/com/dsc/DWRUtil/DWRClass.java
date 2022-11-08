package com.dsc.DWRUtil;

import com.dsc.service.QuestionService;
import com.dsc.utils.ApplicationContextProvider;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.WebContext;
import org.directwebremoting.jsonp.*;
import javax.servlet.http.HttpServletRequest;
/*
 *This is an dwr class 
 */
public class DWRClass {
	public String markSolvedOrUnsolved(int id , boolean isCheck){
		QuestionService qus= ApplicationContextProvider.getQuestionServiceImpl();
	    if(qus.markSolvedOrUnsolved(id, isCheck)) {
				return "OOP's something went wrong marking solved";
		}
		else{
				return "mark solved successfully";
	    }
	 
	}

}
