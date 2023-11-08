<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 
    div.container{
  }

    div.insert{
  }

  div.create{
  width: 800px;
  text-align: center;
  padding: 30px;
  border-bottom: 1px solid black;
  margin: auto;
  }

  table{
  height: 300px;
  width: 900px;
  border-top: 3px solid black;
  margin-right: auto;
  margin-left: auto;
  }

  td{
  border-bottom: 1px dotted black;
  }

  caption{
  text-align: left;
  }

  .col1 {
  background-color: #e8e8e8;
  padding: 10px;
  text-align: right;
  font-weight: bold;
  font-size: 0.8em;
  }

  .col2 {
  padding: 5px;
  }

  .col2 {
  padding: 5px;
  border-spacing: 50;
  }


  .but1 {
  height: 25px;
  width: 80px;
  color: white;
  background-color: black;
  border-color: black;
  }

  .but2 {
  height: 27px;
  width: 120px;
  color: white;
  background-color: black;
  border-color: black;
  }

  .but3 {
  height: 35px;
  width: 150px;
  background-color: white;
  border: 2px solid black;
  }

  .but4{
  height: 35px;
  width: 150px;
  background-color: white;
  border: 2px solid black;
  }

  
  .but5{
    width: 40px;
  }
  
  .but6{
    height: 35px;
  }
  

  .but1:hover {
  background-color: #b9b9b9;
  color: black;
  border: 2px solid black;
  }

  .but2:hover {
  background-color: #b9b9b9;
  color: black;
  border: 2px solid black;
  }

  .but3:hover {
  background-color: black;
  color: white;
  border: 2px solid black;
  }

  .but4:hover {
  background-color: black;
  color: white;
  border: 2px solid black;
  }
  
  p{
  font-size: 0.7em;
  }

  .g{
  font-size: 0.7em;
  }

  .c{
  font-size: 0.7em;
  }

  .a{
  font-size: 0.7em;
  }
  
  .num{
  color: red;
  }

</style>

</head>

  
  
    
<body class="text-center d-flex flex-column h-100">
<jsp:include page="/WEB-INF/views/Navbar.jsp"></jsp:include>


<!-- header 체크 -->
<!-- 	<header th:replace="layout/header :: header"></header> -->

    <form name="join" method="post" action="/user" autocomplete="off" enctype="utf-8">
<!--     <form method="post" action=""> -->
        <div class="container">
      <div class="insert">
      
          <table>
      <caption><h2>회원가입 양식</h2></caption>
<!--       <form name="join" method="post" action="join" autocomplete="off" enctype="utf-8"> -->
      <tr>
          <td class="col1">이름</td>
          <td class="col2"><input type="text" id="username" name="name" maxlength="5"></td>
      
      </tr>
      <tr>
          <td class="col1">아이디</td>
          <td class="col2">
              <input type="text" name="userid" maxlength="10">
              <input class='but1' type="button" id="userid" name="userid" value="중복확인" onclick="">
          </td>
      </tr>
      <tr>
          <td class="col1">비밀번호</td>
          <td class="col2">
              <input type="password" id="password"name="password" maxlength="16" >
              <p>※비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합
              10 ~ 16자리</span>로 입력이 가능합니다.</p>
          </td>
      </tr>
      <tr>
          <td class="col1">비밀번호 확인</td>
          <td class="col2"><input type="password" id="password" name="passwordCheck" maxlength="16" required="required"></td>
      </tr>
      
	  <tr>
	          <td class="col1">이메일</td>
	          <td class="col2">
	              <input type="text" id="email1"  name="email1">
	              <span class="a">@</span>
	              <input type="text" id="mailaddr" value="" name="email2" required="required"/>
	              <select name="메일주소" id="mailselector" onchange="mailchange();">
	                  <option value='' >직접입력</option>
	                  <option value="naver.com">naver.com</option>
	                  <option value="gmail.com">gmail.com</option>
	                  <option value="daum.net">daum.com</option>                  
	              </select>
	          </td>
	      </tr>
      <tr>
        <td class="col1">회원종류 </td>
        <td class="col2">
        <input type="radio" id="classify"name="classify" value="model">model 
        <input type="radio" name="classify" value="shop">shop </td>
    </tr>
      <tr>
        <td class="col1">성별 </td>
        <td class="col2">
        <input type="radio" id="gender"name="gender" value="woman">여자 
        <input type="radio" name="gender" value="man">남자 </td>
    </tr>
    <tr>
        <td class="col1"> 전화번호 </td>
        <td class="col2">        
       
<!--             <select style="margin-left:5px">           -->
<!--             <option value = "1">010</option> -->
<!--             <option value = "2">011</option> -->
			<font size="2px">010</font>
