package co.dabling.msp.store.command;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.dabling.msp.common.Command;
import co.dabling.msp.reservation.service.ReservationService;
import co.dabling.msp.reservation.service.impl.ReservationServiceImpl;
import co.dabling.msp.reservation.vo.ReservationVO;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class StoreReservationSearch implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		// 현 예약현황 날짜 검색
		HttpSession session = request.getSession();
		StoreVO store = new StoreVO();
		StoreService storeService = new StoreServiceImpl();
		ReservationVO rVo = new ReservationVO();
		ReservationService reservationService = new ReservationServiceImpl();
		List<ReservationVO> reviewList = new ArrayList<>();
		ObjectMapper oMapper = new ObjectMapper();   //json 형태의 문자열 처리를 위해

		// 로그인 가게코드찾기.
		String businessNum = (String) session.getAttribute("businessNum");
		store = storeService.storeSelect(businessNum);
		int storeCode = store.getStoreCode();
		System.out.println(storeCode);
		
		rVo.setStoreCode(storeCode); //가게 코드
		rVo.setFirstDate(Date.valueOf(request.getParameter("firstDate")));
		rVo.setLastDate(Date.valueOf(request.getParameter("lastDate")));

		reviewList = reservationService.storeReservationListSearch(rVo);
		String val = null;
		try {
			val = oMapper.writeValueAsString(reviewList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return "ajax:"+val;
	}
}
