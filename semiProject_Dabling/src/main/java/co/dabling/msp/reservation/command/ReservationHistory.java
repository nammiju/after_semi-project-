package co.dabling.msp.reservation.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dabling.msp.common.Command;
import co.dabling.msp.reservation.service.ReservationService;
import co.dabling.msp.reservation.service.impl.ReservationServiceImpl;
import co.dabling.msp.reservation.vo.ReservationVO;

public class ReservationHistory implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 예약현황보여주기
		HttpSession session = request.getSession();
		ReservationService dao = new ReservationServiceImpl();
		List<ReservationVO> vo = new ArrayList<>();
		ReservationVO reservation = new ReservationVO();
		

		int memberCode = (int) session.getAttribute("memberCode");
		vo = dao.memberReservationList(memberCode);
		String message = "이용내역";
			request.setAttribute("reservationStatus", vo);
		request.setAttribute("message", message);

		// 일반회원 예약현황 사이트로 가기
		return "member/reservationHistory.tiles";
	}

}
