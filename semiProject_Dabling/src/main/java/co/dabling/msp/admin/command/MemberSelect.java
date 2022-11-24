package co.dabling.msp.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.member.service.MemberService;
import co.dabling.msp.member.service.impl.MemberServiceImpl;
import co.dabling.msp.member.vo.MemberVO;

public class MemberSelect implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원 1건 조회
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		String job = request.getParameter("job");
		MemberVO member = new MemberVO();
		MemberService service = new MemberServiceImpl();
		member = service.memberSelect((memberCode));
		request.setAttribute("member", member);
		if(job == null) {
			return "admin/memberSelect.tiles";
		}
		//회원정보수정 화면으로 1건 조회한값 반환.
		if(job.equals("memberUpdate")) {
		request.setAttribute("member", member);
		return "admin/memberUpdateForm.tiles";
	}
		return "admin/memberSelect.tiles";
	
//		if(job.equals("memberSelect")) {
//			request.setAttribute("member", member);
//			return "admin/memberSelect.tiles";
//		}
//		return null;
	}
}