package co.dabling.msp.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.notice.service.NoticeService;
import co.dabling.msp.notice.service.impl.NoticeServiceImpl;
import co.dabling.msp.notice.vo.NoticeVO;

public class NoticeForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 공지사항페이지.
		List<NoticeVO> notice = new ArrayList<>();
		NoticeService service = new NoticeServiceImpl();
		notice = service.noticeSelectList();
		request.setAttribute("notices", notice);
		return "admin/noticeForm.tiles";
	}

}
