<!-- 로그인 화면 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Please sign in</title>

<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/login.js"></script>
<link rel="stylesheet" href="css/pwShowHide.css"> <%--비밀번호 감추기 아이콘 css --%>
<script src="js/pwShowHide.js"></script><%--비밀번호 감추기 js--%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="resources/vendor/bootstrap/js/sb-admin-2.min.js"></script>

</head>
<body>
	<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5" style="width:498px; margin:0 auto;">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Please Login</h1>
                                    </div>
	                                    <form class="user" action="${path}/login.do" name="Login" method="POST" id="form">
                                        <div class="form-group">
                                        	<input type="text" class="form-control form-control-user"
                                                name="UserLoginID" id="userLoginID" autofocus autocomplete="off"
												value="${UserLoginID}" aria-describedby="emailHelp"
                                                placeholder="ID">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                name="UserLoginPwd" id="userLoginPW" autocomplete="off" value="${UserLoginPwd}" placeholder="Password">
                                                <i class="fa fa-eye" id="icon"></i>
                                        </div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></input>
										<div>
											<c:if test="${not empty ERRORMSG}">						        
												<p style="font-size:13px; color:red">${ERRORMSG}</p>
											     <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>		     
											</c:if>
										</div>                                        
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck" name="remember-me">
                                                <label class="custom-control-label" for="customCheck">로그인 유지하기</label>
                                            </div>
                                        </div>
                                        <div>
											<input type="submit" class="btn btn-primary btn-user btn-block" name="SubmitName" id="submitId"
												value="로그인">
										</div>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="${path}/findPassword">비밀번호를 잊으셨나요?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="${path}/infoConsent">회원가입</a>
                                    </div>
                                </div>
                            </div>
                        </div>
				</div>
            </div>

        </div>
    </div>

</body>
</html>