package co.dabling.msp.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.notice.service.NoticeService;
import co.dabling.msp.notice.service.impl.NoticeServiceImpl;
import co.dabling.msp.notice.vo.NoticeVO;

public class NoticeUpdateForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 공지사항 수정페이지.
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		NoticeVO notice = new NoticeVO();
		NoticeService service = new NoticeServiceImpl();
		notice = service.noticeSelect(noticeCode);
		
		request.setAttribute("notice", notice);
		return "admin/noticeUpdateForm.tiles";
	}

}
