package co.micol.prj.board.service;

import java.util.List;

import co.micol.prj.board.vo.ReplyVO;

public interface ReplyService {
	List<ReplyVO> replyList(); // 댓글 전체목록
	int replyInsert(ReplyVO vo); // 댓글등록
	int replyDelete(ReplyVO vo); // 댓글삭제
}
