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

public class ReservationCancelForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 예약현황보여주기
		HttpSession session = request.getSession();
		ReservationService dao = new ReservationServiceImpl();
		List<ReservationVO> vo = new ArrayList<>();
		ReservationVO reservation = new ReservationVO();

		int memberCode = (int) session.getAttribute("memberCode");
		vo = dao.memberReservationList(memberCode);
		String message = "취소하실 예약을 선택해주세요";
		request.setAttribute("reservationStatus", vo);
		request.setAttribute("message", message);
		
		// 예약취소 폼으로 이동
		return "member/reservationCancelForm.tiles";
	}

}
