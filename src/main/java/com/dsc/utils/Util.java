package com.dsc.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

import com.dsc.entity.Question;

public class Util {
   public static List<Question> filterBySheet(List<Question>quesList , String sheetName){
	   if("All".equalsIgnoreCase(sheetName)){
		   return quesList;
	   }
	   sheetName=sheetName.trim();
	   List<Question>filterQuesList=new ArrayList<>();
	   for(Question ques:quesList){
		   List<String> l = new ArrayList(Arrays.asList(ques.getSheetName().split(",")));
		   for(String str:l){
			   if(str.equalsIgnoreCase(sheetName)){
				   filterQuesList.add(ques);
				   break;
			   }
		   }
	    }
	   System.out.print(filterQuesList.size());
	   return filterQuesList;
   }
   public static String formatString(String str){
	   String s="";
	   String finalString="";
	   
	   try{
		   s = URLDecoder.decode(str,"UTF-8" );
		   String[] list = s.trim().split("\\s+");
		   for(String st : list) {
			   char[]charArr=st.toCharArray();
			   charArr[0]=Character.toUpperCase(charArr[0]);
		   	   finalString+=String.valueOf(charArr)+" ";
		   }
	   }
	   catch(Exception e){
	        System.out.print("Error");;
	   }
	   return finalString;
   }
   public static List<Integer> getAllQuestionIdList(Set<Question>qSet){
 	    List<Integer>idList=new ArrayList<>(); 
	    if(qSet!=null) {
		   for(Question ques:qSet) {
			   idList.add(ques.getId());
		   }
	    }   
        return idList;
  }
   public static List<Integer> getAllQuestionIdList(List<Question>qList){
	    List<Integer>idList=new ArrayList<>(); 
	    if(qList!=null) {
		   for(Question ques:qList) {
			   idList.add(ques.getId());
		   }
	    }   
       return idList;
  }
  public static List<Question> filterSolvedQues(List<Question>ques , List<Integer> solvedQusId){
	  List<Question>unSolvedQuesList=new ArrayList<>();
	  for(Question q: ques) {
		  Integer id = Integer.valueOf(q.getId());
		  if(!solvedQusId.contains(id)){
			  unSolvedQuesList.add(q);
		  }
	  }
	  return unSolvedQuesList;
  } 
}
