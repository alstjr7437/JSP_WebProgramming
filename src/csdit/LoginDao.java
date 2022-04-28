package csdit;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * 패키지명 : csdit
 * 파일명 : LoginDao.java
 * 작성자 : minseok
 * 프로그램 설명 : dbcp로 데이터베이스 연동 
 * 변경 이력 : 
 * - getConnection : dbcp에서 Connection 얻어오기
 * - list() : login테이블에서 가져온 레코드를 dto로 만들어 전달
 */
public class LoginDao {
	private Connection getConnection() throws Exception{
		//1. DBCP로 변경
		//1-1. Context 객체 얻기
		Context initCtx = new InitialContext();
		//1-2. "java:comp/env"에 해당하는 객체를 찾아서 envCtx에 삽입
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		//1-3. "jdbc/alstjr"에 해당되는 객체를 찾아서 ds에 삽입
		DataSource ds = (DataSource)envCtx.lookup("jdbc/alstjr");
		//1-4. 커넥션 풀로 부터 커넥션 객체를 얻어냄
		Connection con = ds.getConnection();
		return con;
		
	}
	public void insert(LoginDto dto) {
		//3. SQL문(인서트로 삽입하기)
		String sql = "insert into login(id, name, pwd) values(?, ?, ?)";
		try(Connection con = getConnection();
			//4. SQL 실행하기
			PreparedStatement pstmt = con.prepareStatement(sql);
				
		)
		{
		//첫번째부터 id name pwd를 ?로 처리했기 때문에 순서대로 사용
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getName());
		pstmt.setString(3, dto.getPwd());
		
		//변경하는 쿼리를 쓸때 executeUpdate를 이용
		int i = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
