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
 *   2022-9-27/ 질문 수정/ 김민석
 *   2022-10-05/ 컨트롤러로 수정/ 김민석
 * 프로그램 설명 : member 테이블의 내용과 연동하여 회원관리
*======================================================================*/


public class MemberDao {

	private Connection getConnection() throws Exception{
		
		Context initCtx  = new InitialContext();
		
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) envCtx.lookup("jdbc/alstjr");
		
		Connection con = ds.getConnection();
		
		return con;
	}
	
	public void insert(MemberDto dto) {
		String sql = "INSERT INTO member(ID, NAME, PWD, EMAIl, JOINDATE) VALUES(?, ?, ?, ?, SYSDATE())";
		
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		)
		{
			pstmt.setString(1,  dto.getId());
			pstmt.setString(2,  dto.getPwd());
			pstmt.setString(3,  dto.getName());
			pstmt.setString(4,  dto.getEmail());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDto> list(int page, int numOfRecords){
		String sql = "SELECT * FROM Member order by id desc limit ?,?";
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		
		try (	Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			)
			{
				pstmt.setInt(1, (page-1)*numOfRecords);
				pstmt.setInt(2, numOfRecords);
			
				try(ResultSet rs = pstmt.executeQuery();)
				{
					while(rs.next()) {
						MemberDto dto = new MemberDto();
						
						dto.setId(rs.getString("id"));
						dto.setPwd(rs.getString("pwd"));
						dto.setName(rs.getString("name"));
						dto.setEmail(rs.getString("email"));
						dto.setJoinDate(rs.getDate("joindate"));
						
			            dtos.add(dto);	
					}

				} catch (Exception e) {
					e.printStackTrace();
				} 
			} catch (Exception e) {
				e.printStackTrace();
			}
		return dtos;
	}
	public int recordCount() {
		int count = 0;
		String sql = "select count(id) from Member";
		
		try (	Connection con = getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
			){
				rs.next();
				count = rs.getInt(1);
		} catch (Exception e) {	
			e.printStackTrace();
		}
		
		return count;
	}
	
	
	public MemberDto selectOne(String id) {
		
		String sql = "SELECT * FROM member WHERE id =?";
		
		MemberDto dto = new MemberDto();
		
		try (	Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{	pstmt.setString(1, id);
		
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
		String sql = "UPDATE member SET pwd = ?, name = ?, email = ?, joinDate = ? WHERE id =?";
		
		try (
			Connection con = getConnection();
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
		String sql = "DELETE FROM Member WHERE id =?";
		
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
