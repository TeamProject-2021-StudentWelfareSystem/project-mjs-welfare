<!-- 마이페이지 화면 (학생) -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/myPage.css" type="text/css">
<link rel="stylesheet" href="css/menubar.css" type="text/css">
<script src="js/jquery-3.5.1.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
	rel="stylesheet">
<title>my page</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/homeView/menubar.jsp"></jsp:include>
		<nav>
			<div class="mbody">
				<div class="mcontWidth">
					<div class="leftBox">
						<div class="leftInfo">
							<!--로그인 후 화면-->
							<br>
							<div class=userName><input type=text name="UserName" id="userName" value=${UserName} disabled readonly>님<br>안녕하세요!</div>
            				<div class="userColleges"><h4>소속 : <input type=text name="SC" id="sc" value=${SC} disabled readonly></h4></div>
              				 <div class="userMajor"><h4>학과 : <input type=text name="UserMajor" id="userMajor" value=${UserMajor} disabled readonly></h4></div>
            				<div class="userGrade"><h4>학년 : <input type=text name="Grade" id="grade" value=${Grade} disabled readonly></h4></div>
						</div> <!-- left_info -->
					</div><!-- left_box -->
					<div class="rightBox">
						<section id="memberInfo">
							<h2>회원 정보</h2>
							<br>
							<!--마이페이지 (학생)-->
							<div id="myPageStudent" style="display: block;">

								<form action="${path}/myPageStudent.do" name="StudentPage" method="POST" id="form">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<table>
										<tr>
											<td class="col1"><label for="id">아이디(학번)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
											<td class="col2"><input type="text" name="UserLoginID"
												id="userLoginID" class="inputBox" placeholder="" autofocus
												autocomplete="off" disabled readonly value=${UserLoginID}></td>

										</tr>
										<tr>
											<td class="col1"><label for="name">이름</label></td>
											<td class="col2"><input type="text" name="UserName"
												id="userName" class="inputBox" autocomplete="off" disabled
												readonly value=${UserName}></td>
										</tr>
										
										<tr>
											<td class="col1"><label for="gender">성별</label></td>
											<td class="col2"><input type="text" name="StudentGender"
												id="studentGender" class="inputBox" disabled readonly
												value=${StudentGender}></td>
										</tr>

										<tr>
											<td class="col1"><label for="phoneNumber">연락처</label></td>
											<td class="col2"><input type="text" name="UserPhoneNum"
												id="userPhoneNum" class="inputBox" autocomplete="off"
												disabled readonly value=${UserPhoneNum}></td>
										</tr>
										<tr>
											<td class="col1"><label for="grade">학년</label></td>
											<td class="col2"><input type="text" name="StudentGrade"
												id="studentGrade" class="inputBox" disabled readonly
												value=${StudentGrade}></td>
										</tr>
										<tr>
											<td class="col1"><label for="studentColleges">단과대학</label></td>
											<td class="col2"><input type="text"
												name="StudentColleges" id="studentColleges" class="inputBox"
												disabled readonly value=${StudentColleges}></td>
										</tr>
										<tr>
											<td class="col1"><label for="studentMajor">전공</label></td>
											<td class="col2"><input type="text" name="StudentMajor"
												id="studentMajor" class="inputBox" disabled readonly
												value=${StudentMajor}></td>
										</tr>
										<tr id="doubleMajor">
											<td class="col1"><label for="studentDoubleMajor">복수전공</label></td>
											<td class="col2"><label for="member_DoubleMajor"></label>
												<input type="text" name="StudentDoubleMajor"
												id="studentDoubleMajor" class="inputBox" disabled readonly
												value=${StudentDoubleMajor}></td>
										</tr>
										<tr>
											<td class="col1"><label for="email">이메일</label></td>
											<td class="col2"><input type="text" name="UserEmail"
												id="userEmail" class="inputBox" autocomplete="off" disabled
												readonly value=${UserEmail}></td>
											<td class="col4"><input type="email" value="@mju.ac.kr"
												disabled readonly name="email" id="mju" class="inputBox"
												autocomplete="off"></td>
										</tr>
										<tr>
											<td class="col1"><label for="infoOpen">정보 공개</label></td>
											<td class="col2"><input type="text" name="UserInfoOpen"
												id="userInfoOpen" class="inputBox" autocomplete="off"
												disabled readonly value=${UserInfoOpen}></td>
										</tr>
										<!-- StudentController 정보공개 부분 수정이 완료되면 주석처리 풀어주세요 -->
										<!--<c:forEach items="${UserInfoOpen}" var="UserInfoOpen" varStatus="status">
											<tr>
												<td class="col1"><label for="infoOpen">정보 공개</label></td>
												<td class="col2"><input type="text" name="UserInfoOpen"
													id="userInfoOpen" class="inputBox" autocomplete="off"
													disabled readonly> <c:out
														value="${UserInfoOpen.getOpenName()}" /> <c:out
														value="${UserInfoOpen.getOpenEmail()}" /> <c:out
														value="${UserInfoOpen.getOpenPhoneNum()}" /> <c:out
														value="${UserInfoOpen.getOpenMajor()}" /> <c:out
														value="${UserInfoOpen.getOpenGrade()}" /></td>
											</tr>
										</c:forEach>-->
									</table>
								</form>
							</div>
							<br> <br>
							<div id="btnDiv">
								<a href="checkPassword"
									onClick="window.open(this.href, '', 'width=800, height=800'); return false;">
									<input type="button" id="modifyBtn" value="수정하기">
								</a> <a href="modifyPassword"
									onClick="window.open(this.href, '', 'width=800, height=800'); return false;">
									<input type="button" id="modifyPWBtn" value="비밀번호 변경하기">
								</a> <a href="checkPassword2"
									onClick="window.open(this.href, '', 'width=800, height=800'); return false;">
									<input type="button" id="withdrawBtn" value="회원 탈퇴">
								</a>
							</div>
						</section>
					</div><!-- right_box -->
			</div><!-- mcont_width -->
		</div><!-- mbody -->
	</nav>

</body>
</html>