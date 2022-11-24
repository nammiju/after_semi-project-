package co.dabling.msp.store.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dabling.msp.common.Command;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class StoreInsert implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		// 매장 승인신청
		// String saveFolder = "C:\\upload";
		StoreService service = new StoreServiceImpl();
		StoreVO vo = new StoreVO();

		// 이미지파일 업로드.
		String saveFolder = request.getSession().getServletContext().getRealPath("/upload"); // 저장폴더.
		int maxSize = 5 * 1024 * 1024; // 5 메가 제한
		String encod = "UTF-8";

		MultipartRequest multipart;
		try {
			multipart = new MultipartRequest(request, // 요청정보
					saveFolder, // 저장위치
					maxSize, // 파일크기
					encod, // 인코딩
					new DefaultFileRenamePolicy() // 같은이름 파일 재지정.(덮어쓰기x)
			);

			String storeName = multipart.getParameter("storeName");
			String storeRegion = multipart.getParameter("storeRegion");
			String storeCategory = multipart.getParameter("storeCategory");
			String storeInfo = multipart.getParameter("storeInfo");
			double lat = Double.parseDouble(multipart.getParameter("lat"));
			double lng = Double.parseDouble(multipart.getParameter("lng"));
			String storeAddress = multipart.getParameter("storeAddress");
			String businessNum = multipart.getParameter("businessNum");
			// 파일저장, 업로드파일제목으로 저장.ㅣ
			String pfile = multipart.getFilesystemName("storeImage");
			String ofile = multipart.getOriginalFileName("storeImage");

			System.out.println(storeCategory);
			
			vo.setStoreName(storeName);
			vo.setStoreRegion(storeRegion);
			vo.setStoreCategory(storeCategory);
			vo.setStoreInfo(storeInfo);
			vo.setLat(lat);
			vo.setLng(lng);
			vo.setStoreAddress(storeAddress);
			vo.setBusinessNum(businessNum);
			
			// 이미지가 null 아니면 입력
			if (!(pfile == null) && !(ofile == null)) {
				vo.setStoreImage("upload\\" + pfile); // 원본 파일명
				vo.setStoreImageRename(ofile); // 동일파일이름 변경파일명
			}else {
				vo.setStoreImage(null); // 원본 파일명
				vo.setStoreImageRename(null); // 동일파일이름 변경파일명
			}
			service.storeInsert(vo);

		} catch (IOException e) {
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		String businessNum = (String) session.getAttribute("businessNum");
		vo = service.storeSelect(businessNum);
		request.setAttribute("store", vo);
		String message = "승인대기";
		request.setAttribute("message", message);

		return "store/storeInsert.tiles";
	}

}
