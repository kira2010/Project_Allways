package edu.spring.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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
//	static final String DRIVER = "com.mysql.jdbc.Driver";
//	static final String URL = "jdbc:mysql://18.188.207.204:3306/ITWILL_PROJECT?useSSL=false";
//	static final String USERNAME = "scott";
//	static final String PASSWORD = "tiger";
	
	@Autowired DataSource ds;
	
	@Test
	public void getMySQLConnectionTest() {
		//conTest();
		exiTest();
	}
	
	private void conTest() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			System.out.println("==================== MySQL Connection START ====================");
			
			conn = ds.getConnection();
			stmt = conn.createStatement();
			
			String sql = "select * from TBL_USER";
			
			rs = stmt.executeQuery(sql);
				
			while (rs.next()) {
				String userid = rs.getString("USERID");
				String userpwd = rs.getString("USERPWD");
				String username = rs.getString("USERNAME");
				
				System.out.println("result: "+userid + ", "+ userpwd + ", " + username);
			}
			
			System.out.println("TEST 종료임!!!");
		} catch (Exception ex) {
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
	
	private void exiTest() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select USERID from TBL_USER where USERID=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "admin");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String userId = rs.getString(1);
				System.out.println("userId : " + userId);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
