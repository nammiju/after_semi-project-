package co.micol.prj.board.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.prj.board.mapper.Mapper;
import co.micol.prj.board.service.BoardService;
import co.micol.prj.board.vo.BoardVO;
import co.micol.prj.common.DataSource;

public class BoardServiceImpl implements BoardService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private Mapper map = sqlSession.getMapper(Mapper.class);
	
	@Override
	public List<BoardVO> boardList() {
		// 글 전체목록
		return map.boardList();
	}

	@Override
	public BoardVO boardSelect(BoardVO vo) {
		// 글 상세보기
		return map.boardSelect(vo);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		// 글 등록
		return map.boardInsert(vo);
	}

}
