package co.dabling.msp.admin.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.page.vo.PageVO;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class StoreSelectForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 매장선택조회 화면출력(전체매장 출력)
		String page = request.getParameter("page");
		page = page ==null ? "1" : page;
		int pg = Integer.parseInt(page);
		
		StoreService service = new StoreServiceImpl();
		int totalcount = service.totalCnt();
		PageVO paging = new PageVO(totalcount, pg); 
		List<StoreVO> stores = service.pageList(pg);
		
		request.setAttribute("stores", stores);
		request.setAttribute("page", paging);
		
		return "admin/storeSelectForm.tiles";
	}

}
