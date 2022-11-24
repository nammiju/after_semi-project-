package co.dabling.msp.menu.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.dabling.msp.common.Command;
import co.dabling.msp.menu.service.MenuService;
import co.dabling.msp.menu.service.impl.MenuServiceImpl;
import co.dabling.msp.menu.vo.MenuVO;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class MenuUpdateForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		// 매장 등록메뉴검색
		HttpSession session = request.getSession();
		StoreService storeService = new StoreServiceImpl();
		MenuService menuService = new MenuServiceImpl();
		MenuVO menu = new MenuVO();
		StoreVO store = new StoreVO();

		// 로그인 사업자번호 찾기
		String businessNum = (String) session.getAttribute("businessNum");
		store = storeService.storeSelect(businessNum);
		int storeCode = store.getStoreCode();

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
			String menuName = multipart.getParameter("menuName");
			String price = multipart.getParameter("price");
			String pfile = multipart.getFilesystemName("menuImage");
			String ofile = multipart.getOriginalFileName("menuImage");

			menu.setMenuName(menuName);
			menu.setPrice(price);
			// 이미지가 null 아니면 변경
			if (!(pfile == null) && !(ofile == null)) {
				menu.setMenuImage("upload\\" + pfile);
				menu.setMenuImageRename(ofile);
			}
			menu.setMenuImage(null);
			menu.setMenuImageRename(null);

			menu = menuService.storeMenuOnSelect(storeCode, menuName);
			request.setAttribute("menu", menu);
			
			System.out.println(storeCode);
			System.out.println(menuName);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return "menu/menuUpdateForm.tiles";
	}

}
