package co.dabling.msp.store.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dabling.msp.common.Command;
import co.dabling.msp.menu.service.MenuService;
import co.dabling.msp.menu.service.impl.MenuServiceImpl;
import co.dabling.msp.menu.vo.MenuVO;
import co.dabling.msp.reservation.service.ReservationService;
import co.dabling.msp.reservation.service.impl.ReservationServiceImpl;
import co.dabling.msp.reservation.vo.ReservationVO;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class StoreReservationStatus implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 예약현황보여주기
		System.out.println("사업자 예약현황조회페이지");
		HttpSession session = request.getSession();
		ReservationService dao = new ReservationServiceImpl();
		List<ReservationVO> reservationList = new ArrayList<>();
		ReservationVO reservation = new ReservationVO();
		
		//점주의 매장코드 조회
		StoreService storeService = new StoreServiceImpl();
		MenuService menuService = new MenuServiceImpl();
		MenuVO menu = new MenuVO();
		StoreVO store = new StoreVO();
		
		String businessNum = (String) session.getAttribute("businessNum");
		store = storeService.storeSelect(businessNum); 
		
		//등록된 매장이 없다면
		if (store == null) {
			return "store/unStore.tiles";
		}
		//등록된 매장이 있다면
		int storeCode = store.getStoreCode();
		
		reservationList = dao.businessReservationList(storeCode);
		String message = "예약현황조회";
		request.setAttribute("reservationStatus", reservationList);
		request.setAttribute("message", message);

		//확인
		System.out.println(businessNum);
		System.out.println(storeCode);
		System.out.println(reservationList);
		
		// 일반회원 예약현황 사이트로 가기
		return "store/storeReservationStatus.tiles";
	}

}
