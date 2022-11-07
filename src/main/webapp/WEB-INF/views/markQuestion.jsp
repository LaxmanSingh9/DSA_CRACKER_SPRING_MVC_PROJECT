<%@ page import="java.util.*" %>
<%@page import="com.saransh.utils.*"%>
<%@page import="com.saransh.entity.Users"%>
<%@page import="com.saransh.service.QuestionService"%>
<%@page import="com.saransh.service.UserService"%>
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