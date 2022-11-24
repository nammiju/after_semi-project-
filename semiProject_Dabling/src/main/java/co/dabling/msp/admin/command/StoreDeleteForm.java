package co.dabling.msp.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;

public class StoreDeleteForm implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 매장삭제화면 출력.
		return "admin/storeDeleteForm.tiles";
	}

}
