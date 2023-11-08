<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LoginForm</title>
<style type="text/css">
.container {
  margin: auto;
  width: 650px;
  height: 550px;
  position: relative;
}

.welcome {
  background-color: white;
  width: 650px;
  height: 415px;
  position: absolute;
  top: 25%;
  border-radius: 5px;
  box-shadow: 5px 5px 5px rgba(0,0,0,.1);
}

.pinkbox {
  position: absolute;
  top: -10%;
  left: 5%;
  background-color: #ffe3c0;
  width: 320px;
  height: 500px;
  border-radius: 5px;
  box-shadow: 2px 0 10px rgba(0,0,0,.1);
  transition: all .5s ease-in-out;
  z-index: 2;
}

.nodisplay {
  display:none;
  transition: all .5s ease;
}

.leftbox, .rightbox {
  position: absolute;
  width: 50%;
  transition: 1s all ease;
}

.leftbox {
  left: -2%;
}
.rightbox {
  right: -2%;
}

/* font & button styling */
h1 {
  font-family: 'sans-serif';
  text-align: center;
  margin-top: 95px;
  text-transform: uppercase;
  color: #d68983;
  font-size: 2em;
  letter-spacing: 8px;
}

.title {
  font-family: 'serif';
  color: grey;
  font-size: 1.8em;
  line-height: 1.1em;
  letter-spacing: 3px;
  text-align: center;
  font-weight: 300;
  margin-top: 20%;
}
.desc {
  margin-top: -8px;
}
.account {
  margin-top: 45%;
  font-size: 10px;
}
p {
  font-family: sans-serif;
  font-size: .7em;
  letter-spacing: 2px;
  color: grey;
  text-align: center;
}

span {
  color: pale;
}

.flower {
  position: absolute;
  width: 120px;
  height: 120px;
  top: 46%;
  left: 29%;
  opacity: .7;
}

.smaller {
  width: 90px;
  height: 100px;
  top: 48%;
  left: 38%;
  opacity: .9;
}

button {
  padding: 12px;
  font-family: sans-serif;
  text-transform: uppercase;
  letter-spacing: 3px;
  font-size: 11px;
  border-radius: 10px;
  margin: auto;
  outline: none;
  display: block;
  &:hover {
    background-color: pale;
    color: white;
    transition: background-color 1s ease-out;
  }
}

.button {
  margin-top: 3%;
  background-color: white;
  color: #b36661
  border solid 1px pale;
}

/* form styling */

form {
  display: flex;
  align-items: center;
  flex-direction: column;
  padding-top: 7px;
}
.more-padding{
  padding-top: 35px;
  input {
    padding: 12px;
  }
  .submit {
    margin-top: 45px;
  }
}
.more-padding2{
  margin-left: 35px;
  input {
	padding: 12px;
  }
.submit {
    margin-top: 45px;
  }
}
.submit {
  margin-top: 25px;
  padding: 12px;
  border-color: #b97671;
  &:hover {
    background-color: lavender;
    border-color: darken(lavender, 5%);
  }
}

input {
  background: pale;
  width: 65%;
  color: pink;
  border: none;
  border-bottom: 1px solid rgba(white, 0.5);
  padding: 9px;
  margin: 7px;
  &::placeholder {
    color: rgba(white, 1);
    letter-spacing: 2px;
    font-size: 1.3em;
    font-weight: 100;
  }
  &:focus {
    color: pink;
    outline: none;
    border-bottom: 1.2px solid rgba(pink, 0.7);
    font-size: 1em;
    transition: .8s all ease;
    &::placeholder {
      opacity: 0;
    }
  }
}

label {
  font-family: sans-serif;
  color: #d68983;
  font-size: 0.8em;
  letter-spacing: 1px;
}

.checkbox {
  display: inline;
  white-space: nowrap;
  position: relative;
  left: 35px;
  top: 5px;
}

input[type=checkbox] {
  width: 7px;
  background: pink;
}

.checkbox input[type="checkbox"]:checked + label {
  color: pink;
  transition: .5s all ease;
}
</style>
<!-- 자유롭게 디자인을 적용시키려고 이것을 사용함. -->
</head>
<body>
<!-- <h1>loginForm.jsp</h1> -->
<c:url value ="j_spring_security_check" var = "loginUrl"/>
<form action="${loginUrl}" method="post">
	<div class="container">
            <div class="welcome">
              <div class="pinkbox">
                <div class="signup nodisplay">
                  <h1>register</h1>
                   </div>
                <div class="signin">
                <h1>sign in</h1>
<!--                   <form class="more-padding" autocomplete="off"> -->
                    <input class="more-padding2" type="text" name="j_username" placeholder="username">
                    <input class="more-padding2" type="password" name="j_password" placeholder="password">
                    <div class="checkbox">
                      <input type="checkbox" id="remember" /><label for="remember">remember me</label>
                    </div>
                 <button class="button submit">login</button>
                  </form>
                </div>
              </div>
<%-- 	<c:if test="${param.error != null}"> --%>
<!-- 	<p> -->
<!-- 		Login Error!<br/> -->
<%-- 		${error_message} --%>
<!-- 		</p> -->
<%-- 		</c:if> --%>
		<div class="leftbox">
                <h2 class="title"><span>beautiful</span>&<br>hair</h2>
                <p class="desc">pick your perfect <span>bouquet</span></p>
                <img class="flower smaller" src="img/hair.jpg" >
                <p class="account">have an account?</p>
                <button class="button" id="signin">login</button>
              </div>
              <div class="rightbox">
                <h2 class="title"><span>beautiful</span><br>hair</h2>
<!--                 <p class="desc"> pick your <span>SNS login</span></p> -->
                <img class="flower smaller" src="/img/hair.jpg" >
                <p class="account">don't have an account?</p>
                <button class="button" onclick="window.open('/signup')" id="signup">sign up</button>
              </div>
            </div>
<!--            </div> -->
<!--           </div> -->



</body>
</html>