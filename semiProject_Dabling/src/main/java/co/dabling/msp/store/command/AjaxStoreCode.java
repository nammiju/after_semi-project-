package co.dabling.msp.store.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dabling.msp.common.Command;

public class AjaxStoreCode implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String storeCode = request.getParameter("storeCode");
		HttpSession session = request.getSession();
		
		session.setAttribute("storeCode", storeCode);
		return "ajax:"+storeCode;
	}

}
