package co.dabling.msp.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class StoreSelect implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 매장 1건 조회
		String businessNum = request.getParameter("businessNum");
		String job = request.getParameter("job");
		StoreVO store = new StoreVO();
		StoreService service = new StoreServiceImpl();
		store = service.storeSelect(businessNum);
		request.setAttribute("store", store);
		if (job == null) {
			return "admin/storeSelect.tiles";
		}
		//매장정보수정 화면으로 1건 조회한값 반환.
		if (job.equals("storeUpdate")) {
			request.setAttribute("store", store);
			return "admin/storeUpdateForm.tiles";
		}
		if(job.equals("storeDelete")) {
			request.setAttribute("store", store);
			return "admin/storeDeleteForm.tiles";
		}
			return "admin/storeSelect.tiles";
	}
}
