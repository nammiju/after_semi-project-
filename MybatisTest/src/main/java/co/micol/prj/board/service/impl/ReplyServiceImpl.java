package co.micol.prj.board.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.prj.board.mapper.Mapper;
import co.micol.prj.board.service.ReplyService;
import co.micol.prj.board.vo.ReplyVO;
import co.micol.prj.common.DataSource;

public class ReplyServiceImpl implements ReplyService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private Mapper map = sqlSession.getMapper(Mapper.class);

	@Override
	public List<ReplyVO> replyList() {
		// 댓글 전체 목록
		return map.replyList();
	}

	@Override
	public int replyInsert(ReplyVO vo) {
		// 댓글 등록
		return map.replyInsert(vo);
	}

	@Override
	public int replyDelete(ReplyVO vo) {
		// 댓글삭제
		return map.replyDelete(vo);
	}

}
