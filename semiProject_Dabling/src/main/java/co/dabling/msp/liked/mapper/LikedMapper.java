package co.dabling.msp.liked.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dabling.msp.liked.vo.LikedVO;

public interface LikedMapper {
	boolean likeCheck(@Param("storeCode") int storeCode, @Param("memberCode") int memberCode);

	int insertLike(@Param("storeCode") int storeCode, @Param("memberCode") int memberCode);

	int updateLike(LikedVO vo);

	int deleteLike(@Param("storeCode") int storeCode, @Param("memberCode") int memberCode);

	List<LikedVO> likeList(LikedVO vo);

}
