package co.dabling.msp.reservation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.dabling.msp.reservation.vo.ReservationVO;

public interface ReservationMapper {
	// reservation 전체 목록을 출력합니다.
	// 로그인할때 세션에 저장된 멤버 코드를 매개변수로 넣어 멤버별로 에약목록 출력.
	List<ReservationVO> memberReservationList(int memberCode);

	// 로그인할때 세션에 저장된 사업자번호로 스토어코드를 찾아 매개변수로 넣어 가게별로 예약목록 출력.
	List<ReservationVO> businessReservationList(int storeCode);

	// 예약취소 데이터베이스 삭제
	int reservationCancel(ReservationVO vo);
	
	int reservationInsert(ReservationVO vo);
	
	// 매장의 스토어코드와 날짜1, 날짜2를 넣어 예약날짜 조회
	List<ReservationVO> storeReservationListSearch(ReservationVO vo);
		//List<Map<String, String>> storeReservationListSearch(@Param("storeCode")int storeCode, @Param("firstDate")String firstDate, @Param("lastDate")String lastDate);
}
