package co.dabling.msp.relpy.service;

import java.util.List;

import co.dabling.msp.relpy.vo.ReplyVO;

public interface ReplyServcie {
	int insertReply (ReplyVO vo);
	int updateReply (ReplyVO vo);
	int deleteReply (int reservationCode);
	List<ReplyVO> replySelectList();
}
