package co.dabling.msp.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.dabling.msp.common.Command;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class StoreUpdate implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//매장정보 수정.
		String businessNum = request.getParameter("businessNum");
		int storeCode = Integer.parseInt(request.getParameter("storeCode"));
		String storeName = request.getParameter("storeName");
		String storeRegion = request.getParameter("storeRegion");
		String storeCategory = request.getParameter("storeCategory");
		String storeInfo = request.getParameter("storeInfo");
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));
		String storeImage = request.getParameter("storeImage");
		String storeAddress = request.getParameter("storeAddress");
		
		StoreVO vo = new StoreVO();
		vo.setBusinessNum(businessNum);
		vo.setStoreName(storeName);
		vo.setStoreRegion(storeRegion);
		vo.setStoreCode(storeCode);
		vo.setStoreCategory(storeCategory);
		vo.setStoreInfo(storeInfo);
		vo.setLat(lat);
		vo.setLng(lng);
		vo.setStoreImage(storeImage);
		vo.setStoreAddress(storeAddress);
		
		StoreService service = new StoreServiceImpl();
		service.storeUpdate(vo);

		return "admin/storeUpdateForm.tiles";
	}

}
