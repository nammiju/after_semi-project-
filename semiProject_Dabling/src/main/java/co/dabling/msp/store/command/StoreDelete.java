package co.dabling.msp.store.command;

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

public class StoreDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//매장삭제 완료
		System.out.println("매장 삭제");
		HttpSession session = request.getSession();
		StoreService service = new StoreServiceImpl();
		StoreVO store = new StoreVO();
		
		
		//로그인 사업자번호 찾기
		String businessNum = (String) session.getAttribute("businessNum");
		service.storeDelete(businessNum);
		System.out.println(businessNum);
		
		return "main/main.tiles";
	}

}
