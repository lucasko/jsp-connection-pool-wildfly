package org.lucasko;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {

	public static Connection getConnection() {
		
		System.out.println("getConnection starting ...");

		DataSource ds = null;
		Context ic = null;
		Connection conn = null;
		try {
			ic = new InitialContext();
			System.out.println("lookup ...");
			ds = (DataSource) ic.lookup("java:jboss/datasources/OracleDS");
			System.out.println("lookup done");
			conn = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("getConnection done.");
		return conn;
	}

}
