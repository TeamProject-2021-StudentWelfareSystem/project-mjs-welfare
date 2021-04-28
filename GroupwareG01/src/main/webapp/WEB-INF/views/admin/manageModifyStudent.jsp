<!-- manageStudent에서 수정 버튼 클릭 시 출력되는 학생 정보 수정 화면-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/infoModify.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/manageModify.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
	rel="stylesheet">
<title> manage information modify</title>
</head>
<body>
<div class="mjsWs">
		<div class="container">
			<section id="modify">
				<h2>사용자 정보 수정</h2>
				<br>
				<!--학생 정보 수정-->
				<div id="manageModifyStudent" style="display: block;">
					<form action="" name="ManageModifyStudent.do" method="POST" id="form">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
							<!-- 아이디, 이메일 수정 불가 -->
						<table>
							<tr>
								<td class="col1"><label for="id">아이디(학번)</label></td>
								<td class="col2"><input type="text" name="UserLoginID"
									id="userLoginID" class="inputBox" autocomplete="off" disabled readonly value=${UserLoginID}></td>
							</tr>

							<tr>
								<td class="col1"><label for="name">이름</label></td>
								<td class="col2"><input type="text" name="UserName"
									id="userName" class="inputBox" autocomplete="off" value=${UserName}></td>
							</tr>
							<tr>
								<td class="col1"><label for="email">이메일</label></td>
								<td class="col2"><input type="text" name="Email"
									id="userEmail" class="inputBox" autocomplete="off" disabled readonly value=${Email}></td>
								<td class="col3"><input type="text" value="@mju.ac.kr"
									disabled readonly id="mju" class="inputBox" autocomplete="off"></td>
							<tr>
								<td class="col1"><label for="gender">성별</label></td>
								<td class="col2"><select name="StudentGender" id="studentGender">
										<option value=" " selected>-선택-</option>
										<option value="남자">남</option>
										<option value="여자">여</option>
								</select></td>
							</tr>
							<tr>
								<td class="col1"><label for="phoneNumber">연락처</label></td>
								<td class="col2"><input type="text" name="UserPhoneNum"
									id="userPhoneNum" class="inputBox" placeholder="숫자만 입력해주세요"
									autocomplete="off" value=${UserPhoneNum}></td>
							</tr>
							<tr>
								<td class="col1"><label for="grade">학년</label></td>
								<td class="col2"><select name="StudentGrade"
									id="studentGrade">
										<option value=" " selected>-선택-</option>
										<option value="1학년">1학년</option>
										<option value="2학년">2학년</option>
										<option value="3학년">3학년</option>
										<option value="4학년">4학년</option>
								</select></td>
							</tr>
							<tr>
								<td class="col1"><label for="studentColleges">단과대학</label></td>
								<td class="col2"><select class="selectBox" name="StudentColleges"
									id="studentColleges" onChange="majorChange(this.value)">
										<option value=" " selected>-선택-</option>
										<option value="1">인문대학</option>
										<option value="2">사회과학대학</option>
										<option value="3">경영대학</option>
										<option value="4">법과대학</option>
										<option value="5">ICT융합대학</option>
										<option value="6">미래융합대학</option>
								</select></td>
							</tr>
							<tr>
								<td class="col1"><label for="studentMajor">전공</label></td>
								<td class="col2"><select class="selectBox" name="StudentMajor"
									id="studentMajor">
										<option value=" " selected>-선택-</option>
								</select><br><br></td>
							</tr>
							<tr id="doubleMajor">
								<td class="col1"><label for="studentDoubleMajor">복수전공</label></td>
								<td class="col2"><label for="memberDoubleMajor"> <input
										type="radio" class="radio" name="member"
										id="memberDoubleMajor" value="Y" onchange="setDisplay()"
										checked> 있음
								</label> &nbsp;&nbsp;&nbsp; <label for="memberSingleMajor"> <input
										type="radio" class="radio" name="member"
										id="memberSingleMajor" value="N" onchange="setDisplay()">
										없음
								</label> &nbsp;&nbsp;&nbsp; <select name="StudentDoubleMajor"
									id="studentDoubleMajor">
										<option value=" " selected>-선택-</option>
										<option value="국어국문학과">국어국문학과</option>
										<option value="영어영문학과">영어영문학과</option>
										<option value="중어중문학과">중어중문학과</option>
										<option value="일어일문학과">일어일문학과</option>
										<option value="사학과">사학과</option>
										<option value="문헌정보학과">문헌정보학과</option>
										<option value="아랍지역학과">아랍지역학과</option>
										<option value="미술사학과">미술사학과</option>
										<option value="철학과">철학과</option>
										<option value="문예창작학과">문예창작학과</option>
										<option value="행정학과">행정학과</option>
										<option value="경제학과">경제학과</option>
										<option value="정치외교학과">정치외교학과</option>
										<option value="디지털미디어학과">디지털미디어학과</option>
										<option value="아동학과">아동학과</option>
										<option value="청소년지도학과">청소년지도학과</option>
										<option value="경영정보학과">경영정보학과</option>
										<option value="국제통상학과">국제통상학과</option>
										<option value="법학과">법학과</option>
										<option value="융합소프트웨어학부">융합소프트웨어학부</option>
										<option value="디지털콘텐츠디자인학과">디지털콘텐츠디자인학과</option>
										<option value="창의융합인재학부">창의융합인재학부</option>
										<option value="사회복지학과">사회복지학과</option>
										<option value="부동산학과">부동산학과</option>
										<option value="법무행정학과">법무행정학과</option>
										<option value="심리치료학과">심리치료학과</option>
										<option value="미래융합경영학과">미래융합경영학과</option>
										<option value="멀티디자인학과">멀티디자인학과</option>
										<option value="계약학과">계약학과</option>
								</select><br><br></td>
							<tr>
								<td class="col1"><label for="infoOpen">정보 공개</label></td>
								<td class="col2"><h5>정보 공개를 체크하면 해당 정보가 공개로 표시됩니다</h5>
									<input type="checkbox" name="UserName" id="cUserName" value="UserName">이름 &nbsp; 
									<input type="checkbox" name="UserEmail" id="cUserEmail" value="UserEmail">이메일 &nbsp; 
									<input type="checkbox" name="UserPhone" id="cUserPhone" value="UserPhone">연락처 &nbsp;
									<input type="checkbox" name="UserMajor" id="cUserMajor" value="UserMajor">전공 &nbsp; 
									<input type="checkbox" name="UserGrade" id="cUserGrade" value="UserGrade">학년 &nbsp;
								<br></td>
							</tr>
						</table>
						<div id="">
							<input type="submit" name="ModifyComplete" id="modifyComplete"
								value="수정 완료"> <input type="submit" name="Cancel"
								id="cancelBtn" value="취소">
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>
</body>
</html>