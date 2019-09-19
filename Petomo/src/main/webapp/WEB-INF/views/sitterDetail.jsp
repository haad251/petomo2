<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Petomo123</title>
</head>

<body class="preload">
    
<!--     상단메뉴 불러오기 -->
    <jsp:include page="menuBar.jsp" /> 

    <!-- 파랑이 시작 -->
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title"> DigiPro ${sitter.st_id} Multipurpose Marketplace HTML Template</h2>
                        <div class="breadcrumb">
                            <ul>
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                    <a href="#">Single Product</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section>
<!-- 파랑이 끝 -->


    




<!-- 하단메뉴바 불러오기 -->
    <jsp:include page="footerBar.jsp" /> 

</body>
</html>