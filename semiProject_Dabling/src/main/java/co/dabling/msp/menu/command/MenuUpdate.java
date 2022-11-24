package co.dabling.msp.menu.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

public class MenuUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 매장 메뉴1건 수정처리.
		MenuService menuService = new MenuServiceImpl();
		StoreService storeService = new StoreServiceImpl();
		MenuVO menu = new MenuVO();
		StoreVO store = new StoreVO();
		List<MenuVO>storeMenuList = new ArrayList<MenuVO>();

		// 세션값 매장코드
		HttpSession session = request.getSession();
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

			// 파일저장, 업로드파일제목으로 저장.ㅣ
			String pfile = multipart.getFilesystemName("menuImage");
			String ofile = multipart.getOriginalFileName("menuImage");
			String menuName = multipart.getParameter("menuName");
			String menuNameRename = multipart.getParameter("menuReName");
			String price = multipart.getParameter("price");
			
			// 값 확인.
			System.out.println("세션 storeCode값 : "+storeCode);
			System.out.println("menuName: " + menuName);
			System.out.println("menuNameRename: " + menuNameRename);
			System.out.println("price: " + price);
			
			menu.setStoreCode(storeCode);
			menu.setMenuName(menuName);
			menu.setMenuNameRename(menuNameRename);
			menu.setPrice(price);
			// 이미지가 null 아니면 변경
			if (!(pfile == null) && !(ofile == null)) {
				menu.setMenuImage("upload\\" + pfile);
				menu.setMenuImageRename(ofile);
			}
			System.out.println(menu.getMenuImage());
			System.out.println(menu.getMenuImageRename());

			int result = menuService.menuUpdate(menu);
			if(result > 0) {
				System.out.println(result + "건 메뉴수정");
			}
			storeMenuList = menuService.storeMenuSelect(storeCode);
			request.setAttribute("storeMenuList", storeMenuList);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return "menu/menuList.tiles";

	}
}
