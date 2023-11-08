<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>

<html>

<head>



<title>회원 정보</title>

<style>

    @import url('https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400');



body, html {

  font-family: 'Source Sans Pro', sans-serif;

  background-color: #ffe3c0;

  padding: 0;

  margin: 0;

}



#particles-js {

  position: absolute;

  width: 100%;

  height: 100%;

}



.container{

  margin: 0;

  top: 50px;

  left: 50%;

  position: absolute;

  text-align: center;

  transform: translateX(-50%);

  background-color: #fff7ed;

  border-radius: 9px;

  border-top: 10px solid #ED075D;  

  border-bottom: 10px solid #4EACD9;

  width: 400px;

  height: 600px;

  box-shadow: 1px 1px 108.8px 19.2px #D99A4E; 

}



.box h4 {

  font-family: 'Source Sans Pro', sans-serif;

  color: #ED075D; 

  font-size: 18px;

  margin-top:94px;;

}



.box h4 span {

  color: #3B2A15;  

  font-weight: lighter;

}





.box input[type = "text"],.box input[type = "password"] {

  display: block;

  margin: 20px auto;

  background: #FFD7BF; 

  border: 0;

  border-radius: 5px;

  padding: 14px 10px;

  width: 320px;

  outline: none;

  color: #d6d6d6;

      -webkit-transition: all .2s ease-out;

    -moz-transition: all .2s ease-out;

    -ms-transition: all .2s ease-out;

    -o-transition: all .2s ease-out;

    transition: all .2s ease-out;

  

}

::-webkit-input-placeholder {

  color: #3B2A15;

}



.box input[type = "text"]:focus,.box input[type = "password"]:focus {

  border: 1px solid #ED075D;

  

}



a{

  color: #ED075D; 

  text-decoration: none;

}



a:hover {

  text-decoration: underline;

}



 label input[type = "checkbox"] {

  display: none; /* hide the default checkbox */

}







.btn1 { 

  border:0;

  background: #D8BFFF; 

  color: #3B2A15;

  border-radius: 100px;

  width: 340px;

  height: 49px;

  font-size: 16px;

  position: absolute;

  top: 82%; /*79*/

  left: 8%;

  transition: 0.3s;

  cursor: pointer;

}







.forgetpass {

  position: relative;

  float: right;

  right: 28px;

}



.dnthave{

    position: absolute;

    top: 92%;

    left: 24%;

}



.footer {

    position: relative;

    left: 0;

    bottom: 0;

    /* top: 605px; */

    top: 620px; 

    width: 100%;

    color: #3B2A15;  

    font-size: 14px;

    text-align: center;

}



    </style>

</head>


<body>
	
	
<body id="particles-js"></body>
	

<div class="animated bounceInDown">

  <div class="container">

    <span class="error animated tada" id="msg"></span>

    <form name="form1" class="box" onsubmit="return checkStuff()" action="userUpdate.jsp">

      <h4>회원<span>정보</span></h4>

      <h5>-------------------------------------</h5>

     <div>

          <label>아이디 : ${user.userid}</label>

        </div>&nbsp;

        <i class="typcn typcn-eye" id="eye"></i>

        

        <div>

          <label>휴대폰번호 : ${user.phonenumber}</label>

        </div>&nbsp;

        

        <div>

          <label>이메일 : ${user.email}</label>

        </div>&nbsp;

        

        <div>

          <label>주소 : ${user.address1}</label>

        </div>&nbsp;

        

        <div>

          <label>지역 : ${user.region}</label>

        </div>&nbsp;



        <div>

          <label>회원소개링크 : ${user.classify}</label>

        </div>&nbsp;

        

        <div>

          <label>간단한 프로필 : ${user.introduction}</label>

        </div>&nbsp;



<!-- 		<form action="userUpdate.jsp"> -->

        <input type="submit" value="회원정보수정" class="btn1">

      </form>

     

  </div> 

       <div class="footer">

      <span>홈페이지<i class="fa fa-heart pulse"></i> <a href="/home">이동</a></span>

    </div>

</div>

</body>

</html>