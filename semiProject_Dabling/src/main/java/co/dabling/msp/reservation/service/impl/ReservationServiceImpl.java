package co.dabling.msp.reservation.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.dabling.msp.common.DataSource;
import co.dabling.msp.reservation.mapper.ReservationMapper;
import co.dabling.msp.reservation.service.ReservationService;
import co.dabling.msp.reservation.vo.ReservationVO;

public class ReservationServiceImpl implements ReservationService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private ReservationMapper map = sqlSession.getMapper(ReservationMapper.class);

	@Override
	public List<ReservationVO> memberReservationList(int memberCode) {
		return map.memberReservationList(memberCode);
	}

	@Override
	public List<ReservationVO> businessReservationList(int storeCode) {
		return map.businessReservationList(storeCode);
	}

	@Override
	public int reservationCancel(ReservationVO vo) {
		return map.reservationCancel(vo);
	}

	@Override
	public int reservationInsert(ReservationVO vo) {
		return map.reservationInsert(vo);
	}
	
	@Override
	public List<ReservationVO> storeReservationListSearch(ReservationVO vo) {
		return map.storeReservationListSearch(vo);
	}

}
