package co.dabling.msp.store.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import co.dabling.msp.common.Command;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class AjaxStoreSearch implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
			StoreService service = new StoreServiceImpl();
			List<StoreVO> list = new ArrayList<StoreVO>();
			System.out.println("ajaxStoreSearch도착");
			
			String column = request.getParameter("searchColumn");
			String searchKey = request.getParameter("searchKey");
			System.out.println(column+"/"+searchKey);
			
			list = service.storeList(column, searchKey);
			
//			ObjectMapper objectMapper = new ObjectMapper();
//			String selectList = null;
//			try {
//				selectList = objectMapper.writeValueAsString(list);
//			}catch(JsonProcessingException e){
//				e.printStackTrace();
//			}
			
			
			for(StoreVO vo : list) {
				System.out.println("storeName= "+vo.getStoreName());
			}

			request.setAttribute("selectList", list);
			return "main/searchMain.tiles";
	}

}
