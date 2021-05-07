<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%@include file="/WEB-INF/views/common/header.jsp"%>
   <div class="container">
      <fieldset>
         <legend>AJAX</legend>
         <div>
            <h3>1. 서버로 데이터 보내기</h3>
            <input type="text" id="ajax1">
            <button class="btn btn-info" onclick="jsAjax();">보내기(JS)</button>
            <button class="btn btn-danger" id="jQ1">보내기(jQuery)</button>
         </div>
         <div>
            <h3>2. 서버에서 기본형 데이터 받기</h3>
            <button class="btn btn-danger" id="jQ2">데이터받기</button>
            <p class="ajaxResult"></p>
         </div>
         <div>
            <h3>3. 서버로 기본형 데이터 보내고 기본형 데이터 받기</h3>
            <input type="text" id="firstNum">
            <input type="text" id="secondNum">
            <button class="btn btn-danger" id="jQ3">두 수의 합 받기</button>
            <p class="ajaxResult"></p>
         </div>
         <div>
            <h3>4. 서버로 객체 데이터 보내기</h3>
            <input type="text" id="name">
            <input type="text" id="age">
            <input type="text" id="addr">
            <button class="btn btn-danger" id="jQ4">객체보내기</button>
         </div>
         <div>
            <h3>5. 서버로 기본형 데이터 보내고, 결과로 객체 받기</h3>
            <input type="text" id="ajax5">
            <button class="btn btn-danger" id="jQ5">조회</button>
            <p class="ajaxResult"></p>
         </div>
         <div>
            <h3>6. 서버에서 리스트타입 결과 받기</h3>
            <button class="btn btn-danger" id="jQ6">조회</button>
            <p class="ajaxResult"></p>
         </div>
         <div>
            <h3>7. 서버에서 맵타입 결과 받기</h3>
             <button class="btn btn-danger" id="jQ7">조회</button>
            <p class="ajaxResult"></p>
         </div>
         <div>
            <h3>8. 서버에서 객체타입 결과받기(GSON)</h3>
            <input type="text" id="ajax8">
            <button class="btn btn-danger" id="jQ8">조회</button>
            <p class="ajaxResult"></p>
         </div>
         <div>
            <h3>9. 서버에서 리스트타입 결과 받기(GSON)</h3>
            <button class="btn btn-danger" id="jQ9">조회</button>
            <p class="ajaxResult"></p>
         </div>
         <div>
            <h3>10. 서버에서 맵타입 결과 받기(GSON)</h3>
             <button class="btn btn-danger" id="jQ10">조회</button>
            <p class="ajaxResult"></p>
         </div>
      </fieldset>
   </div>
   <script>
      function jsAjax(){
         //1. XMLHttpRequest 객체 생성
         var xhttp = new XMLHttpRequest();
         var msg = document.getElementById("ajax1").value;   //input입력갑 ㅅ부르기 자바스크립트로
         //2. 요청정보를 설정      보낼준비 끝남   겟방식,비동기식,맵핑값
         xhttp.open("GET","/ajaxTest1?msg="+msg,true);
         //3. 데이터 처리에 따라 동작할 함수설정   이제 어떤 함수를 동작할 지
         xhttp.onreadystatechange = function(){      //상태가 바뀔 때 마다
            if(this.readyState == 4 && this.status == 200){   //정상적으로 처리 되었을 때 호출되는 함수
               console.log("서버 전송 성공");
            }else if(this.readyState == 4 && this.status == 404){//요청페이지가 없는 경우
               console.log("서블릿 없음");               
            }
         }
         //4. 서버에 요청
         xhttp.send();
      }
      $("#jQ1").click(function(){
         var msg = $("#ajax1").val();   //input입력갑 
         $.ajax({
            url : "/ajaxTest1",      //넘어가는ㄴ페이지
            data : {msg:msg},      //{key,value} 객체타입으로 전송하는 것
            type : "get",            //전송방식
            success : function(){
               console.log("서버 전송 성공");
            },
            error : function(){
               console.log("에러났다 도움!");
            },
            complete : function(){      //성공실패여부상관없이 실행되는
               console.log("성공/실패 여부와 상관없이 호출");               
            }
         });
      });
      $("#jQ2").click(function(){
         var result = $(this).next();   //보내줄게 없고 받을값만 있기 때문에
         $.ajax({
            url : "/ajaxTest2",
            type : "get",
            success : function(data){   //서버가 주는 데이터가 매개변수로 들어옴
               result.html(data);
            },
            error : function(){
               console.log("실패");
            }
         });
      });
      $("#jQ3").click(function(){
         var result = $(this).next();
         var num1 = $("#firstNum").val();
         var num2 = $("#secondNum").val();
         $.ajax({
            url : "/ajaxTest3",
            type : "post",
            data : {firstNum:num1,secondNum:num2},      //서버에 전달하는 값들
            success : function(data){      //서버가 되돌려주는 값 data라는 매개변수로 받아서 
               result.html(data);
            },
            error : function(){
               console.log("실패");
            }
         });
      });
      $("#jQ4").click(function(){
         var name = $("#name").val();
         var age = $("#age").val();
         var addr = $("#addr").val();
         //객체를 만들어서 보내기 객체 생성ㅂ분
         var student = {name:name, age:age, addr:addr};
         $.ajax({
            url : "/ajaxTest4",
            type : "get",
            data : student,   //객체를 보낼 땐 이릏게
            success : function(){
               
            },
            error : function(){
               console.log("실패");
            }
         });
      });
      $("#jQ5").click(function(){
         var memberId = $("#ajax5").val();
         var result = $(this).next();
         $.ajax({
            url : "/ajaxTest5",
            type : "get",
            data : {memberId:memberId},
            success : function(data){
               //리턴된 data는 객체타입으로 꺼내서 사용해야 함
               if(data == null){
                  result.html("회원 정보가 없습니다.");
               }else{
                  result.empty();
                  
                  var memberNo = data.memberNo;      //변수 = data.키값으로 이렇게 하나하나 꺼내서 사용하면 됌 키값으로 꺼내서
                  result.append("회원번호 : "+memberNo+"<br>");
                  
                  var memberId = data.memberId;
                  result.append("회원아이디 : "+memberId+"<br>");
                  
                  var memberName1 = data.memberName1;
                  result.append("회원이름(인코딩x): "+memberName1+"<br>");
                  
                  var memberName2 = data.memberName2;
                  result.append("회원이름(인코딩o): "+memberName2+"<br>");
                  
                  var memberName3 = decodeURIComponent(data.memberName2);
                  result.append("회원이름(인코딩,디코딩 o) :"+memberName3);
               }
            }
         });
      });
      $("#jQ6").click(function(){
         var result = $(this).next();
         $.ajax({
            url : "/ajaxTest6",
            type : "get",
            success : function(data){
               //data에 list타입으로 들어가있다
               if(data.length != 0){
                  var html = "";
                  for(var i =0; i<data.length; i++){
                     var memberNo = data[i].memberNo;
                     var memberName = decodeURIComponent(data[i].memberName);
                     var phone = data[i].phone;
                     html += "회원번호 : " + memberNo+"/ 이름 : "+memberName+"/ 전화번호 : "+phone+"<br>";
                     if(i == 4){
                        break;
                     }
                  }
                  result.html(html);
               }else{
                  result.html("회원정보가 없습니다");
               }
            }
         });
      });
      $("#jQ7").click(function(){
            var result = $(this).next();
            $.ajax({
               url: "/ajaxTest7",
               type :"get",
               success : function(data){
                  var html = "";
                  var keys = Object.keys(data);      //오브젝트 객체의 키라는 데이터를 전부다 다 가져온다
                  console.log(data);
                  for(var i =0; i<keys.length,i++;){
                     var memberNo = data[keys[i]].memberNo;   //키 하나 꺼낸거 그 키에 해당하는 멤버넘버
                     var memberName = decodeURIComponent(data[keys[i]].memberName);   //키 하나 꺼낸거의 멤버내임
                     var phone = data[keys[i]].phone;
                     html += "회원번호: "+memberNo+"/ 이름: "+memberName+"/ 전하번호: "+phone+"<br>";
                  }
                  result.html(html);
               }
            });
      });
      $("#jQ8").click(function(){
         var result = $(this).next();
         var memberId = $("#ajax8").val();
         $.ajax({
            url : "/ajaxTest8",
            data : {memberId:memberId},
            type : "get",
            success : function(data){      //data는 멤버객체 그래서 뒤에 오는 data.멤버객체안의변수명 과 똑같이 만들어진다
               if(data != null){
                  var memberNo = data.memberNo;
                  var memberName = data.memberName;
                  var phone = data.phone;
                  result.html("번호 : "+memberNo+"/ 이름 : "+memberName+"/ 전화번호 : "+phone);
               }else{
                  result.html("회원정보가 없습니다.");
               }
            }
         });
      });
      $("#jQ9").click(function(){
         var result = $(this).next();
         $.ajax({
            url : "/ajaxTest9",
            success : function(data){
               if(data.length != 0){
                  var html="";
                  for(var i =0; i<data.length; i++){
                     var memberNo = data[i].memberNo;
                     var memberName = data[i].memberName;
                     var phone = data[i].phone;
                     html += "저나번호 :"+phone+"/ 이름 : "+memberName+"/ 회원번호 : "+memberNo+"<br>";
                  }
                  result.html(html);
               }else{
                  result.html("회원정보 ㄴㄴ");
               }
            }
         });
      });
      $("#jQ10").click(function(){
         var result = $(this).next();
         $.ajax({
            url : "/ajaxTest10",
            success : function(data){
               var html ="";
               //data객체에서 순서대로 key값을 꺼내서 자동으로 for문을 실행하는 포인문(for in 문)
               for(var key in data){   //1키 마다 한번수행
                  var memberNo = data[key].memberNo;
                  var memberName = data[key].memberName;
                  var phone = data[key].phone;
                  html += "번호 : "+memberNo+"/ 이름 : "+memberName+"/ 전화번호 :"+phone+"<br>";
               }
               result.html(html);
            }
         });
      });
   </script>
   <%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>