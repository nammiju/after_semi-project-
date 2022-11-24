package co.dabling.msp.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.member.service.MemberService;
import co.dabling.msp.member.service.impl.MemberServiceImpl;
import co.dabling.msp.member.vo.MemberVO;

public class MemberUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String businessNum = request.getParameter("businessNum");
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		int author = Integer.parseInt(request.getParameter("author"));

		MemberVO vo = new MemberVO();
		vo.setMemberCode(memberCode);
		vo.setEmail(email);
		vo.setPassword(password);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setBusinessNum(businessNum);
		vo.setAuthor(author);

		MemberService service = new MemberServiceImpl();
		service.memberUpdate(vo);

		return "admin/memberUpdateForm.tiles";
	}
}
