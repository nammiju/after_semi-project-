package co.dabling.msp.menu.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dabling.msp.common.Command;
import co.dabling.msp.menu.service.MenuService;
import co.dabling.msp.menu.service.impl.MenuServiceImpl;
import co.dabling.msp.menu.vo.MenuVO;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class MenuList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("메뉴리스트");
		HttpSession session = request.getSession();
		StoreService storeService = new StoreServiceImpl();
		MenuService menuService = new MenuServiceImpl();
		MenuVO menu = new MenuVO();
		StoreVO store = new StoreVO();

		// 로그인 사업자번호 찾기
		String businessNum = (String) session.getAttribute("businessNum");
		store = storeService.storeSelect(businessNum);
		
		//등록된 매장이 없다면
		if (store == null) {
			return "store/unStore.tiles";
		}
		//등록된 매장이 있다면
		int storeCode = store.getStoreCode();
		System.out.println(storeCode);

		List<MenuVO> storeMenuList = menuService.storeMenuSelect(storeCode);
		request.setAttribute("storeMenuList", storeMenuList);
		request.setAttribute("store", store);

		return "menu/menuList.tiles";

	}

}
