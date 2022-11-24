package co.dabling.msp.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;

public class StoreUpdateForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 매장정보수정 페이지 출력.
		return "admin/storeUpdateForm.tiles";
	}

}
