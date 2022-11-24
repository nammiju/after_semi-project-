package co.dabling.msp.relpy.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.dabling.msp.common.DataSource;
import co.dabling.msp.relpy.mapper.ReplyMapper;
import co.dabling.msp.relpy.service.ReplyServcie;
import co.dabling.msp.relpy.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyServcie {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private ReplyMapper map = sqlSession.getMapper(ReplyMapper.class);
	
	@Override
	public int insertReply(ReplyVO vo) {
		return map.insertReply(vo);
	}

	@Override
	public int updateReply(ReplyVO vo) {
		return map.updateReply(vo);
	}

	@Override
	public List<ReplyVO> replySelectList() {
		return map.replySelectList();
	}

	@Override
	public int deleteReply(int reservationCode) {
		return map.deleteReply(reservationCode);
	}

}
