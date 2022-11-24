package co.dabling.msp.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.dabling.msp.common.Command;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class MainCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//메인커맨드왔는지 확인
		
		//메인갈때 스토어 전체 리스트 데이터 가져가기
		StoreService service = new StoreServiceImpl();
		List<StoreVO> list = service.storeSelectList();
		request.setAttribute("storeList", list);

		return "mainPage.do";
	}

}
