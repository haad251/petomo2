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
                        </div><!-- ends: .col-md-12 -->
                    </div><!-- ends: .row -->
                </div><!-- ends: .container -->
            </div><!-- ends: .contact_wrapper -->
        </div><!-- ends: hero-content -->
    </section><!-- ends: .hero-area -->
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
                                <h2>いつでもどこでも<br>Petomoを呼んでください。</h2>
                                <p>
	 	                               急な用事でペットのお世話に困った時！<br>
	                                    ネットとスマートフォンで簡単に予約してPetomoにペットのお世話を頼んでくたさい。<br>
					早いケア、散歩予約で皆さんの大切な日常を気楽に過ごしてください。 </p>
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
                                <h2>「識別票」を所持している<br>ペットシッターが訪問します。</h2>
                                <p>登録番号を付与された正式なペットシッターがお客様が予約した時間に訪問します。<br>
				                                  予約時に記録したメモをもとに、ケア、散歩をします。<br>
							ペットに関する専門知識を持っているPetomoに教育をお願いすることもできます。
                            </div>
                        </div>
                    </div>
                </div><!-- Ends .step-single -->
                <div class="col-md-12 step-single">
                    <div class="step-count">
                        <span>Step 3</span>
                        <span><i class="fa fa-long-arrow-down"></i></span>
                    </div>
                    <div class="row">
                        <div class="col-md-6 step-text r-padding">
                            <div>
                                <h2>LIVEでペットのお世話を<br>確認してください。 </h2>
                                <p>
                               Petomoがリアルタイムでケア、散歩の過程を記録します。<br>
								ケア、散歩の過程を動画ストリーミング、チャット、地図を通じて確認することができます。<br>
								ペットと離れていてもLIVEを見ながら安心できます。
                            </div>
                        </div>
                        <div class="col-md-6 step-image l-padding">
                            <div>
                                <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/step3.png" alt="" class="img-fluid">
                            </div>
                        </div>
                    </div>
                </div><!-- Ends .step-single -->
                <div class="col-md-12 step-single">
                    <div class="step-count step-last">
                        <span>Step 4</span>
                        <span class="icon-emotsmile"></span>
                    </div>
                    <div class="row">
                        <div class="col-md-6 step-text r-padding">
                             <div>
                                <img src="https://scitpet.s3.ap-northeast-2.amazonaws.com/main/step4.png" alt="" class="img-fluid">
                            </div>
                        </div>
                        <div class="col-md-6 step-image l-padding">
                            <div>
                                <h2>ケア、散歩が終了すると、後からLIVEの確認ができます。</h2>
                                <p>忙しくてLIVEを確認できなくても大丈夫です。<br>
					                        予約内訳で過ぎた動画や散歩ルートなどが確認できます。<br>
					                 ペットの幸せな瞬間をいつでも確認してください。</p>
                            </div>
                        </div>
                    </div>
                </div><!-- Ends .step-single -->
                
            </div>
        </div>
    </section><!-- ends: .wroking-process -->
    
 <section class="pricing_area p-top-100 p-bottom-70">
    
        <div class="container">
        
         <div class="row">
                    <div class="col-md-12">
                         	<div class="section-title">
                        		<h2>散歩サービス</h2>
                    		</div>
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
        
            <div class="row">
                <div class="col-lg-12">
                    <div class="pricing-wrapper">
                        <div class="package-single ">
                            <div class="package-header">
                                <h5>一般散歩</h5>
                                <div class="amount">
                                    <span>2,500円</span>
                                    	   約1時間
                                </div>
                            </div>
                            <div class="package-body">
                                <ul>
                                    <li class="yes">お散歩</li>
                                    <li class="yes">お食事・お水</li>
                                    <li class="yes">トイレのお世話</li>
                                    <li class="no">おもちゃレンタル</li>
                                    <li class="no">お遊び</li>
                                    <li class="no">散歩マナー教育</li>
                                </ul>
                               <!--  <a href="" class="btn btn-dark btn-block">選択</a> -->
                            </div>
                        </div><!-- ends: .package-single  -->
                        <div class="package-single featured-plan">
                            <div class="featured-badge">おすすめ</div>
                            <div class="package-header">
                                <h5>遊び散歩</h5>
                                <div class="amount">
                                    <span>2,900円</span>
                                  		     約1時間
                                </div>
                            </div>
                            <div class="package-body">
                                <ul>
                                    <li class="yes">お散歩</li>
                                    <li class="yes">お食事・お水</li>
                                    <li class="yes">トイレのお世話</li>
                                    <li class="yes">おもちゃレンタル</li>
                                    <li class="yes">お遊び</li>
                                    <li class="no">散歩マナー教育</li>
                                </ul>
                                <!-- <a href="" class="btn btn-primary btn-block">選択</a> -->
                            </div>
                        </div><!-- ends: .package-single  -->
                        <div class="package-single ">
                            <div class="package-header">
                                <h5>教育散歩</h5>
                                <div class="amount">
                                    <span>3,200円</span>
                                   		   約1時間
                                </div>
                            </div>
                            <div class="package-body">
                                <ul>
                                    <li class="yes">お散歩</li>
                                    <li class="yes">お食事・お水</li>
                                    <li class="yes">トイレのお世話</li>
                                    <li class="yes">おもちゃレンタル</li>
                                    <li class="yes">お遊び</li>
                                    <li class="yes">散歩マナー教育</li>
                                </ul>
                                <!-- <a href="" class="btn btn-dark btn-block">選択</a> -->
                            </div>
                        </div><!-- ends: .package-single  -->
                    </div><!-- ends: .pricing-wrapper -->
                </div>
            </div><!-- end .row -->
        </div><!-- end .container -->
        
        <div class="container">
        
            <div class="row">
                    <div class="col-md-12">
                            <div class="section-title">
                        		<h2>ケアサービス</h2>
                    		</div>
                    </div><!-- ends: .col-md-12 -->
                </div><!-- ends: .row -->
        
            <div class="row">
                <div class="col-lg-12">
                    <div class="pricing-wrapper">
                        <div class="package-single ">
                            <div class="package-header">
                                <h5 align="center">一般ケア</h5>
                                <div class="amount">
                                    <span>2,500円</span>
                                    		   約1時間
                                </div>
                            </div>
                            <div class="package-body">
                                <ul>
                                    <li class="yes">お食事・お水</li>
                                    <li class="yes">トイレのお世話・清掃</li>
                                    <li class="no">ブラッシング</li>
                                    <li class="no">シャワー</li>
                                    <li class="no">健康管理</li>
                                    <li class="no">マナー教育</li>
                                </ul>
                                <!-- <a href="" class="btn btn-dark btn-block">選択</a> -->
                            </div>
                        </div><!-- ends: .package-single  -->
                        <div class="package-single">
                            <div class="package-header">
                                <h5>クリーニングケア</h5>
                                <div class="amount">
                                    <span>3,200円</span>
                                   	    約1時間
                                </div>
                            </div>
                            <div class="package-body">
                                <ul>
                                    <li class="yes">お食事・お水</li>
                                    <li class="yes">トイレのお世話・清掃</li>
                                    <li class="yes">ブラッシング</li>
                                    <li class="yes">シャワー</li>
                                    <li class="no">健康管理</li>
                                    <li class="no">マナー教育</li>
                                </ul>
                               <!--  <a href="" class="btn btn-dark btn-block">選択</a> -->
                            </div>
                        </div><!-- ends: .package-single  -->
                        <div class="package-single featured-plan">
                           <div class="featured-badge">おすすめ</div>
                            <div class="package-header">
                                <h5>教育ケア</h5>
                                <div class="amount">
                                    <span>3,500円</span>
                                    	   約1時間
                                </div>
                            </div>
                            <div class="package-body">
                                <ul>
                                    <li class="yes">お食事・お水</li>
                                    <li class="yes">トイレのお世話・清掃</li>
                                    <li class="yes">ブラッシング</li>
                                    <li class="yes">シャワー</li>
                                    <li class="yes">健康管理</li>
                                    <li class="yes">マナー教育</li>
                                </ul>
                                <!-- <a href="" class="btn btn-primary btn-block">選択</a> -->
                            </div>
                        </div><!-- ends: .package-single  -->
                    </div><!-- ends: .pricing-wrapper -->
                </div>
            </div><!-- end .row -->
        </div><!-- end .container -->
    </section><!-- ends: .pricing_area -->
    
    <div class="go_top" style="display: block; text-align:center;">
	       <span class="icon-arrow-up"></span>
	</div>
    
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