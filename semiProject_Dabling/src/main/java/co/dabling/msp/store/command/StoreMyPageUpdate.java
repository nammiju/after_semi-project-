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

public class StoreMyPageUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 매장수정
		System.out.println("매장수정");
		HttpSession session = request.getSession();
		String businessNum = (String) session.getAttribute("businessNum");
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
			// 파일저장, 업로드파일제목으로 저장.ㅣ
			String pfile = multipart.getFilesystemName("storeImage");
			String ofile = multipart.getOriginalFileName("storeImage");

			vo.setStoreName(storeName);
			vo.setStoreRegion(storeRegion);
			vo.setStoreCategory(storeCategory);
			vo.setStoreInfo(storeInfo);
			vo.setLat(lat);
			vo.setLng(lng);
			vo.setStoreAddress(storeAddress);
			vo.setBusinessNum(businessNum);
			
			//이미지가 null 아니면 변경
			if (!(pfile == null)&&!(ofile == null)) {
				vo.setStoreImage("upload\\" + pfile); // 원본 파일명
				vo.setStoreImageRename(ofile); // 동일파일이름 변경파일명
			}
			
			//값확인
			System.out.println(businessNum);
			System.out.println("이미지파일명" + pfile);
			System.out.println("이미지파일명2" + ofile);

			int result = service.storeUpdate(vo);
			if (result > 0) {
				System.out.println(result + "건 수정성공!");
			}
			vo = service.storeSelect(businessNum);

		} catch (IOException e) {
			e.printStackTrace();
		}
		//매장 승인결과
		String message = "승인완료";
		if(vo.getApprovalState() == 0) {
			message = "승인대기";
		}
		//마이페이지 넘겨줄 값.
		request.setAttribute("message", message);
		request.setAttribute("store", vo);

		return "store/storeMyPage.tiles";
	}

}
