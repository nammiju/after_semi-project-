package co.dabling.msp.member.command;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.member.service.MemberService;
import co.dabling.msp.member.service.impl.MemberServiceImpl;

public class SendEmail implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberService service = new MemberServiceImpl();
		String email = request.getParameter("email");

		// 인증번호 생성
		Random random = new Random();
		int createNum = 0;
		String ranNum = "";
		int letter = 6;
		String resultNum = "";

		for (int i = 0; i < letter; i++) {
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			resultNum += ranNum;
		} // 인증번호 생성 끝 ->resultNum에 저장

		String subject = "Dabling 임시비밀번호 발급 메일입니다.";
		String content = "회원님의 임시 비밀번호는 <" + resultNum + "> 입니다.\n" + "로그인 후 새 비밀번호를 설정해주시길 권장드립니다.";

		String result = service.sendEmail("nmj_1025@naver.com", email, subject, content);

		// 비밀번호 변경처리
		service.memberPasswordUpdate(email, resultNum);
		

		if (result == "Fail") {
			return "failed";
		}

		return "ajax:" + resultNum;
	}
}
