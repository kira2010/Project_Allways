package edu.spring.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {
				"file:src/main/webapp/WEB-INF/spring/**/*.xml"
		}
)
@WebAppConfiguration
public class DatabaseTest {
	static final String DRIVER = "com.mysql.jdbc.Driver";
	static final String URL = "jdbc:mysql://18.188.207.204:3306/ITWILL_PROJECT?useSSL=false";
	static final String USERNAME = "scott";
	static final String PASSWORD = "tiger";
	 
	@Test
	public void getMySQLConnectionTest() {
	        
		Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    try {
	            
	    	System.out.println("==================== MySQL Connection START ====================");
	            
	    	Class.forName(DRIVER);
	            
	        conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	        stmt = conn.createStatement();
	 
	        String sql = "select * from USER";
	 
	        rs = stmt.executeQuery(sql);
	        while (rs.next()) {
	                
	        String userid = rs.getString("USERID");
	        String userpwd = rs.getString("USERPWD");
	        String username = rs.getString("USERNAME");
	 
	        System.out.println("result: "+userid + ", "+ userpwd + ", " + username);
	    
	        }
	    }catch (Exception ex) {
	    	ex.printStackTrace();
	    } finally {
	    	try {
	    	    rs.close();
		        stmt.close();
		        conn.close();
	    	} catch (Exception ex) {
	    		ex.printStackTrace();
	    	}
	        
	    	System.out.println("==================== MySQL Connection END ====================");
	    }
	}
	
}
