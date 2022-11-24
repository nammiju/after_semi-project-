package co.dabling.msp.menu.command;

import java.util.ArrayList;
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

public class MenuSearch implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 매장의 수정할 메뉴검색 페이지
		StoreVO store = new StoreVO();
		MenuVO menu = new MenuVO();
		HttpSession session = request.getSession();
		StoreService service = new StoreServiceImpl();
		MenuService menuService = new MenuServiceImpl();
		String businessNum = (String) session.getAttribute("businessNum");
		List<MenuVO>menuList = new ArrayList<MenuVO>();
		
		//등록매장 검색
		store = service.storeSelect(businessNum);
		
		// 등록된 매장이 없다면
		if (store == null) {
			return "store/unStore.tiles";
		}
		//등록된 매장이 있다면(전체메뉴)
		int storeCode = store.getStoreCode();
		request.setAttribute("store", store);
		request.setAttribute("businessNum", businessNum);
		menuList = menuService.storeMenuSelect(storeCode);
		request.setAttribute("menuList", menuList);
		
		//검색된 1건의 메뉴
		String menuName = request.getParameter("menuName");
		menu = menuService.storeMenuOnSelect(storeCode, menuName);
		request.setAttribute("menu", menu);
		
		
		return "menu/menuUpdateSearch.tiles";
	}

}
