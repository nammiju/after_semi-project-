package co.micol.prj.board.service;

import java.util.List;

import co.micol.prj.board.vo.BoardVO;

public interface BoardService {
	List<BoardVO> boardList(); // 글 전체목록
	BoardVO boardSelect(BoardVO vo); // 글 상세내용
	int boardInsert(BoardVO vo); // 글등록
}
