<%@ page import="java.util.*" %>
<%@page import="com.dsc.utils.*"%>
<%@page import="com.dsc.entity.Users"%>
<%@page import="com.dsc.service.QuestionService"%>
<%@page import="com.dsc.service.UserService"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
     JSONObject obj = new JSONObject();
     String id = request.getParameter("id");
     QuestionService ques =ApplicationContextProvider.getQuestionServiceImpl();
     Integer qId= Integer.parseInt(id);
     boolean reply = ques.markSolvedOrUnsolved(qId, true);
     obj.put("reply", reply);
     out.println(obj.toJSONString());
     out.flush();

%>