package co.dabling.msp.reservation.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dabling.msp.common.Command;
import co.dabling.msp.member.service.MemberService;
import co.dabling.msp.member.service.impl.MemberServiceImpl;
import co.dabling.msp.member.vo.MemberVO;
import co.dabling.msp.reservation.service.ReservationService;
import co.dabling.msp.reservation.service.impl.ReservationServiceImpl;
import co.dabling.msp.reservation.vo.ReservationVO;

public class ReservationCancel implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 예약취소실행
		HttpSession session = request.getSession();
		ReservationService dao = new ReservationServiceImpl();
		ReservationVO vo = new ReservationVO();
		String temp[] = request.getParameterValues("reservationCode");
		for(int i=0; i<temp.length; i++) {
			vo.setReservationCode(Integer.parseInt(temp[i]));
			dao.reservationCancel(vo);	
		}
		return "member/reservationCancelMsg.tiles";

	}

}
