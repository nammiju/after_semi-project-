package co.dabling.msp.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.dabling.msp.common.Command;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class SearchCommand implements Command{
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//검색커맨드왔는지 확인
		System.out.println("검색커맨드도착");
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		StoreService service = new StoreServiceImpl();
		List<StoreVO> list = new ArrayList<>();
		
		
		return "main/searchMain.tiles";
		
	}
}
