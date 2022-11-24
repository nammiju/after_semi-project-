package co.dabling.msp.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.notice.service.NoticeService;
import co.dabling.msp.notice.service.impl.NoticeServiceImpl;
import co.dabling.msp.notice.vo.NoticeVO;

public class NoticeUpdate implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 공지사항 수정
		String title = request.getParameter("title"); //공지제목
		String cont = request.getParameter("cont"); //공지내용
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode")); //공지번호
		NoticeVO notice = new NoticeVO();
		NoticeService service = new NoticeServiceImpl();
		
		notice.setTitle(title);
		notice.setCont(cont);
		notice.setNoticeCode(noticeCode);
		service.noticeUpdate(notice);
		
		//리스트 다시 돌려주기.
		List<NoticeVO> notices = new ArrayList<>();
		NoticeService services = new NoticeServiceImpl();
		notices = services.noticeSelectList();
		request.setAttribute("notices", notices);
		return "admin/noticeForm.tiles";
	}

}
