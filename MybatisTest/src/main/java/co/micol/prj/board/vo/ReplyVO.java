package co.micol.prj.board.vo;

import lombok.Data;

@Data
public class ReplyVO {
	private int replyNo;
	private int boardNo;
	private String replyContent;
	private String replyWriter;
	private String replyDate;
}
