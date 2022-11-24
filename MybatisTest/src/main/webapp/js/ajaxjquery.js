/**
 *  ajaxjquery.js
 */
console.log('ajaxjquery')

$(function() {
   // 도서목록 json 타입 -> 화면에 출력.
   $.ajax({
      url: 'ajaxBookList.do',
      method: 'get',
      dataType: 'json',
      success: function(result) {
         console.log(result);
         $.each(result, function(prop, item) {
            $('#list').append(makeTr(item));
         })
      },
      error: function(error) {
         console.log(error);
      }
   });

   // 등록이벤트.
   $('#addBtn').on('click', addBookFnc);
});

function addBookFnc() {
   let code = $('input[name="bCode"]').val();
   let title = $('input[name="bTitle"]').val();
   let author = $('input[name="bAuthor"]').val();
   let press = $('input[name="bPress"]').val();
   let price = $('input[name="bPrice"]').val();

   console.log($('form[name="myfrm"]').serialize()); // 키, 밸류 형식으로자동으로 만드러줌

   $.ajax({
      url: 'ajaxBookAdd.do',
      method: 'post',
      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
      data: $('form[name="myfrm"]').serialize(),
      dataType: 'json',
      success: function(result) {
         console.log(result);
         $('#list').append(makeTr(result));
         init();
      },
      error: function(error) { console.log(error) }
   });
}

function init() {
   $('input[name="bCode"]').val("");
   $('input[name="bTitle"]').val("");
   $('input[name="bAuthor"]').val("");
   $('input[name="bPress"]').val("");
   $('input[name="bPrice"]').val("");
}

function makeTr(book = { bookCode: "", bookTitle: "", bookAuthor: "", bookPress: "", bookPrice: "" }) {
   return $('<tr />').append(
      $('<td />').text(book.bookCode),
      $('<td />').text(book.bookTitle),
      $('<td />').text(book.bookAuthor),
      $('<td />').text(book.bookPress),
      $('<td />').text(book.bookPrice),
      $('<td />').append($('<button />').text('수정').on('click', book, modifyFrm)),
      $('<td />').append($('<button />').text('삭제').on('click', book, deleteData))
   ).on('mouseover', book, showContent).on('click', book, showModal);

}

function modifyFrm(e) {
   console.log(e.data);
   localStorage.setItem('code', e.data.bookCode);
   localStorage.setItem('title', e.data.bookTitle);
   localStorage.setItem('author', e.data.bookAuthor);
   localStorage.setItem('press', e.data.bookPress);
   localStorage.setItem('price', e.data.bookPrice);

   let newTr = $('<tr />').append(
      $('<td />').text(e.data.bookCode),
      $('<td />').append($('<input />').val(e.data.bookTitle).on('change', function() { localStorage.setItem('title', $(this).val()) })),
      $('<td />').append($('<input />').val(e.data.bookAuthor).on('change', function() { localStorage.setItem('author', $(this).val()) })),
      $('<td />').append($('<input />').val(e.data.bookPress).on('change', function() { localStorage.setItem('press', $(this).val()) })),
      $('<td />').append($('<input />').val(e.data.bookPrice).on('change', function() { localStorage.setItem('price', $(this).val()) })),
      $('<td />').append($('<button />').text('변경').on('click', modifyData))
   );

   $(this).parentsUntil('#list').replaceWith(newTr);
}

function modifyData(e) {
   let code = localStorage.getItem('code');
   let title = localStorage.getItem('title');
   let author = localStorage.getItem('author');
   let press = localStorage.getItem('press');
   let price = localStorage.getItem('price');

   let book = { bookCode: code, bookTitle: title, bookAuthor: author, bookPress: press, bookPrice: price }
   let btn = $(this);

   // 수정 컨트롤.
   $.ajax({
      url: 'ajaxBookModify.do',
      method: 'post',
      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
      data: book,
      success: function(result) {
         console.log(result);
         if (result == 'Success') {
            let newTr = makeTr(book);
            btn.parentsUntil('#list').replaceWith(newTr);
         } else if (result == 'Fail') {
            alert('처리건수가 없습니다.')
         }
      },
      error: function(error) { console.log(error) }
   });

   localStorage.removeItem('code');
   localStorage.removeItem('title');
   localStorage.removeItem('author');
   localStorage.removeItem('press');
   localStorage.removeItem('price');
}

function deleteData(e) {
   let code = e.data.bookCode;
   let title = e.data.bookTitle;
   let author = e.data.bookAuthor;
   let press = e.data.bookPress;
   let price = e.data.bookPrice;

   let book = { bookCode: code, bookTitle: title, bookAuthor: author, bookPress: press, bookPrice: price }
   let btn = $(this);

   console.log(code, title)
   // 삭제 컨트롤.
   $.ajax({
      url: 'ajaxBookDelete.do',
      method: 'post',
      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
      data: book,
      success: function(result) {
         console.log(result);
         if (result == 'Success') {
            btn.parent().parent().remove();
         } else if (result == 'Fail') {
            alert('처리건수가 없습니다.')
         }
      },
      error: function(error) { console.log(error) }
   });
}

function showContent(e) {
   let code = e.data.bookCode;
   let title = e.data.bookTitle;
   let author = e.data.bookAuthor;
   let press = e.data.bookPress;
   let price = e.data.bookPrice;

   let book = { bookCode: code, bookTitle: title, bookAuthor: author, bookPress: press, bookPrice: price }
   $.ajax({
      url: 'ajaxBookContent.do',
      method: 'post',
      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
      data: book,
      dataType: 'json',
      success: function(result) {
         $('#content > div').eq(0).children().eq(1).text(result.bookCode);
         $('#content > div').eq(1).children().eq(1).text(result.bookAuthor);
         $('#content > div').eq(2).children().eq(1).text(result.bookTitle);
         $('#content > div').eq(3).children().eq(1).text(result.bookPress);
         $('#content > div').eq(4).children().eq(1).text(result.bookPrice);
      },
      error: function(error) { console.log(error) }
   });
}

function showModal() {
   $('#id01').css('display', 'block')

   let tr = $(this); // 내가 클릭한 tr을 의미

   // 모달창의 input을 내가 클릭한 tr의 데이터로 채워주기
   $('.container input[name="bCode"]').val($(this).children().eq(0).text());
   $('.container input[name="bTitle"]').val($(this).children().eq(1).text());
   $('.container input[name="bAuthor"]').val($(this).children().eq(2).text());
   $('.container input[name="bPress"]').val($(this).children().eq(3).text());
   $('.container input[name="bPrice"]').val($(this).children().eq(4).text());
   //모달의 수정버튼
   $('.container > button').eq(1).on('click', function() {
      let code = $('.container > input').eq(0).val();
      let title = $('.container > input').eq(1).val();
      let author = $('.container > input').eq(2).val();
      let press = $('.container > input').eq(3).val();
      let price = $('.container > input').eq(4).val();

      let book = { bookCode: code, bookTitle: title, bookAuthor: author, bookPress: press, bookPrice: price }
      //수정 컨트롤 
      $.ajax({
         url: 'ajaxBookModify.do',
         method: 'post',
         contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
         data: book,
         success: function(result) {
            console.log(result)
            if (result == 'Success') {
               document.getElementById('id01').style.display = 'none';
               let newTr = makeTr(book);
               tr.replaceWith(newTr);
            } else if (result == 'Fail') {
               alert('처리건수가 없습니다.')
            }
         },
         error: function(error) {
            console.log(error)
         }
      });
   });
}