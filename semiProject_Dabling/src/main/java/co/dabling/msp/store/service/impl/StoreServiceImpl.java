package co.dabling.msp.store.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.dabling.msp.common.DataSource;
import co.dabling.msp.store.mapper.StoreMapper;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.vo.StoreVO;

public class StoreServiceImpl implements StoreService {
	// DB 연결,호출
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private StoreMapper map = sqlSession.getMapper(StoreMapper.class);

	@Override
	public List<StoreVO> storeSelectList() {
		return map.storeSelectList();
	}

	@Override
	public StoreVO storeSelect(String businessNum) {
		return map.storeSelect(businessNum);
	}

	@Override
	public int storeInsert(StoreVO vo) {
		return map.storeInsert(vo);
	}

	@Override
	public int storeUpdate(StoreVO vo) {
		return map.storeUpdate(vo);
	}

	@Override
	public int storeDelete(String businessNum) {
		return map.storeDelete(businessNum);
	}

	@Override
	public StoreVO storeSelectByCode(int StoreCode) {
		// 스토어코드로 매장조회하기
		return map.storeSelectByCode(StoreCode);
	}

	@Override
	public int storeApproval(String businessNum) {
		return map.storeApproval(businessNum);
	}

	@Override
	public List<StoreVO> storeList(String column, String searchKey) {
		return map.storeList(column, searchKey);
	}

	@Override
	public int totalCnt() {
		// 전레 row 수 카운트
		return map.totalCnt();
	}

	@Override
	public List<StoreVO> pageList(int pg) {
		//
		return map.pageList(pg);
	}

	@Override
	public List<StoreVO> pageApprovalList(int pg) {
		// 승인전 목록만 페이징.
		return map.pageApprovalList(pg);
	}
}
