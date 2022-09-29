package csdit;

/**
 * 패키지명 : csdit
 * 파일명 : LoginDto.java
 * 작성자 : minseok
 * 프로그램 설명 : dbcp로 데이터베이스 연동
 * 변경 이력 : 2022-04-28 / 최초 작성 / 김진숙
 */
public class LoginDto {
	private String id;
	private String name;
	private String pwd;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public LoginDto(String id, String name, String pwd) {
		this.id = id;
		this.name = name;
		this.pwd = pwd;
	}
	public LoginDto() {} //매개변수가 없는 생성자
}
