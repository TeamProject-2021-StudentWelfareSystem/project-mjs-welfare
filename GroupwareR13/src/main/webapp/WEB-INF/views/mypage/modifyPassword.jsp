<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link href="css/checkPassword.css" rel="stylesheet">
<link href="css/buttons.css" rel="stylesheet">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/infoModify.js"></script>
<script src="js/pwShowHide.js"></script>

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

<!-- Custom scripts for all pages-->
<script src="resources/vendor/bootstrap/js/sb-admin-2.min.js"></script>
<title>modify password</title>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5" style="width:498px; margin:0 auto;">
                    <div class="card-body">
                        <div class="col-lg-12">
                             <div class="p-5">
                             	<div class="text-center">
                                     <h4 class="text-gray-900 mb-4">비밀번호 변경</h4>
                                </div>
                                <form action="${path}/modifyPassword.do" name="ModifyPassword" method="POST" id="form">
                                	<div class="form-group user">
                                	<input type="password" class="form-control form-control-user" 
                                		name="UserNewPwd" id="userNewPwd" value="${UserNewPwd}" autofocus placeholder="새 비밀번호">
                                        <i class="fa fa-eye" id="pwCheckIcon"></i>
                                     </div>
                                    <div class="form-group user">
                                	<input type="password" class="form-control form-control-user" 
                                		name="UserNewPwdCheck" id="userNewPwdCheck" value="${UserNewPwdCheck}" 
                                		placeholder="새 비밀번호 확인" onchange="isSame()">
                                        <i class="fa fa-eye" id="pwCheckIcon2"></i>
                                     </div>
                                     <span id="pwValue" class="small"></span>
                                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />    
                                     
                                    <div class="user m-4 justify-center-center">
									<div class="text-center">
										<input type="submit" id="modifyCompletePW" class="btn btn-primary btn-user" value="수정">
						                <input type="button" name="Cancel" id="cancelBtn" class="btn btn-light btn-user" value="취소">
									</div>
								</div> 
                                </form>
                            </div>
                        </div>
                    </div>
				</div>
            </div>
        </div>
   </div>
</body>
</html>