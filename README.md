### JSP with Connection pool on Wildfly

```sh
	
├── REAMD.md
├── WebContent
│   ├── META-INF
│   │   └── MANIFEST.MF
│   ├── WEB-INF
│   │   ├── lib
│   │   │   ├── jstl-1.2.jar
│   │   │   ├── jstl-standard.jar
│   │   │   └── ojdbc7.jar
│   │   └── web.xml
│   ├── index.html
│   ├── index.jsp    (Example using connection pool)
│   └── index2.jsp   (JDBC using connection pool)
└── src

```

### Oracle 

```sh

docker run --name oracle19c --memory 3g -p 1521:1521 -p 5500:5500 -e ORACLE_PDB=orcl -e ORACLE_PWD=1qaz@WSX1234 -e ORACLE_MEM=4000 -v $PWD/oradata:/opt/oracle/oradata  --rm -it oracle/database:19.3.0-ee

# the oracle url is jdbc:oracle:thin:@192.168.1.167:1521/orcl
```


### Wilfly

https://www3.ntu.edu.sg/home/ehchua/programming/java/JavaWebDBApp.html


```sh

##Terminal 1
docker run -it --rm -p 8080:8080 -p 9990:9990 --name myboss  jboss/wildfly:8.2.1.Final sh 


/opt/jboss/wildfly/bin/add-user.sh


/opt/jboss/wildfly/bin/standalone.sh -bmanagement=0.0.0.0 -b 0.0.0.0

```



```sh
##Terminal 2

## Copy file to container
docker cp ~/Downloads/ojdbc7.jar myboss:/tmp


## login to container
docker exec -it myboss bash

### run CLI
/opt/jboss/wildfly/bin/jboss-cli.sh --connect --controller=192.168.1.167:9990


# Create JBOSS module with JDBC driver
module add --name=com.oracle --resources=/tmp/ojdbc7.jar --dependencies=javax.api,javax.transaction.api

# Create driver
/subsystem=datasources/jdbc-driver=oracle:add(driver-name="oracle",driver-module-name="com.oracle",driver-class-name=oracle.jdbc.OracleDriver)

# Create datasource
data-source add --jndi-name=java:jboss/datasources/OracleDS \
				--connection-url=jdbc:oracle:thin:@192.168.1.167:1521/orcl  \
				--password=1qaz@WSX1234 	\
				--user-name=system \
				--name=OraclePool \
				--driver-name=oracle 	\
				--driver-class=oracle.jdbc.OracleDriver \
				--max-pool-size=15 

# Enable created datasource
data-source enable --name=OracleDS


## open http://localhost:9990/console/App.html
## datasources -> OraclePool -> Connection -> Test Connection
	
```


```sh

docker cp ~/Downloads/my-web.war /opt/jboss/wildfly/standalone/deployments/

# open http://localhost:8080/my-web/index.html

```
	
	
### Connection Pool Using Java
	
```java
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

```

	
	
	
	
`