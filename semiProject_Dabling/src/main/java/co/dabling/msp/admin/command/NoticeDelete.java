package co.dabling.msp.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.notice.service.NoticeService;
import co.dabling.msp.notice.service.impl.NoticeServiceImpl;
import co.dabling.msp.notice.vo.NoticeVO;

public class NoticeDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 공지사항 삭제
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		NoticeService service = new NoticeServiceImpl();

		service.noticeDelete(noticeCode);

		// 리스트 다시 돌려주기.
		List<NoticeVO> notices = new ArrayList<>();
		NoticeService services = new NoticeServiceImpl();
		notices = services.noticeSelectList();
		request.setAttribute("notices", notices);
		return "admin/noticeForm.tiles";
	}

}
