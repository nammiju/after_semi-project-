package co.dabling.msp.relpy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dabling.msp.relpy.vo.ReplyVO;

public interface ReplyMapper {
	int insertReply (ReplyVO vo);
	int updateReply (ReplyVO vo);
	int deleteReply (@Param("reservationCode") int reservationCode);
	List<ReplyVO> replySelectList();
}
