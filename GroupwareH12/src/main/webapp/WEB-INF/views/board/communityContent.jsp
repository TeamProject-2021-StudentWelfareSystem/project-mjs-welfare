<!-- 게시판 내용 출력 화면 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/boardContent.css" type="text/css">
<link rel="stylesheet" href="css/menubar.css" type="text/css">

<title>community content</title>
</head>
<body>
	<div class="mjsWs">
		<div class="mheader">
			<!--메뉴바 -->
			<div class="menubar">
				<div class="menubarWidth">
					<div class="menubarLogo">
						<!--로고추가하기-->
					</div>
					<div class="menubarMid">
						<nav id="navigation1">
							<ul id="topInfo">
								<!-- sign out -->
								<li><sec:authorize access="isAuthenticated()">
										<a href="#"
											onclick="document.getElementById('logout').submit();">로그아웃</a>
									</sec:authorize>
									<form id="logout" action="${path}/logout.do" method="POST">
										<input name="${_csrf.parameterName}" type="hidden"
											value="${_csrf.token}" />
									</form></li>
								<li><a href="${path}/inquiryList">문의</a></li>
								<li><a href="${path}/myPage?R=${UserRole}">마이페이지</a></li>
								<li><a href="">사이트맵</a></li>
							</ul>
						</nav>
						<!-- 메뉴 -->
						<nav id="navigation2">
							<ul id="topMenu">
								<li><a href="homeLogin">홈</a></li>
								<li><a href="${path}/email/emailLogin">메일</a></li>
								<li><a href="${path}/communityList">게시판</a>
									<ul id="subMenu">
										<li><a href="${path}/noticeList">공지사항</a></li>
										<li><a href="${path}/communityList">커뮤니티</a></li>
										<li><a href="#">후기</a></li>
									</ul></li>
								<li><a href="">강의실</a></li>
								<li><a href="">일정관리</a></li>
								<li><a href="">조회</a></li>
								<li><a href="">팀원관리</a></li>
								<li><a href="">문서관리</a></li>
							</ul>
						</nav>
					</div>
					<!-- menubar_mid -->
				</div>
				<!-- menubar_width -->
			</div>
			<!-- menubar -->
		</div>
		<!-- mheader -->
		<nav>
			<div class="mbody">
				<div class="mcontWidth">

					<!-- left_box -->
					<div class="rightBox">
						<section>
							<div class="section">
								<br>
								<h2>커뮤니티</h2>
								<hr>
							</div>
						</section>
						<section>
							<div class="section2">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<table id="contentTable">
									<tr id="title">
										<td><input type="text" name="CommunityTitle"
											id="communityTitle" class="inputBox" placeholder="제목"
											disabled readonly value=${CommunityTitle}></td>
									</tr>
									<tr id="receive">
										<td colspan="2"><input type="text" name="CommunityWriter"
											id="communityWriter" class="inputBox" placeholder="작성자"
											disabled readonly value=${CommunityWriter}> <input
											type="text" name="Date" id="date" class="inputBox"
											placeholder="날짜" disabled readonly value=${BoardDate}>
										</td>
									</tr>
									<tr id="content">
										<td><textarea name="CommunityContent"
												id="communityContent" class="inputBox" placeholder="내용"
												readonly></textarea> <c:out value="${CommunityContent}"
												escapeXml="false" /></td>
									</tr>
								</table>
								<hr>

							</div>
							<!-- section2 -->
						</section>
					</div>
					<!-- right_box -->
					<div id="btn">
						<a href="communityList"><input type="button" value="목록"
							id="listButton"></a>
						<!-- 접속한 UserID와 해당 글을 작성한 UserID가 같을 때 수정/삭제 버튼 보이게 하기 -->
						<c:if test="${list.UserLoginID == board.UserID}">
							<a href="${path}/communityModify"><button type="button"
									id="modifyButton">수정</button></a>
							<button type="button" id="deleteButton" onClick="boardDelete()">삭제</button>
						</c:if>
					</div>

				</div>
				<!-- mcont_width -->
			</div>
			<!-- mbody -->
		</nav>
	</div>
	<!-- mjs_ws -->
</body>
</html>