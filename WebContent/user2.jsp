<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
 <%@ page import="org.lucasko.DbDAO" %>
 <%@ page import="org.lucasko.UserVO" %>

<html>
  <head>
    <title>DB Test</title>
  </head>
  <body>

<%

DbDAO  dbDAO2 = new DbDAO();
UserVO user2 = dbDAO2.getUser();
 
%>

<%= user2.getId()%> <br>
<%= user2.getLast_name()%> <br>
<%= user2.getFirst_name()%> <br>
<%= user2.getGender()%> <br>
<%= user2.getEmail()%> <br>
<%= user2.getIp_address()%> <br>

  </body>
</html>