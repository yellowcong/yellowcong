<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//这个json的最后一个对象不可以加 逗号
String data = "{\"pageSize\":10,\"pageNow\":1,\"rowCount\":4,\"pageCount\":1,\"data\":[{\"id\":2,\"user_code\":\"2012020891\",\"username\":\"yellowcong\",\"class\":\"环境12-1\",\"major\":\"环境工程\",\"createDate\":\"2012-02-02\"},{\"id\":3,\"user_code\":\"2012020891\",\"username\":\"yellowcong\",\"class\":\"环境12-1\",\"major\":\"环境工程\",\"createDate\":\"2012-02-02\"},{\"id\":1,\"user_code\":\"2012020891\",\"username\":\"yellowcong\",\"class\":\"环境12-1\",\"major\":\"环境工程\",\"createDate\":\"2012-02-02\"},{\"id\":1,\"user_code\":\"2012020891\",\"username\":\"yellowcong\",\"class\":\"环境12-1\",\"major\":\"环境工程\",\"createDate\":\"2012-02-02\"}]}";
response.getWriter().write(data);
%>