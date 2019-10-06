<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Petomo</title>
    <link rel="icon" type="image/png" sizes="16x16" href="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/favicon.png">
</head>
<body class="preload">
    <jsp:include page="menuBar.jsp" /> 

    <section class="hero-area bgimage">
        <div class="bg_image_holder">
            <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/head_1.jpg
" alt="background-image">
        </div>
        <div class="hero-content content_above">
            <div class="content-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="hero__content__title">
                                <h1 class="display-3">
                                    PETOMO
                                </h1>
                                <p class="tagline">安心安全のペットシッターマッチング</p>
                            </div>
                            <!-- end .hero__btn-area-->
                            <div class="search-area">
                                <div class="row">
                                    <div class="col-md-10 offset-md-1">
                                        <div class="search_box">
                                            <form action="selectAllSitterByLoc" method = "GET">
                                                <input type="text" class="text_field" placeholder="地域名" 
                                                name = "st_loc1" style = "width : 800px;">
                                                <button type="submit" class="search-btn btn--lg btn-primary">検索</button>
                                            </form>
                                        </div><!-- end .search_box -->
                                    </div>
                                </div>
                            </div>
                            <!--start .search-area -->
                        </div><!-- ends: .col-md-12 -->
                    </div><!-- ends: .row -->
                </div><!-- ends: .container -->
            </div><!-- ends: .contact_wrapper -->
        </div><!-- ends: hero-content -->
    </section><!-- ends: .hero-area -->
    <section class="services ">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="service-single">
                        <span class="icon-lock"></span>
                        <h4>安心システム</h4>
                        <p>基準を満たしたシッターのみにご登録頂いております。</p>
                    </div>
                </div><!-- Ends: .col-sm-6 -->
                <div class="col-lg-3 col-sm-6">
                    <div class="service-single">
                        <span class="icon-like"></span>
                        <h4>Quality Products</h4>
                        <p>Pellentesque facilisis kamcorper sapien interdum magna.</p>
                    </div>
                </div><!-- Ends: .col-sm-6 -->
                <div class="col-lg-3 col-sm-6">
                    <div class="service-single">
                        <span class="icon-wallet"></span>
                        <h4>14 Days Money Backs</h4>
                        <p>Pellentesque facilisis kamcorper sapien interdum magna.</p>
                    </div>
                </div><!-- Ends: .col-sm-6 -->
                <div class="col-lg-3 col-sm-6">
                    <div class="service-single">
                        <span class="icon-people"></span>
                        <h4>24/7 Customer Care</h4>
                        <p>Pellentesque facilisis kamcorper sapien interdum magna.</p>
                    </div>
                </div><!-- Ends: .col-sm-6 -->
            </div>
        </div>
    </section><!-- ends: .services -->
    <section class="working-process section--padding">
        <div class="container">
            <div class="row">
                <!-- Start Section Title -->
                <div class="col-md-12">
                    <div class="section-title">
                        <h1>ご利用の流れ</h1>
                    </div>
                </div>
                <!-- Ends: .col-md-12/Section Title -->
                <div class="col-md-12 step-single">
                    <div class="step-count">
                        <span>Step 1</span>
                        <span><i class="fa fa-long-arrow-down"></i></span>
                    </div>
                    <div class="row">
                        <div class="col-md-6 step-text r-padding">
                            <div>
                                <h2>会員登録とシッター検索 </h2>
                                <p>
                                まずはどんなシッターがいるのか、シッター検索をしてみましょう。
						実際にシッターとメッセージのやり取りをしたり予約を入れるには、無料会員登録が必要です。