<!--             <span class="a">010</span> -->
<!--             </select> -->
            - <input class="but5" type = 'tel' name = 'phone1'> - <input class="but5" type = 'tel' name = 'phone2'></td>
<!--             name은 파라미터로 넘어가는 DTO -->
    </tr>
    
    <tr>
        <td class="col1">주 소</td>
        <td class="col2" >
		
		<input type="text" id="sample2_postcode"  name="postcode" placeholder="우편번호">
		<input type="button" name="address" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample2_address" name="address1" placeholder="주소"><br>
		<input type="text" id="sample2_detailAddress" name="address2" placeholder="상세주소">
		<input type="text" id="sample2_extraAddress" name="address" placeholder="나머지 주소">
		
		<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>
		
        </td>
    </tr>
    <tr>
        <th class="col1">지역</th>
        <td class="col2">
          <select name='region' size='1'>
              <option value=''>선택하세요</option>
              <option value='서울'>서울</option>
              <option value='경기인천'>경기인천</option>
              <option value='충청전라'>충청전라</option>
              <option value='강원'>강원</option>
              <option value='제주'>제주도</option>
          </select>
        </td>
      </tr>
    
    <tr>
        <td class="col1">인스타, 페이스북, 블로그 URL</td>
        <td class="col2">
        <textarea name="linkurl" cols="90" rows="1" spellcheck="true"></textarea>
    </td>
    </tr>
    <tr>
        <td class="col1"> 자기소개 </td>
        <td class="col2">
            <textarea name="introduction" cols="90" rows="10" spellcheck="true"></textarea>
        </td>
    </tr>
    <tr>
        <th class="col1">프로필 사진등록</th>
        <td class="col2">
            <input name="file" type="file" multiple>
        </td>
    </tr>
        
    
      </table>
      
    </div>
   
    <div class="create">
      
          <input class="but3" type="button" value="가입취소" onclick="">
          <input class="but4" type="submit" value="회원가입" onclick="formCheck(this.form)">
      
    </div>
    </div>

 
        </form>
    </div>
</main>

<!-- <footer th:replace="layout/footer :: footer"></footer> -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {

    	element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

            	var addr = ''; 
                var extraAddr = ''; 

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                document.getElementById("sample2_detailAddress").focus();

                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        element_layer.style.display = 'block';

        initLayerPosition();
    }
    function initLayerPosition(){
        var width = 300; 
        var height = 400; 
        var borderWidth = 5; 
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>

<script>
    function formCheck(form) {
        //유효성 검사
        if(form.name.value == "") {
            alert('이름을 입력하세요.');
            form.name.focus() ;
            return ;
        }
        if(form.id.value == "") {
            alert('아이디를 입력하세요.');
            form.id.focus() ;
            return ;
        }
        if(form.pwd.value == "") {
            alert('비밀번호를 입력하세요.');
            form.pwd.focus() ;
            return ;
        }
        if(form.pwd.value.length < 10 || form.pwd.value.length > 16) {
            alert('비밀번호는 10 ~ 16자 사이로 입력하세요.');
            form.pwd.focus() ;
            return ;
        }
        if(form.pwdCheck.value == "") {
            alert('비밀번호 확인을 입력하세요.');
            form.pwdCheck.focus() ;
            return ;
        }
        if(form.email.value == "") {
            alert('e-mail을 입력하세요.');
            form.mailid.focus() ;
            return ;
        }
        if(form.email.value == "") {
            alert('e-mail을 입력하세요.');
            form.mailid.focus() ;
            return ;
        }
        if(form.email.value == "" && form.mailslc.selectedIndex == 0) {
            alert('e-mail을 입력하세요.');
            form.mailslc.focus() ;
            return ;
        }
        if(form.classify.selectedIndex == 0) {
            alert('회원종류를 선택하세요');
            form.classify.focus();
            return;
        }
        if(form.phonenumber.selectedIndex == 0) {
            alert('전화번호를 입력하세요');
            form.phonenumber.focus();
            return;
        }
        if(form.address.selectedIndex == 0) {
            alert('주소를 입력하세요');
            form.address.focus();
            return;
        }
        alert('회원가입이 완료되었습니다.') ;
 
        form.reset();
        }
 
    function mailchange(){

        var mail = document.getElementById("mailselector").value;
        console.log(mail);

        if (document.getElementById("mailselector").value=='') {
     		document.getElementById("mailaddr").value=mail;
			document.getElementById("mailaddr").disabled=false;	

		}else{

        document.getElementById("mailaddr").value=mail;

        document.getElementById("mailaddr").disabled=true;

		}
    }

  </script>
</html>