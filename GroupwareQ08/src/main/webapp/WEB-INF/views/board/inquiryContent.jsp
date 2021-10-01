<!-- 게시판 내용 출력 화면 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
        
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link href="css/buttons.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="resources/vendor/bootstrap/js/sb-admin-2.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/29.2.0/classic/ckeditor.js"></script>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/boardContent.js"></script>   

<title>inquiry content</title>
</head>

<body id="page-top">
 <!-- Page Wrapper -->
    <div id="wrapper">
	<jsp:include page="/WEB-INF/views/homeView/menubar.jsp"></jsp:include>
	
	 <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				<jsp:include page="/WEB-INF/views/homeView/topbar.jsp"></jsp:include>
				<div class="container-fluid">
				<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h5 class="m-0 font-weight-bold text-primary">문의</h5>
				</div>
				<div class="card-body">
               	
				<form action="InquiryDelete.do?boardID=${BoardID}"
							name="InquiryDelete" method="POST" id="form">
					<div class="form-group col-sm-12">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						
						<div class="form-group row">
							<div class="col-sm-2">
								<input type="text" name="InquiryType" id="inquiryType" class="input-sm input-tp text-primary" disabled readonly
									value="${InquiryType}">
							</div>
												
							<input type="text" class="input-sm input-tp font-weight-bold" id="inquiryTitle" name="InquiryTitle" disabled readonly
								value="${InquiryTitle}">
						</div>
						<div class="form-group text-gray-800 row ml-1 my-1">
							<label for="inquiryWriter" class="col-form-label mr-2"><span class="small">작성자</span></label>
							<input type="text" class="input-sm input-tp small" name="InquiryWriter" id="inquiryWriter" 
								value="${InquiryWriter}" disabled readonly>
							<label for="date" class="col-form-label mr-2"><span class="small">날짜</span></label>
							<input type="text" name="IBoardDate" id="date" class="input-sm input-tp small" disabled readonly value="${IBoardDate}">
						</div>
						<hr>
						<div class="form-group row my-3">
							<div class="card-body">
								<div class="ckeditor_contents">
									<!-- 접속한 UserID와 해당 글을 작성한 UserID가 같을 때 수정/삭제 버튼 보이게 하기 -->
										<div class="user text-right">
										<c:set var="UserID" value="${UserID}" />
										<c:set var="UserIDFromWriter" value="${UserIDFromWriter}" />
										<c:if test="${UserID == UserIDFromWriter}">
												<button type="submit" class="btn btn-danger btn-user" id="deleteButton" onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">삭제</button>
												<input type="hidden" name="BoardID" id="boardID" disabled readonly value="${BoardID}">
										</c:if>
									</div>
									<p class="card-text"><c:out value="${InquiryContent}" escapeXml="false"/></p>
									
								</div>
							</div>
						</div>
						<hr>
				         <div class="form-group row">
				         	<label for="files" class="col-sm-2 my-2 col-form-label"><span class="font-weight-bold text-gray-800">첨부 파일</span></label>
				         	<div class="col-sm-10 my-2" id="fileIndex">
								<c:forEach var="InquiryFile" items="${InquiryFile}">
					         	<a href="#" onclick="FileDown('${InquiryFile.BFileID}'); return false;">${InquiryFile.BOriginalFileName}</a>(${InquiryFile.BFileSize}kb)<br>
								</c:forEach>
							</div>
						</div>
						<hr>
					</div>
					</form>
					<div class="form-group col-sm-12 user my-4">
					<form action="AnswerDelete.do?boardID=${BoardID}" name="Delete" method="POST" id="form">
						<div class="row">
						<!-- 답변이 null이 아닐 때만 출력 가능하게 해야함 answerList? -->
						<c:if test="${InquiryAnswer != null}">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<label for="inquiryTitle" class="col-sm-2 col-form-label"><span class="font-weight-bold text-primary">답변</span></label>
							<div class="col-sm-8">
								<p class="card-text"><c:out value="${InquiryAnswer}" escapeXml="false"/></p>
							</div>
							
							<!-- 관리자만 답변 삭제 가능 -->
							<sec:authorize access="hasRole('ROLE_ADMIN')">
							<div class="col-sm-2">
								<input type="submit" value="답변 삭제" class="btn btn-light btn-user" id="deleteButton" onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">
							</div>
							</sec:authorize>
							
						</c:if>
						</div>
					</form>
						
					<!-- 관리자만 답변 작성 가능 -->
					<form action="Answer.do" name="DoInquiryAnswer" method="POST" id="AnswerForm">
					<div class="row">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<c:if test="${InquiryAnswer == null}">
								<label for="inquiryTitle" class="col-sm-2 col-form-label"><span class="font-weight-bold text-primary">답변 작성</span></label>
								<div class="col-sm-8">
									<textarea name="InquiryAnswer" class="form-control" id="inquiryAnswer" style="resize: none;"></textarea>
								</div>
								<div class="col-sm-2">
									<input type="submit" class="btn btn-light btn-user" value="저장" id="saveButton">
									<input type="hidden" name="UserID" value="${UserID}" id="userID">
									<input type="hidden" name="BoardID" value="${BoardID}" id="boardID">										
								</div>
							</c:if>
						</sec:authorize>
					</div>
					</form>
					</div>
					<div class="user text-center row p-3 ml-5 justify-content-center">
			            <a href="${path}/inquiryList"><input type="button" value="목록" id="listButton" class="btn btn-secondary btn-user mr-2"></a>
		            </div>

				<form name="readForm" role="form" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="hidden" id="bFileID"
						name="BFileID" value="">
				</form>
			</div>		
			</div>
			</div>
			</div>
			<jsp:include page="/WEB-INF/views/homeView/footer.jsp"></jsp:include>
			
	</div>

	</div>
	<!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
</body>

</html>