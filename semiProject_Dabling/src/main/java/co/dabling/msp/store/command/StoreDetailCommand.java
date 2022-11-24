package co.dabling.msp.store.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.dabling.msp.common.Command;
import co.dabling.msp.liked.service.LikedService;
import co.dabling.msp.liked.service.impl.LikedServiceImpl;
import co.dabling.msp.menu.service.MenuService;
import co.dabling.msp.menu.service.impl.MenuServiceImpl;
import co.dabling.msp.menu.vo.MenuVO;
import co.dabling.msp.relpy.service.ReplyServcie;
import co.dabling.msp.relpy.service.impl.ReplyServiceImpl;
import co.dabling.msp.relpy.vo.ReplyVO;
import co.dabling.msp.review.service.ReviewService;
import co.dabling.msp.review.service.impl.ReviewServiceImpl;
import co.dabling.msp.review.vo.ReviewVO;
import co.dabling.msp.store.service.StoreService;
import co.dabling.msp.store.service.impl.StoreServiceImpl;
import co.dabling.msp.store.vo.StoreVO;

public class StoreDetailCommand implements Command {
//남미주파일
   @Override
   public String exec(HttpServletRequest request, HttpServletResponse response) {
      System.out.println("스토어디테일커맨드 도착");

      HttpSession session = request.getSession();
      StoreService service = new StoreServiceImpl();
      MenuService menuService = new MenuServiceImpl();
      ReviewService reviewService = new ReviewServiceImpl();
      LikedService likeService = new LikedServiceImpl();
      ReplyServcie replyService = new ReplyServiceImpl();

      StoreVO store = new StoreVO();
      List<MenuVO> menuList = new ArrayList<>();
      List<ReviewVO> reviewList = new ArrayList<>();
      List<ReplyVO> replyList = new ArrayList<>();

      // 버튼 클릭된 식당정보 받아와서 식당 및 식당별 메뉴 조회
      int storeCode = Integer.parseInt(request.getParameter("storeCode"));
      System.out.println("storecode: " + storeCode);
      store = service.storeSelectByCode(storeCode);// 식당조회

      // 메뉴리스트조회
      menuList = menuService.storeMenuSelect(storeCode);

      // 리뷰리스트조회
      reviewList = reviewService.reviewSelectList("storeCode", storeCode);
      
      // 리뷰답변리스트 조회
      replyList = replyService.replySelectList();

      // 로그인 확인 후 찜버튼 값 전달
      String likeValue = null;

      if (session.getAttribute("memberCode")!=null) {
         int memberCode = (int) session.getAttribute("memberCode");
         likeValue = "찜하기";
         boolean like = likeService.likeCheck(storeCode, memberCode);
         // 존재하는 값이 없으면 1(true)리턴. 있으면 0(false)리턴 
         if(!like) {
            likeValue = "찜취소";
         }
      }

      
      // 조회된 식당정보,메뉴정보,리뷰,찜 값 리턴
      request.setAttribute("store", store);
      request.setAttribute("menuList", menuList);
      request.setAttribute("reviewList", reviewList);
      request.setAttribute("replyList", replyList);
      request.setAttribute("likeValue", likeValue);

      return "store/store.tiles";
   }

}