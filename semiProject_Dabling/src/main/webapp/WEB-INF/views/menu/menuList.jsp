<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 회원명 부분 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
   rel="stylesheet">
<!-- 나머지 글자 폰트 -->
<link
   href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<!-- table css -->
<link href="assets/css/table.css" rel="stylesheet">
</head>

<body>
   <div class="img">
      <div class="content">
         <h1>매장메뉴빠른관리</h1>
      </div>
   </div>
   <div
      style="overflow: scroll; width: 100%; height: 500px; padding: 10px;">
      <div class="tbl-header">
         <c:if test="${empty storeMenuList }">
            <p>현재 매장의 등록된 메뉴가 없습니다.</p>
         </c:if>
         <c:if test="${not empty storeMenuList}">
            <input type="button" value="삭제하기" class="cancelBtn" id="deleteBtn">
            <table id="myTable">
               <thead>
                  <tr class="header">
                     <th>메뉴명</th>
                     <th>이미지</th>
                     <th>가격</th>
                     <th><input type="checkBox" value="삭제" class="delete" id="allDelete"></th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="menu" items="${storeMenuList}">
                     <tr>
                        <td><span ondblclick="changeName(this)"
                           data-value="${menu.menuName}">${menu.menuName}</span></td>
                        <td>
                           <div class="contentImage">
                              <c:if test="${not empty menu.menuImage }">
                                 <img id="image" src="${menu.menuImage}" alt="Image"
                                    ondblclick="changeMenu(this)"
                                    style="width: 250px; height: 150px;">
                              </c:if>
                           </div>
                        </td>
                        <td><span ondblclick="changePrice(this)"
                           data-value="${menu.price}"> <fmt:formatNumber
                                 value="${menu.price}" /></span></td>
                        <td><input class="check" type="checkBox" value="삭제"
                           class="delete"></td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </c:if>
      </div>
   </div>

   <script type="text/javascript">
      // 삭제 전체체크 ok
      let allDelete = document.querySelector("#allDelete")
      let deleteCheck = document.querySelector(".delete")

      allDelete.addEventListener('change', function () {
         //forEach 반복문사용.
         document.querySelectorAll('input[value="삭제"]').forEach(
            function (deleteCheck) {
               deleteCheck.checked = allDelete.checked;
               console.log(deleteCheck.checked)
               console.log(allDelete.checked)
            })
      })

      // 메뉴 화면삭제. ok
      document.querySelector('#deleteBtn').addEventListener('click', deleteMenu);

      function deleteMenu(deleteCheck) {
         let trs = document.querySelectorAll('table>tbody>tr');

         //DB삭제 ok
         if (confirm('메뉴를 삭제하시겠습니까?')) {
            for (let i = 0; i < trs.length; i++) {
               if (trs[i].children[3].children[0].checked) {
                  trs[i].remove();
                  console.log(trs[i]);
                  let menuName = trs[i].children[0].textContent;
                  let url = "menuDelete.do?menuName=" + menuName;

                  fetch(url)
                     .then(response => response.text())
                     .then(data => { // 결과처리 함수
                        if (data == '0') {
                           alert(menuName + '삭제 실패!')
                        } else {
                           alert(menuName + '삭제 완료!')
                        }
                     })
               }
            }
         }
      }
      //더블클릭시 메뉴변경 ok
      function changeName(value) {
         let menuName = $(value).data("value");
         if (confirm(menuName + '를 메뉴를 수정하시겠습니까?')) {
            let menuNameRename = prompt(menuName + " : 변경메뉴명을 입력하세요" + "");
            let url = "menuNameUpdate.do?menuName=" + menuName +
               "&menuNameRename=" + menuNameRename;
            fetch(url)
               .then(response => response.text())
               .then(data => { // 결과처리 함수
                  if (data == '0') {
                     alert(menuNameRename + '변결 실패!');
                  } else {
                     alert(menuNameRename + '변경 완료!');
                	  location.reload();
                  }
               })
         }
      }

      //더블클릭시 가격변경 ok
      function changePrice(value) {
         let menuName = value.parentNode.parentNode.children[0].textContent;
         let price = $(value).data("value");
         if (confirm(menuName + price + ' 가격을 수정하시겠습니까?')) {
            let priceChange = prompt("가격 입력 : " + "");
            let url = "menuPriceUpdate.do?priceChange=" + priceChange +
               "&menuName=" + menuName;
            fetch(url)
               .then(response => response.text())
               .then(data => { // 결과처리 함수
                  if (data == '0') {
                     alert(priceChange + ' 변경 실패!');
                  } else {
                     alert(priceChange + ' 변경 완료!');
                	  location.reload();
                  }
               })
         }
      }
   </script>
</html>