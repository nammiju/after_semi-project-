package co.dabling.msp.store.service;

import java.util.List;

import co.dabling.msp.store.vo.StoreVO;

public interface StoreService {

	List<StoreVO> storeSelectList(); // 전체 매장리스트 조회

	// 식당리스트 가져오기, column따라 다르게, all을 넣을경우 전체 다
	// column:storeName/storeRegion/storeCategory, searchKey: 검색어
	List<StoreVO> storeList(String column, String searchKey);

	StoreVO storeSelect(String businessNum); // 매장 1건 조회

	StoreVO storeSelectByCode(int StoreCode);// 스토어코드로 매장조회

	int storeInsert(StoreVO vo); // 매장등록(승인신청)

	int storeUpdate(StoreVO vo); // 매장수정

	int storeDelete(String businessNum); // 매장삭제

	int storeApproval(String businessNum); // 등록승인

	// 페이징 처리
	public int totalCnt(); // 전체 row 수 카운트

	public List<StoreVO> pageList(int pg);

	public List<StoreVO> pageApprovalList(int pg); // 승인전 목록만 페이징.

}
