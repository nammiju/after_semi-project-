package co.dabling.msp.menu.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dabling.msp.common.Command;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class MenuInsertForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		// 매장 메뉴등록 페이지
		HttpSession session = request.getSession();
		StoreService service = new StoreServiceImpl();
		StoreVO store = new StoreVO();
		String businessNum = (String) session.getAttribute("businessNum");
		store = service.storeSelect(businessNum);

		request.setAttribute("store", store);
		request.setAttribute("businessNum", businessNum);

		// 등록된 매장이 없다면
		if (store == null) {
			return "store/unStore.tiles";
		}
		// 등록된 매장이 있다면
		return "menu/menuInsertForm.tiles";
	}

}
