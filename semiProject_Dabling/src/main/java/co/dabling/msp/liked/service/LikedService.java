package co.dabling.msp.liked.service;

import java.util.List;

import co.dabling.msp.liked.vo.LikedVO;

public interface LikedService {
	boolean likeCheck(int storeCode, int memberCode);
	int insertLike(int storeCode, int memberCode);
	int updateLike(LikedVO vo);
	int deleteLike(int storeCode, int memberCode);
	List<LikedVO> likeList(LikedVO vo);
}