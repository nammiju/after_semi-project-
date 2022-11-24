package co.dabling.msp.store.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.page.vo.PageVO;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class MainPageing implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("페이징처리");
		StoreVO vo = new StoreVO();
		StoreService service = new StoreServiceImpl();
		
		String page = request.getParameter("page");
		page = page == null ? "1" : page; 
		int pg = Integer.parseInt(page); //입력페이지.
		//전체 매장리스트
		List<StoreVO>store = service.storeSelectList();
		int totalPage = store.size(); //전체페이지.
		
		PageVO pageing = new PageVO(totalPage,pg); //전체페이지, 입력페이지.
		//매장 페이징된 리스트 반환
		List<StoreVO> storePagList = service.pageList(pg); // service.getList(new BoardVO(0, "", "", "", "", 0, ""));
		
		//값 확인
		for(StoreVO store1 : storePagList) {
			System.out.println(store1.getStoreName());
		}
		
		//값 넘기기 => 속성값 세팅 .
		request.setAttribute("storePagList", storePagList);  //리스트
		request.setAttribute("page", pageing); //페이지
		System.out.println("totalPage: " + totalPage);
		System.out.println("page:"+pg);
		
		return "main/main.tiles";
	}

}
