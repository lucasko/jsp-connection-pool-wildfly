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

DbDAO  dbDAO = new DbDAO();
UserVO user = dbDAO.getUser();
 
%>

<%= user.getId()%> <br>
<%= user.getLast_name()%> <br>
<%= user.getFirst_name()%> <br>
<%= user.getGender()%> <br>
<%= user.getEmail()%> <br>
<%= user.getIp_address()%> <br>

  </body>
</html>