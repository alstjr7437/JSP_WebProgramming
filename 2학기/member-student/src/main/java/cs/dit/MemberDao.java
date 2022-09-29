package cs.dit;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**======================================================================
 * 패키지명 : cs.dit
 * 파일명   : MemberDao.java
 * 작성자  : 김민석
 * 변경이력 : 
 *   2022-8-28/ 최초작성/ 김진숙
 *   2022-9-27/ 수정/ 김민석
 * 프로그램 설명 : member 테이블의 내용과 연동하여 회원관리
*======================================================================*/

public class MemberDao {

	private Connection getConnection() throws Exception{
		
		Context initCtx  = new InitialContext();//1. JNDI를 이용하기 위한 객체 생성
		
		Context envCtx = (Context) initCtx.lookup("java:comp/env");//2. 등록된 네이밍 서비스로부터 등록된 자원을 가져옴
		
		//10. 자원들 중 원하는 jdbc/jskim 자원을 찾아내어 데이터소스를 가져옴
		DataSource ds = (DataSource) envCtx.lookup("jdbc/alstjr");//3. 자원들 중 원하는 jdbc/alstjr 자원을 찾아내어 데이터소스를 가져옴
		
		Connection con = ds.getConnection();//4. 커넥션 얻어옴
		
		return con;
	}
	
	public void insert(MemberDto dto) {
		//11. member 테이블에 사용자가 입력한 정보를 등록하는 SQL문은
		String sql = "INSERT INTO member(ID, NAME, PWD, EMAIl, JOINDATE) VALUES(?, ?, ?, ?, ?)";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		)
		{
			pstmt.setString(1,  dto.getId());
			pstmt.setString(2,  dto.getPwd());
			pstmt.setString(3,  dto.getName());
			pstmt.setString(4,  dto.getEmail());
			pstmt.setDate(5, (Date) dto.getJoinDate());
			
			// 11. pstmt에 준비된 sql을 실행시킴
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDto> list(){
		String sql = "SELECT * FROM member";
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		
		try (	Connection con = getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
			)
			{
				while(rs.next()) {
					MemberDto dto = new MemberDto();
					
					//12. ResultSet 객체변수 rs에서 데이터를 가져와 MemberDto를 만들기
					dto.setId(rs.getString("id"));
					dto.setPwd(rs.getString("pwd"));
					dto.setName(rs.getString("name"));
					dto.setEmail(rs.getString("email"));
					dto.setJoinDate(rs.getDate("joindate"));
					
					//13. ArrayList에 만들어진 dto를 추가하기
		            dtos.add(dto);
					
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		return dtos;
	}
	
	public MemberDto selectOne(String id) {
		String sql = "SELECT * FROM member WHERE id =?";
		MemberDto dto = new MemberDto();
		
		try (	Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{	
			//14. SQL문의 placeholder의 첫번째 자리에 들어갈 id 정보를 세팅
			pstmt.setString(1, id);
		
			try(ResultSet rs = pstmt.executeQuery();)
			{
				rs.next();
				
				dto.setId(id);
				dto.setName(rs.getString("name"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setJoinDate(rs.getDate("joinDate"));
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void update(MemberDto dto) {
		String sql = "UPDATE member SET  pwd = ?, name = ?, email = ?, joinDate = ? WHERE id =?";
		
		try (
			Connection con = getConnection();
				
			//15. SQL을 준비하여 해당 커낵션에서 PreparedStatement 객체 실행 준비
			PreparedStatement pstmt = con.prepareStatement(sql);
			
		)
		{
			pstmt.setString(1,  dto.getPwd());
			pstmt.setString(2,  dto.getName());
			pstmt.setString(3,  dto.getEmail());
			pstmt.setDate(4, (Date) dto.getJoinDate());
			pstmt.setString(5,  dto.getId());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public void delete(String id) {
		String sql = "DELETE FROM member WHERE id =?";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		)
		{
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
}
