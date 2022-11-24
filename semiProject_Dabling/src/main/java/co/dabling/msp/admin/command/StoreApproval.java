package co.dabling.msp.admin.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.page.vo.PageVO;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class StoreApproval implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 등록승인
		String businessNum = request.getParameter("businessNum");
		StoreService service = new StoreServiceImpl();
		service.storeApproval(businessNum);

		// 리스트 다시 돌려주기.
		String page = request.getParameter("page");
		page = page == null ? "1" : page;
		int pg = Integer.parseInt(page);

		int totalcount = service.totalCnt();
		PageVO paging = new PageVO(totalcount, pg);
		List<StoreVO> stores = service.pageApprovalList(pg);

		request.setAttribute("stores", stores);
		request.setAttribute("page", paging);
		return "admin/storeApprovalForm.tiles";
	}
}