<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>    
	<title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
</head>

<body>
<!-- Breadcrumb Area -->
    <section class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-contents">
                        <h2 class="page-title">マネージャーページ</h2>
                    </div>
                </div><!-- end .col-md-12 -->
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .breadcrumb-area -->
     <section class="dashboard-area">
        <div class="dashboard_menu_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <button class="menu-toggler d-md-none">
                            <span class="icon-menu"></span> 
                        </button>
                        <ul class="dashboard_menu">
                            <li>
                                <a href="/managerMyPage"><span class="lnr icon-home"></span>統計</a>
                            </li>
                            <li class="active">
                                <a href="/manageService"><span class="lnr icon-note"></span>サービス管理</a>
                            </li>
                            <li>
                                <a href="/managePetSitter"><span class="lnr icon-briefcase"></span>シッター管理</a>
                            </li>
<!--                             <li> -->
<!--                                 <a href="/managerSetting"><span class="lnr icon-settings"></span>セッティング</a> -->
<!--                             </li> -->
                        </ul><!-- ends: .dashboard_menu -->
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
            </div><!-- ends: .container -->
        </div><!-- ends: .dashboard_menu_area -->
        </section>
</body>
</html>