package co.dabling.msp.menu.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.dabling.msp.common.Command;
import co.dabling.msp.menu.service.MenuService;
import co.dabling.msp.menu.service.impl.MenuServiceImpl;
import co.dabling.msp.menu.vo.MenuVO;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class MenuNameUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 매장에서 메뉴명 수정
		System.out.println("메뉴명 수정.");
		MenuService menuService = new MenuServiceImpl();
		StoreService storeService = new StoreServiceImpl();
		MenuVO menu = new MenuVO();
		StoreVO store = new StoreVO();
		ObjectMapper oMapper = new ObjectMapper(); // json 형태의 문자열 처리를 위해

		// 세션값 매장코드
		HttpSession session = request.getSession();
		String businessNum = (String) session.getAttribute("businessNum");
		store = storeService.storeSelect(businessNum);
		int storeCode = store.getStoreCode();

		String menuName = request.getParameter("menuName");
		String menuNameRename = request.getParameter("menuNameRename");
		System.out.println(menuName);
		System.out.println(menuNameRename);

		menu.setMenuName(menuName);
		menu.setMenuNameRename(menuNameRename);
		menu.setStoreCode(storeCode);
		int result = menuService.menuUpdate(menu);
		if (result > 0) {
			return "ajax:" + result;
		}
		return "ajax:" + result;

	}
}
