package co.dabling.msp.review.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.review.service.ReviewService;
import co.dabling.msp.review.service.impl.ReviewServiceImpl;
import co.dabling.msp.review.vo.ReviewVO;

public class Review implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		
		// 리뷰목록 가져오기
		ReviewService dao = new ReviewServiceImpl();
		List<ReviewVO> list = new ArrayList<>();
		list = dao.reviewSelectList("all",0);
		request.setAttribute("list", list);
		return "review/review.tiles";
	}

}
