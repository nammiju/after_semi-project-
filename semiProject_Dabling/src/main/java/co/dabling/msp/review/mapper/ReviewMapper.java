package co.dabling.msp.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dabling.msp.review.vo.ReviewVO;

public interface ReviewMapper {
	int reviewInsert(ReviewVO vo);

	// 리뷰 전체 리스트 가져오기, column따라 다르게, all을 넣을경우 전체다
	// column:all/storeCode/rate, code:0/분류대상 스토어코드값/기준레이트 값
	List<ReviewVO> reviewSelectList(@Param("column") String column, @Param("number") int number);
}
