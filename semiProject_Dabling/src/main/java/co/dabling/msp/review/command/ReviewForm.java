package co.dabling.msp.review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.review.service.ReviewService;
import co.dabling.msp.review.service.impl.ReviewServiceImpl;
import co.dabling.msp.review.vo.ReviewVO;

public class ReviewForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		vo.setContent(request.getParameter("content"));
		vo.setReservationCode(Integer.parseInt(request.getParameter("reservationCode1")));
		vo.setStoreCode(Integer.parseInt(request.getParameter("storeCode1")));
		vo.setRate(Double.parseDouble((request.getParameter("rate"))));

		dao.reviewInsert(vo);
		return "member/reservationHistoryMsg.tiles";
	}
}
