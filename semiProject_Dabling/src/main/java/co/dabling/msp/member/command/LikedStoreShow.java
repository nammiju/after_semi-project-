package co.dabling.msp.member.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dabling.msp.common.Command;
import co.dabling.msp.liked.service.LikedService;
import co.dabling.msp.liked.service.impl.LikedServiceImpl;
import co.dabling.msp.liked.vo.LikedVO;

public class LikedStoreShow implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("회원메뉴 매장 like 조회");
		HttpSession session = request.getSession();
		LikedVO vo = new LikedVO();
		List<LikedVO>likeList = new ArrayList<LikedVO>();
		LikedService service = new LikedServiceImpl();
		
		//로그인 회원멤버코드 조회
		int memberCode = (int) session.getAttribute("memberCode");
		vo.setMemberCode(memberCode);
		likeList = (List<LikedVO>) service.likeList(vo);
		if(likeList.size() == 0) {
			return "main.do";
		}
		request.setAttribute("likeList", likeList);
		
		//확인
		for(LikedVO like : likeList) {
			System.out.println("like 번호:"+like.getLikeCode());
		}
		return "member/likedStoreShow.tiles";
	
	}

}
