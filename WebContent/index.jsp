<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>

<html>
  <head>
    <title>DB Test</title>
  </head>
  <body>

<%
 Context ic = new InitialContext();
 DataSource ds = (DataSource) ic.lookup("java:jboss/datasources/OracleDS");
 Connection con = ds.getConnection();
 Statement stmt = con.createStatement();
 String sql = "";
 ResultSet rs;
 sql = "SELECT owner, table_name FROM all_tables";
 rs = stmt.executeQuery(sql);
 while(rs.next()){
  out.println(rs.getString("owner")+ " " + rs.getString("table_name") + "<br/>");
 }
 if(rs != null)
     rs.close();
 if(stmt!=null)
     stmt.close();
 if(con!=null)
     con.close();
%>


  </body>
</html>