シッタープロフィール詳細を見て、あなたとパートナーにぴったりのシッターを見つけてください。
予約申請と予約確定 条件に合うシッターが見つかれば、「仮予約」をしてください。この時点ではまだ予約は確定しておりません。
シッターからメッセージが入りますので、必要に応じてシッターと直接やり取りしてください。
お互いがOKとなれば、予約が確定されます。</p>
                            </div>
                        </div>
                        <div class="col-md-6 step-image l-padding">
                            <div>
                                <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/step1.png" alt="" class="img-fluid">
                            </div>
                        </div>
                    </div>
                </div><!-- Ends .step-single -->
                <div class="col-md-12 step-single">
                    <div class="step-count step-count2">
                        <span>Step 2</span>
                        <span><i class="fa fa-long-arrow-down"></i></span>
                    </div>
                    <div class="row">
                        <div class="col-md-6 step-image r-padding">
                            <div>
                                <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/step2.png" alt="" class="img-fluid">
                            </div>
                        </div>
                        <div class="col-md-6 step-text l-padding">
                            <div>
                                <h2>サービス当日</h2>
                                <p>シッターがパートナーのお世話をさせて頂きます。</p>
                            </div>
                        </div>
                    </div>
                </div><!-- Ends .step-single -->
                <div class="col-md-12 step-single">
                    <div class="step-count step-last">
                        <span>Step 3</span>
                        <span class="icon-emotsmile"></span>
                    </div>
                    <div class="row">
                        <div class="col-md-6 step-text r-padding">
                            <div>
                                <h2>レポート確認</h2>
                                <p>お預かりが終了したのち、シッターからマイページを通じてパートナーのお預かり時の様子を記録した「サービスレポート」を提出いたします。
								また、オーナーさまにも担当させていただいたシッターに対する評価をいただきます。
								シッターの励みになりますので、是非ご協力お願いいたします。</p>
                            </div>
                        </div>
                        <div class="col-md-6 step-image l-padding">
                            <div>
                                <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/step3.png" alt="" class="img-fluid">
                            </div>
                        </div>
                    </div>
                </div><!-- Ends .step-single -->
            </div>
        </div>
    </section><!-- ends: .wroking-process -->
    <section class="cta">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title">
                        <h1>Join Our Community Club</h1>
                    </div>
                </div>
                <!-- CTA Single -->
                <div class="col-md-5 cta-single">
                    <h3>Want to Sell Your Products</h3>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Fuga repudiandae veritatis qui officiis
                        molestiae
                        quas ipsa id sint quia amet consectetur adipisicing elit.</p>
                    <a href="" class="btn btn--lg btn-primary">Become an Author</a>
                </div>
                <div class="col-md-2 cta-divider">
                    <span>OR</span>
                </div>
                <div class="col-md-5 cta-single">
                    <h3>Start Shopping Today</h3>
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Fuga repudiandae veritatis qui officiis
                        molestiae
                        quas ipsa id sint quia amet consectetur adipisicing elit.</p>
                    <a href="" class="btn btn--lg btn-secondary">Create an Account</a>
                </div>
            </div>
        </div>
    </section><!-- ends: .cta -->
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDxflHHc5FlDVI-J71pO7hM1QJNW1dRp4U"></script>
    <!-- inject:js-->
    <script src="vendor_assets/js/jquery/jquery-1.12.4.min.js"></script>
    <script src="vendor_assets/js/jquery/uikit.min.js"></script>
    <script src="vendor_assets/js/bootstrap/popper.js"></script>
    <script src="vendor_assets/js/bootstrap/bootstrap.min.js"></script>
    <script src="vendor_assets/js/chart.bundle.min.js"></script>
    <script src="vendor_assets/js/grid.min.js"></script>
    <script src="vendor_assets/js/jquery-ui.min.js"></script>
    <script src="vendor_assets/js/jquery.barrating.min.js"></script>
    <script src="vendor_assets/js/jquery.countdown.min.js"></script>
    <script src="vendor_assets/js/jquery.counterup.min.js"></script>
    <script src="vendor_assets/js/jquery.easing1.3.js"></script>
    <script src="vendor_assets/js/jquery.magnific-popup.min.js"></script>
    <script src="vendor_assets/js/owl.carousel.min.js"></script>
    <script src="vendor_assets/js/select2.full.min.js"></script>
    <script src="vendor_assets/js/slick.min.js"></script>
    <script src="vendor_assets/js/tether.min.js"></script>
    <script src="vendor_assets/js/trumbowyg.min.js"></script>
    <script src="vendor_assets/js/venobox.min.js"></script>
    <script src="vendor_assets/js/waypoints.min.js"></script>
    <script src="theme_assets/js/dashboard.js"></script>
    <script src="theme_assets/js/main.js"></script>
    <script src="theme_assets/js/map.js"></script>
    <!-- endinject-->
</body>

</html>