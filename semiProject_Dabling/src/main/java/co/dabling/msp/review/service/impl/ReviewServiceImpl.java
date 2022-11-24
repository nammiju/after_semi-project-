package co.dabling.msp.review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.dabling.msp.common.DataSource;
import co.dabling.msp.review.mapper.ReviewMapper;
import co.dabling.msp.review.service.ReviewService;
import co.dabling.msp.review.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService {
	private SqlSession SqlSession = DataSource.getInstance().openSession(true);
	private ReviewMapper map = SqlSession.getMapper(ReviewMapper.class);

	// 리뷰 전체 리스트 가져오기, column따라 다르게, all을 넣을경우 전체 다
	// column:all/storeCode/rate, number:0/분류대상 스토어코드값/기준레이트 값
	@Override
	public List<ReviewVO> reviewSelectList(String column, int number) {
		// TODO Auto-generated method stub
		return map.reviewSelectList(column, number);
	}

	@Override
	public int reviewInsert(ReviewVO vo) {
		// TODO Auto-generated method stub
		return map.reviewInsert(vo);
	}

}
