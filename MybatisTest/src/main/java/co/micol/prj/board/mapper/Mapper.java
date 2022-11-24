package co.micol.prj.board.mapper;

import java.util.List;

import co.micol.prj.board.vo.BoardVO;
import co.micol.prj.board.vo.ReplyVO;

public interface Mapper {
	List<BoardVO> boardList(); // 글 전체목록
	BoardVO boardSelect(BoardVO vo); // 글 상세내용
	int boardInsert(BoardVO vo); // 글등록
	
	List<ReplyVO> replyList(); // 댓글 전체목록
	int replyInsert(ReplyVO vo); // 댓글등록
	int replyDelete(ReplyVO vo); // 댓글삭제
}
