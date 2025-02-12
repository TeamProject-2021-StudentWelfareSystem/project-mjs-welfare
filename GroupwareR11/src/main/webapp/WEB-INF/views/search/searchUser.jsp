<!-- 초기 home 화면 -->
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
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<link rel="stylesheet" href="css/imageOption1.css" type="text/css">
<link rel="stylesheet" href="css/lectureRoomList.css" type="text/css">

<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<script src="../js/manageList.js"></script>
<script src="../js/jquery-3.5.1.min.js"></script>
<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<link href="../css/boardList.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../resources/vendor/bootstrap/js/sb-admin-2.min.js"></script>

<!-- Page level custom scripts -->
<script src="../resources/vendor/bootstrap/js/demo/chart-area-demo.js"></script>
<script src="../resources/vendor/bootstrap/js/demo/chart-pie-demo.js"></script>

<title>MJS Welfare System</title>
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
					<!-- Page Heading -->
					<!-- <h1 class="h3 mb-2 text-gray-800">커뮤니티</h1>
					<p class="mb-4">
						자유게시판입니다. <a target="_blank" href="https://datatables.net">음....</a>.
					</p> -->
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h4 class="m-0 font-weight-bold text-primary">사용자 검색</h4>
						</div>
						
						<div class="card-body">
							<div class="table-responsive">
								<div id="dataTable_wrapper"
									class="dataTables_wrapper dt-bootstrap4">
									<div class="row mb-3">
										<div class="col-sm-12 col-md-6" id="left">
											<div class="dataTables_length" id="dataTable_length">
											</div>
										</div>
										<div class="col-sm-12 col-md-2" id="right">
											<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search mt-3 pt-3" >
                        						<div class="input-group" id="searchBar">
                            						<input type="text" class="form-control bg-light border-0 small" placeholder="검색" aria-label="Search" aria-describedby="basic-addon2" id="searchKeyWord" name="SearchKeyword">
                            					<div class="input-group-append">
                                					<button class="btn btn-primary searchButton" type="button" id="search" name="SearchButton">
                                    				<i class="fas fa-search fa-sm"></i>
                                					</button>
                            					</div>
                       					 		</div>
                    						</form>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12">
										<form action="searchUser.do" name="UserList" method="POST" id="form">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
											<table class="table table-bordered dataTable" id="dataTable"
												width="100%" cellspacing="0" role="grid"
												aria-describedby="dataTable_info" style="width: 100%;">
												<thead>
													<tr role="row">
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 10%;">번호</th>
														<th class="sorting sorting_asc" tabindex="0"
															aria-controls="dataTable" rowspan="1" colspan="1"
															aria-sort="ascending"
															aria-label="Name: activate to sort column descending"
															style="width: 15%;">이름</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 20%;">학과</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Start date: activate to sort column ascending"
															style="width: 20%;">이메일</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Age: activate to sort column ascending"
															style="width: 15%;">휴대폰</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Age: activate to sort column ascending"
															style="width: 10%;">성별</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Age: activate to sort column ascending"
															style="width: 10%;">학년</th>
														
														
													</tr>
												</thead>
												<tbody id="information">
												</tbody>
												<tfoot>
													<tr>
														<th rowspan="1" colspan="1">번호</th>
														<th rowspan="1" colspan="1">이름</th>
														<th rowspan="1" colspan="1">학과</th>
														<th rowspan="1" colspan="1">이메일</th>
														<th rowspan="1" colspan="1">휴대폰</th>
														<th rowspan="1" colspan="1">성별</th>
														<th rowspan="1" colspan="1">학년</th>
													</tr>
												</tfoot>
												
											</table>
											</form>
										</div>
									</div>
							</div>
						</div>
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
<script src="../js/jquery-3.5.1.min.js"></script>
<script src="../js/searchUser.js"></script>	
</html>