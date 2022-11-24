package co.dabling.msp.admin.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.member.service.MemberService;
import co.dabling.msp.member.service.impl.MemberServiceImpl;
import co.dabling.msp.member.vo.MemberVO;
import co.dabling.msp.page.vo.PageVO;

public class MemberSelectForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원선택화면 출력 (전체회원 출력)
		String page = request.getParameter("page"); 
		page = page ==null ? "1" : page;
		int pg = Integer.parseInt(page);
		MemberService service = new MemberServiceImpl();
		int totalcount = service.totalCnt();
		PageVO paging = new PageVO(totalcount, pg); 
		List<MemberVO> members = service.pageList(pg);
		
		request.setAttribute("members", members);
		request.setAttribute("page", paging);

		return "admin/memberSelectForm.tiles";
	}

}
