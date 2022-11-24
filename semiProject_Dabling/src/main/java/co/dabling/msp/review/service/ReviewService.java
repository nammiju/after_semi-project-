package co.dabling.msp.review.service;

import java.util.List;

import co.dabling.msp.review.vo.ReviewVO;

public interface ReviewService {
	// 리뷰 전체 리스트 가져오기, column따라 다르게, all을 넣을경우 전체 다
	// column:all/storeCode/rate, number:0/분류대상 스토어코드값/기준레이트 값
	List<ReviewVO> reviewSelectList(String column, int number);

	int reviewInsert(ReviewVO vo);

}
