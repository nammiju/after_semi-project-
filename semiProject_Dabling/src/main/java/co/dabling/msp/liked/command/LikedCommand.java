package co.dabling.msp.liked.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.liked.service.LikedService;
import co.dabling.msp.liked.service.impl.LikedServiceImpl;
import co.dabling.msp.liked.vo.LikedVO;

public class LikedCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("likeCommand도착");
		LikedService service = new LikedServiceImpl();
		
		String stringMemberCode = request.getParameter("memberCode");
		String stringStoreCode = request.getParameter("storeCode");
		int memberCode = Integer.parseInt(stringMemberCode);
		int storeCode = Integer.parseInt(stringStoreCode);
System.out.println(stringMemberCode+"/"+memberCode+"/"+memberCode+"/"+storeCode);
		
		boolean like = service.likeCheck(storeCode, memberCode);
		// 존재하는 값이 없으면 1(true)리턴. 있으면 0(false)리턴 
		
		String likeMessage = null;
		if(like) {
			likeMessage="찜추가 완료";
			service.insertLike(storeCode, memberCode);
		}else {
			likeMessage="찜취소 완료";
			service.deleteLike(storeCode, memberCode);
		}
		
		return "ajax:"+likeMessage;
	}

}
