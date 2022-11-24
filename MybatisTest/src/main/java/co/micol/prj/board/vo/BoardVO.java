package co.micol.prj.board.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNo;
	private String writer;
	private String title;
	private String content;
	private String writeDate;
}
