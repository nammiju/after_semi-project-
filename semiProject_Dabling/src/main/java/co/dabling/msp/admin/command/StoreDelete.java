package co.dabling.msp.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.notice.service.NoticeService;
import co.dabling.msp.notice.service.impl.NoticeServiceImpl;
import co.dabling.msp.notice.vo.NoticeVO;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;

public class StoreDelete implements Command{
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 매장정보삭제 
		String businessNum = request.getParameter("businessNum");
		StoreService service = new StoreServiceImpl();
		service.storeDelete(businessNum);
		
		//리스트 다시 돌려주기.
		List<NoticeVO> notices = new ArrayList<>();
		NoticeService services = new NoticeServiceImpl();
		notices = services.noticeSelectList();
		request.setAttribute("notices", notices);
		return "admin/storeDeleteForm.tiles";
	}

}
