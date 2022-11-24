package co.dabling.msp.menu.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.dabling.msp.common.Command;
import co.dabling.msp.menu.service.MenuService;
import co.dabling.msp.menu.service.impl.MenuServiceImpl;
import co.dabling.msp.menu.vo.MenuVO;
import co.dabling.msp.reservation.service.ReservationService;
import co.dabling.msp.reservation.service.impl.ReservationServiceImpl;
import co.dabling.msp.reservation.vo.ReservationVO;

public class MenuDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//매장에서 등록메뉴삭제.
		System.out.println("메뉴삭제");
		MenuService service = new MenuServiceImpl();
		String menuName =  request.getParameter("menuName");
		ObjectMapper oMapper = new ObjectMapper();  //json 형태의 문자열 처리를 위해
		
		int result = service.menuDelete(menuName);
		if(result > 0) {
			return "ajax:"+result; 
		}
		return "ajax:"+result; 
	}

}
