package co.dabling.msp.reservation.service;

import java.util.List;

import co.dabling.msp.reservation.vo.ReservationVO;

public interface ReservationService {
	// reservaion 전체 목록을 출력합니다.
	// 로그인할때 세션에 저장된 멤버 코드를 매개변수로 넣어 멤버별로 에약목록 출력.
	List<ReservationVO> memberReservationList(int memberCode);

	// 로그인할때 세션에 저장된 사업자번호로 스토어코드를 찾아 매개변수로 넣어 가게별로 예약목록 출력.
	List<ReservationVO> businessReservationList(int storeCode);

	// 예약취소 데이터베이스 삭제하기
	int reservationCancel(ReservationVO vo);

	// 예약추가
	int reservationInsert(ReservationVO vo);
	
	// 매장의 스토어코드와 날짜1, 날짜2를 넣어 예약날짜 조회
		List<ReservationVO> storeReservationListSearch(ReservationVO vo);
		//List<Map<String, String>> storeReservationListSearch(int storeCode, String firstDate, String lastDate);
}
