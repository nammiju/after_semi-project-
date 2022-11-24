package co.dabling.msp.store.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUtils;

import co.dabling.msp.common.Command;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class StoreMyPage implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		// 매장 마이페이지
		HttpSession session = request.getSession();
		StoreService service = new StoreServiceImpl();
		StoreVO store = new StoreVO();

		String businessNum = (String) session.getAttribute("businessNum");
		store = service.storeSelect(businessNum);
		String message = "승인완료";
		// 등록된 매장이 없다면
		if (store == null) {
			return "store/unStore.tiles";
		}
		// 승인결과
		if (store.getApprovalState() == 0) {
			message = "승인대기";
		}
		request.setAttribute("store", store);
		request.setAttribute("message", message);
		System.out.println(store.getStoreCode());
		System.out.println(store.getStoreName());

		// 등록된 매장이 있다면
		return "store/storeMyPage.tiles";

	}
}
