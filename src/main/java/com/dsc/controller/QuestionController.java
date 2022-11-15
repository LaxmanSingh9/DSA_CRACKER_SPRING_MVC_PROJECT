package com.dsc.controller;

import com.dsc.entity.Question;

import com.dsc.entity.Users;
import com.dsc.utils.Util;

import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dsc.service.QuestionService;
import com.dsc.service.UserService;
import com.dsc.utils.SortUtils;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.support.AbstractMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by CryptoSingh1337 on 6/1/2021
 * @param <logger>
 */

@Controller
@RequestMapping("/")
public class QuestionController<logger> {
	private QuestionService questionService;
	
	 @Autowired
	 private UserService userService;
	 @Autowired
	 private  QuestionService quesService;
	 @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        StringTrimmerEditor trimmer = new StringTrimmerEditor(true);
        webDataBinder.registerCustomEditor(String.class, trimmer);
    }
    @GetMapping("topicwise")
    public String home(@RequestParam(name = "sheet", required = false) String sheet,Model model) {
       JSONArray jsonArr = new JSONArray();
       JSONObject topic = new JSONObject();
       List<Question>list;
       String []topicNames=new String[]{"Arrays","Strings","Greedy","Dynamic Programming","Backtracking","Stack","Queue","Linked List","Heap","Bit Manipulation","Matrix","Hash Table","Searching","Sorting","Binary Trees","Binary Search Tree","Tree","Graph","Trie"};
       if(sheet!=null) {
    	   for(int i=0;i<topicNames.length;i++){
             list=questionService.searchQuestionByTagAndSheetName(topicNames[i],Util.formatString(sheet));
             topic = new JSONObject();
             topic.put("name", topicNames[i]);
             topic.put("count", list.size());
             topic.put("sheet", Util.formatString(sheet));
             topic.put("id",i);
             jsonArr.add(topic);
           }
       }
      else{
    	   for(int i=0;i<topicNames.length;i++){
             list=questionService.searchQuestion(0, topicNames[i]);
             topic = new JSONObject();
             topic.put("name", topicNames[i]);
             topic.put("count", list.size());
             topic.put("id",i);
             jsonArr.add(topic);
           }
       }	
       model.addAttribute("topics",jsonArr);
       return "topicwise-list";
     
    }
    @GetMapping("admin/add")
    public String addCustomerPage(Model model) {
        model.addAttribute("question", new Question()); // add customer attribute so that on submit spring mvc can call setter on it.
        return "question-form";
    }
    @GetMapping("admin/addQuestion")
    public String addQuestionPage(Model model) {
        model.addAttribute("question", new Question()); // add customer attribute so that on submit spring mvc can call setter on it.
        return "question-form";
    }
    @PostMapping("admin/save")
    public String saveQuestion(
            @Valid @ModelAttribute("question") Question question,
            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) // check for any error in customer properties
            return "question-form";
        questionService.addQuestion(question); // save the customer object in database
        return "redirect:/list";
    }

    @GetMapping("list")
    public ModelAndView questionList(@RequestParam(name="sheet", required = false) String sheet, @RequestParam(name="tagType" , required = false) String tagType,@RequestParam(name="page" , required = false)String page,@RequestParam(name="sortBy" , required = false)String sortBy,
    		@RequestParam(name="filter" , required = false)Integer filter,HttpServletRequest request , HttpServletResponse response ) 
    {
    	List<Question> ques;
    	ModelAndView modelAndView = new ModelAndView("question-list");
    	if (sheet != null && tagType!=null) {
    		ques=questionService.searchQuestionByTagAndSheetName(tagType, Util.formatString(sheet));
    		modelAndView.addObject("tagType", tagType);
    		modelAndView.addObject("sheet", sheet);
        }
    	else if(tagType!=null){
    		ques=questionService.searchQuestion(0,Util.formatString(tagType));
    		modelAndView.addObject("tagType", tagType);
    	}
    	else{
    		int sortVal=(sortBy==null || sortBy.trim().length()==0) ? 1: Integer.valueOf(sortBy);
    		modelAndView.addObject("sortBy", sortBy);
    		ques = questionService.getQuestions(sortVal);
        }
    	String username=null;
    	Users user=userService.getUser(username);
        modelAndView.addObject("userSolvedQuesIds", Util.getAllQuestionIdList(user.getQues()));
        if(filter!=null) {
        	  modelAndView.addObject("filter", filter);
        }
        if(filter!=null && filter == 1){
        	
        	List<Question>filterQues=Util.filterSolvedQues(ques ,Util.getAllQuestionIdList(user.getQues()));
        	return getPagination(modelAndView , filterQues, page);
        }
        else {
        	return getPagination(modelAndView, ques, page);
        }
    	
    }
   @GetMapping("admin/update")
    public String updateCustomerPage(@RequestParam("id") String id, Model model) {
        model.addAttribute("question", questionService.getQuestion(Integer.parseInt(id))); // add customer attribute with the specific id.
        return "question-form";
    }

    @GetMapping("admin/delete")
    public String deleteCustomer(@RequestParam("id") String id) {
    	questionService.deleteQuestion(Integer.parseInt(id)); // delete customer using the questionService class
        return "redirect:/list";
    }

    @GetMapping("search")
    public String searchQuestion(@RequestParam(required = false) String search, Model model) {
        if (search != null) {
            model.addAttribute("search", search);
            model.addAttribute("questions", questionService.searchQuestion(1,search));
            return "question-list";
        }
        return "redirect:/list";
   }
    
   public ModelAndView getPagination(ModelAndView modelAndView,List<Question> ques ,String p) {
    	
        PagedListHolder<Question> pagedListHolder = new PagedListHolder<>(ques);
        pagedListHolder.setPageSize(20);
        modelAndView.addObject("maxPages",pagedListHolder.getPageCount());
        Integer page=null;
        if(p!=null && p.trim().length()!=0){
        	page=Integer.valueOf(p);
        }
        	
        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;

        modelAndView.addObject("page",page);
        if(page==pagedListHolder.getPageCount()){
        	 modelAndView.addObject("startIndex", Math.max(1, page-2));
             modelAndView.addObject("endIndex", pagedListHolder.getPageCount());
        }
        else if(page==1){
        	 modelAndView.addObject("startIndex", page);
             modelAndView.addObject("endIndex",  Math.min(pagedListHolder.getPageCount(),page+2));
        }
        else {
        	 modelAndView.addObject("startIndex", Math.max(1, page-1));
             modelAndView.addObject("endIndex", Math.min(pagedListHolder.getPageCount(),page+1));
        }
       
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("questions", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("questions", pagedListHolder.getPageList());
        }
        return modelAndView;
    }
   
    @GetMapping("markQuestion")
    @ResponseBody
    public String markSolvedOrUnsolved(@RequestParam(name="id" , required = false) Integer id , @RequestParam(name="isMark" , required = false) boolean isMark ,HttpServletRequest request, HttpServletResponse response, Model model) {
    	boolean check =quesService.markSolvedOrUnsolved(id, isMark);
    	if(check && isMark) return "Mark successfully";
    	else if(check && !isMark) return "Unmark successfully";
    	else return "Error  occured";
    }
    @Autowired
    public void setCustomerDAO(QuestionService questionService) {
        this.questionService = questionService;
    }
}
