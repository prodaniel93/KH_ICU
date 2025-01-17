<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${map.list }"/>
<c:set var="pi" value="${map.pi }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트 조회 페이지</title>

	<!-- css -->
    <link rel="stylesheet" href="${contextPath }/resources/css/admin_01_manageMeber.css" />

</head>
<body>
	<!-- Navbar -->
    <jsp:include page="../common/header.jsp"/>
    
    <!-- 왼쪽 수직 navbar -->
    <jsp:include page="../admin/adminNavbar.jsp"/>
    
	<!-- 블랙리스트관리 -->
  <section id="memberInfo" class='animate__animated animate__fadeIn'>
    <h2 class="blackTitle">블랙리스트 조회</h2>
    <hr />
    <table class="table table-hover">
      <thead>
        <tr>
          <th scope="col">회원번호</th>
          <th scope="col">이름 (닉네임)</th>
          <th scope="col">이메일</th>
          <th scope="col">휴대폰 번호</th>
          <th scope="col">가입일</th>
          <th scope="col">상태</th>
        </tr>
      </thead>
      <tbody>
        <c:if test="${empty list }">
          <tr id="tableEmpty">
            <th colspan="6">조회할 회원이 없습니다</th>
          </tr>
        </c:if>
        <c:forEach var="m" items="${list }" >
          <tr>
          <form id="blackCancel" action="${contextPath }/admin/blackCancel.ad" method="post">
          <td scope="row">${m.memNo}</td>
          <td>${m.memName}(${m.memNickname})</td>
          <td>${m.email}</td>
          <td>${m.phone}</td>
          <td>${m.enrollDate}</td>
          <td><button type="submit" class="btn btn-danger ">취소</button></td>
          <input type="hidden" name="memNo" value="${m.memNo}">
          <input type="hidden" name="memNickname" value="${m.memNickname}">
          </form>
        </tr>
        </c:forEach>

      </tbody>
    </table>

    <c:set var = "url" value="?cpage="/>
    <div aria-label="Page navigation example" class="pagination">
      <ul class="pagination">
        <c:choose>
          <c:when test="${pi.currentPage eq 1 }">
            <li class="page-item disabled" ><a class="page-link" aria-label="Previous" href="#">&laquo;</a></li>
          </c:when>
          <c:otherwise>
            <li class="page-item" ><a class="page-link" aria-label="Previous" href="${url }${pi.currentPage -1 }">&laquo;</a></li>
          </c:otherwise>
        </c:choose>
        
        <c:forEach var="item" begin="${pi.startPage }" end="${pi.endPage }">
        <li class="page-item"><a class="page-link" href="${url }${item }">${item}</a></li>
        </c:forEach>

        <c:choose>
          <c:when test="${pi.currentPage eq pi.maxPage }">
            <li class="page-item disabled"><a class="page-link" aria-label="Next" href="#">&raquo;</a></li>
          </c:when>
          <c:otherwise>
            <li class="page-item"><a class="page-link" aria-label="Next" href="${url }${pi.currentPage +1 }">&raquo;</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
  </section>
  </body>

  

</html>