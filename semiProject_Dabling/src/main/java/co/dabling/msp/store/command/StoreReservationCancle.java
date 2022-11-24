package co.dabling.msp.store.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.reservation.service.ReservationService;
import co.dabling.msp.reservation.service.impl.ReservationServiceImpl;
import co.dabling.msp.reservation.vo.ReservationVO;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;

public class StoreReservationCancle implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//매장에서 회원예약 취소.
		System.out.println("예약삭제페이지");
		ReservationService service = new ReservationServiceImpl();
		ReservationVO vo = new ReservationVO();
		int reservationCode =  Integer.parseInt(request.getParameter("reservationCode"));
		
		vo.setReservationCode(reservationCode);
		System.out.println(reservationCode);
		
		int result = service.reservationCancel(vo);
		if(result > 0) {
			System.out.println("삭제완료");
		}
		
		return "store/storeReservationStatus.tiles" ;
	}

}
