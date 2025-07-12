package Project;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataCon {
	static Connection con =null;

	
public static Connection getCon() {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3307/elibrary","root","1234");
		System.out.println("Connection established successfully");
	}
	catch(Exception e) {
		e.printStackTrace();
		System.out.println("Problem occurs");
	}
	return con;
}
}
