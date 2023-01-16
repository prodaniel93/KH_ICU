<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ICU - 로그인</title>
<!-- bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
      integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>

    <!-- animate.css -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />

    <!-- 웹사이트에 아이콘 추가 -->
    <link rel="icon" type="image/png" href="resources/images/navbarLogo.png" />

    <!-- Font Awesome cdn -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- css -->
    <link rel="stylesheet" href="resources/css/03_logIn.css" />

    <!-- jQuery -->
    <script
      src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"
    ></script>
</head>
<body>
    <!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>

    <!-- Logo -->
    <div id="main__logo">
      <img src="resources/images/navbarLogo.png" />
    </div>

    <!-- id / pwd input -->
    <!-- 회원가입 / 아이디, 비밀번호 찾기 -->
    <div id="input__container">
      <div class="input__id">
        <span>아이디</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input
          class="info-id info"
          type="text"
          placeholder="아이디를 입력해주세요."
        />
      </div>
      <div class="input__pwd">
        <span>비밀번호</span> &nbsp;&nbsp;
        <input
          class="info-pwd info"
          type="text"
          placeholder="비밀번호를 입력해주세요."
        />
      </div>
      <div class="join-container">
        <a href="${contextPath }/agreeForm.me">회원가입 &nbsp;|&nbsp; </a>
        <a href="${contextPath }/find.me">아이디 / 비밀번호 찾기</a>
      </div>
    </div>

    <!-- login , naver , kakao -->
    <div id="loginButton">
      <div class="login__button loginbtn">
        <button type="button">로그인</button>
      </div>
      <div class="naver__button loginbtn">
        <button type="button">
          <img src="resources/images/naverLogo.png" />네이버 로그인
        </button>
      </div>
      <div class="kakao__button loginbtn">
        <button type="button">
          <img src="resources/images/kakaoLogo.png" />카카오톡 로그인
        </button>
      </div>
    </div>

    <script src="resources/js/02_mainPage.js" defer></script>
    <script src="resources/js/main.js" defer></script>
  </body>
</html>