package co.dabling.msp.store.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dabling.msp.common.Command;
import co.dabling.msp.page.vo.PageVO;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class StoreMyPageDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 매장삭제 완료
		System.out.println("매장 삭제");
		HttpSession session = request.getSession();
		StoreService service = new StoreServiceImpl();
		StoreVO store = new StoreVO();

		// 로그인 사업자번호 찾기
		String businessNum = (String) session.getAttribute("businessNum");
		service.storeDelete(businessNum);
		System.out.println(businessNum);
		
		//
		int pg = 1; // 첫페이지
		List<StoreVO> storeList = service.storeSelectList();
		int totalPage = storeList.size(); // 전체페이지.

		PageVO paging = new PageVO(totalPage, pg); // 전체페이지, 입력페이지.
		List<StoreVO> storePagList = service.pageList(pg); // service.getList(new BoardVO(0, "", "", "", "", 0, ""));

		// 값 확인
		for (StoreVO store1 : storePagList) {
			System.out.println(store1.getStoreName());
		}

		// 메인화면 값 넘기기
		request.setAttribute("storeList", storeList); // 전체리스트
		request.setAttribute("storePagList", storePagList); // 페이징리스트
		request.setAttribute("page", paging); // 페이지

		return "main/main.tiles";
	}

}
