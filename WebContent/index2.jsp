<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:setDataSource var="example"
driver="oracle.jdbc.OracleDriver"
url="jdbc:oracle:thin:@192.168.1.167:1521/orcl"
user="system"
password="1qaz@WSX1234" />

 <sql:query dataSource="${example}" 
 			var="results" 
 			sql="SELECT owner, table_name FROM all_tables" 
 			/>

<html>
  <head>
    <title>DB Test</title>
  </head>
  <body>

	<h2>Results</h2>
	
	<c:forEach var="row" items="${results.rows}">
	  ${row.owner},${row.table_name}<br/>
	</c:forEach>

  </body>
</html>