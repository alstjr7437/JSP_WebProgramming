package cs.dit.board;

import java.sql.Date;

public class BoardDto {
	private int bcode;
	private String subject;
	private String content;
	private String writer;
	private Date regDate;
	
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public BoardDto(int bcode, String subject, String content, String writer, Date regDate) {
		this.bcode = bcode;
		this.subject = subject;
		this.content = content;
		this.writer = writer;
		this.regDate = regDate;
	}
	
	public BoardDto() {}
	
}
