<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype HTML>
<html lang="en">
<head>
<title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
</head>
<body class="preload">
<jsp:include page="menuBar.jsp" /> 
    <section class="four_o_four_area section--padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 text-center">
                    <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/404.png" alt="404 page">
                    <div class="not_found">
                        <h2>すみません、エラーが発生しました。</h2>
                        <a href="/" class="btn btn--md btn-primary">Back to Home</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>