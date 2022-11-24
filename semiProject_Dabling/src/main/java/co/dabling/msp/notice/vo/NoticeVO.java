package co.dabling.msp.notice.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	private int noticeCode; //공지사항번호
	private String title; //제목
	private String cont; //내용
	private String writingDate; //작성일시(default sysdate)
}
