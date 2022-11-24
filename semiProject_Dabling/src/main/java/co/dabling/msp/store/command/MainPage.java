package co.dabling.msp.store.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.page.vo.PageVO;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class MainPage implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("메인페이지 페이징처리");
		// 페이징을 위해서 전체 매장개수를 넘긴다.
		StoreVO store = new StoreVO();
		StoreService service = new StoreServiceImpl();

		int pg = 1; // 첫페이지
		List<StoreVO> storeList = service.storeSelectList();
		int totalPage = storeList.size(); // 전체페이지.

		PageVO paging = new PageVO(totalPage, pg); // 전체페이지, 입력페이지.
		List<StoreVO> storePagList = service.pageList(pg); // service.getList(new BoardVO(0, "", "", "", "", 0, ""));

		// 값 확인
		for (StoreVO store1 : storePagList) {
			System.out.println(store1.getStoreName());
		}

		// 값 넘기기 => 속성값 세팅 .
		request.setAttribute("storeList", storeList); // 전체리스트
		request.setAttribute("storePagList", storePagList); //페이징리스트
		request.setAttribute("page", paging); // 페이지

		System.out.println("totalPage: " + totalPage);
		System.out.println("page:"+pg);

		return "main/main.tiles";

	}

}
