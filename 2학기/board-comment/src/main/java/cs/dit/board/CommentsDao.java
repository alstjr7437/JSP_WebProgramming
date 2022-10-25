package cs.dit.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


public class CommentsDao {
	private Connection getConnection() throws Exception{
			
			Context initCtx  = new InitialContext();//1. JNDI를 이용하기 위한 객체 생성
			
			Context envCtx = (Context) initCtx.lookup("java:comp/env");//2. 등록된 네이밍 서비스로부터 등록된 자원을 가져옴
			
			DataSource ds = (DataSource) envCtx.lookup("jdbc/alstjr");//3. 자원들 중 원하는 jdbc/alstjr 자원을 찾아내어 데이터소스를 가져옴
			
			Connection con = ds.getConnection();//4. 커넥션 얻어옴
			
			return con;
		}

	public JSONArray list(int bcode) {
		String sql = "SELECT ccode, content, regdate from comments where bcode = ?";
		JSONArray list = new JSONArray();
		System.out.println("list에 있음");
		try (	Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			)
			{
				pstmt.setInt(1, bcode);
				try(ResultSet rs = pstmt.executeQuery();)
				{
					while(rs.next()) {
						JSONObject json = new JSONObject();
						
						json.put("ccode", rs.getInt("ccode"));
						json.put("content", rs.getString("content"));
						json.put("regdate", rs.getDate("regdate"));
						
						//2. 위에서 만들어진 dto를 ArrayList 인 dtos에 차례로 입력하세요.
			            list.add(json);
					}
					rs.close();

				} catch (Exception e) {
					e.printStackTrace();
				} 
			} catch (Exception e) {
				e.printStackTrace();
			}
		return list;
	}
}
