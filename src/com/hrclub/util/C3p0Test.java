package com.hrclub.util; 

import com.mchange.v2.c3p0.*;
import java.sql.*;

public class C3p0Test {

	public C3p0Test() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ComboPooledDataSource cpds = new ComboPooledDataSource();
		try {
			cpds.setDriverClass("com.microsoft.jdbc.sqlserver.SQLServerDriver");
			// loads the jdbc driver
			cpds.setJdbcUrl("jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=pubs");
			cpds.setUser("sa");
			cpds.setPassword("");
			cpds.setMaxStatements(180);
			cpds.setMinPoolSize(1);
			cpds.setMaxPoolSize(10); 
			Connection conn=cpds.getConnection(); 
			Statement stmt=conn.createStatement(); 
			ResultSet rs=stmt.executeQuery("select * from employee");
			while(rs.next()){
				System.out.println(rs.getString("fname"));
			}
			
		} catch (Exception e) {
			System.out.println("error here:"+e);
		} finally {
			try {
				DataSources.destroy(cpds);
			} catch (Exception ex) {
				System.out.println(ex);
			}
		}
	}

}
