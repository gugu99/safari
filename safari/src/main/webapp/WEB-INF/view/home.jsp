<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<html>
  <head>
    <title>Safari</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/home/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/home/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/home/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/home/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/home/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/home/css/jquery.fancybox.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/home/css/bootstrap-datepicker.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/home/fonts/flaticon/font/flaticon.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/home/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/home/css/style.css">
    
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  

  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border text-primary" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>


  <div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   
    
    <header class="site-navbar js-sticky-header site-navbar-target" role="banner">

      <div class="container">
        <div class="row align-items-center">
          
          <div class="col-6 col-xl-2">
            <h1 class="mb-0 site-logo" style="width: 200px;"><a href="${pageContext.request.contextPath }/" class="h2 mb-0">Safari<span class="text-primary">.</span> </a></h1>
          </div>

          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">

              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li><a href="#home-section" class="nav-link">Home</a></li>
                <li class="has-children">
                  <a href="#about-section" class="nav-link">About Us</a>
                  <ul class="dropdown">
                   <li><a href="#services-section" class="nav-link">Services</a></li>
                    <li><a href="#pricing-section" class="nav-link">Pricing</a></li>
                    <li><a href="#faq-section" class="nav-link">FAQ</a></li>
                  </ul>
                </li>
                <li><a href="${pageContext.request.contextPath }/account/login"><span class="text-primary">Login</span></a></li>
                <li><a href="${pageContext.request.contextPath }/account/register"><span class="text-primary">Sign Up</span></a></li>
                <li><a href="#contact-section" class="nav-link">Contact</a></li>
                <li class="social"><a href="https://github.com/gugu99/safari" target="blank" class="nav-link"><span class="h4 text-primary icon-github"></span></a></li>
              </ul>
            </nav>
          </div>


          <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle float-right"><span class="icon-menu h3"></span></a></div>

        </div>
      </div>
      
    </header>

  
     
    <div class="site-blocks-cover overlay" style="background-image: url(${pageContext.request.contextPath }/resources/assets/home/images/hero_2.jpg);" data-aos="fade" id="home-section">

      <div class="container">
        <div class="row align-items-center justify-content-center">

          
          <div class="col-md-10 mt-lg-5 text-center">
            <div class="single-text owl-carousel">
              <div class="slide">
                <h1 class="text-uppercase" data-aos="fade-up">프로젝트 기획</h1><br>
                <p class="mb-5 desc"  data-aos="fade-up" data-aos-delay="100">프로젝트는 팀이 공통된 목표를 향해 함께 나아갈 수 있도록 관련된<br> 업무들을 한 곳에 모아놓은 곳입니다.</p>
                <div data-aos="fade-up" data-aos-delay="100">
                  <a href="${pageContext.request.contextPath }/account/login" class="btn  btn-primary mr-2 mb-2">더 알아보기</a>
                </div>
              </div>

              <div class="slide">
                <h1 class="text-uppercase" data-aos="fade-up">업무관리</h1><br>
                <p class="mb-5 desc" data-aos="fade-up" data-aos-delay="100">업무를 작성하고, 마감일을 설정하고,<br> 팀원과 자신을 업무에 배정할 수 있습니다.</p>
                <div data-aos="fade-up" data-aos-delay="100">
                  <a href="${pageContext.request.contextPath }/account/login" class="btn  btn-primary mr-2 mb-2">더 알아보기</a>
                </div>
              </div>

              <div class="slide">
                <h1 class="text-uppercase" data-aos="fade-up">업무분석</h1><br>
                <p class="mb-5 desc" data-aos="fade-up" data-aos-delay="100">업무리스트 별로 마감일이 지난 업무, 완료된 업무, 계획된 업무는 몇 퍼센트인지 확인하며,<br> 프로젝트 안의 업무 완료 비율을 추적할 수 있습니다.</p>
                <div data-aos="fade-up" data-aos-delay="100">
                  <a href="${pageContext.request.contextPath }/account/login" class="btn  btn-primary mr-2 mb-2">더 알아보기</a>
                </div>
              </div>

            </div>
          </div>
            
        </div>
      </div>

      <a href="#next" class="mouse smoothscroll">
        <span class="mouse-icon">
          <span class="mouse-wheel"></span>
        </span>
      </a>
    </div>  


    <div class="site-section cta-big-image" id="about-section">
      <div class="container">
        <div class="row mb-5 justify-content-center">
          <div class="col-md-8 text-center">
            <h2 class="section-title mb-3" data-aos="fade-up" data-aos-delay="">About Us</h2>
            <p class="lead" data-aos="fade-up" data-aos-delay="100">워크스페이스, 프로젝트 관리, 타임라인, 피드백, 파일공유 등 <br>다양한 협업 도구를 갖추고 있습니다.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6 mb-5" data-aos="fade-up" data-aos-delay="">
            <figure class="circle-bg">
            <img src="${pageContext.request.contextPath }/resources/assets/home/images/img_2.jpg" alt="Free Website Template by Free-Template.co" class="img-fluid">
            </figure>
          </div>
          <div class="col-lg-5 ml-auto" data-aos="fade-up" data-aos-delay="100">
            
            <h3 class="text-black mb-4">프로젝트 템플릿으로 손쉽게<br> 정리하는 업무 프로세스</h3>

            <p>자동으로 생성되는 템플릿을 사용하면 업무 프로세스를 고민하는 시간을 줄일 수 있습니다.</p>

            <p>전 세계 모든 사용자들이 더 효율적인 협업을 할 수 있도록 기여하는 것이 Safari의 목표입니다.</p>
            
          </div>
        </div>    
        
      </div>  
    </div>

    <div class="site-section" id="next">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-4 text-center" data-aos="fade-up" data-aos-delay="">
            <img src="${pageContext.request.contextPath }/resources/assets/home/images/project3.png" alt="Free Website Template by Free-Template.co" class="img-fluid w-25 mb-4">
            <h3 class="card-title">프로젝트 관리</h3>
            <p>프로젝트는 팀이 공통된 목표를 향해<br> 함께 나아갈 수 있도록 관련된<br> 업무들을 한 곳에 모아놓은 곳입니다.</p>
          </div>
          <div class="col-md-4 text-center" data-aos="fade-up" data-aos-delay="100">
            <img src="${pageContext.request.contextPath }/resources/assets/home/images/task3.png" alt="Free Website Template by Free-Template.co" class="img-fluid w-25 mb-4">
            <h3 class="card-title">업무관리</h3>
            <p>업무를 작성하고, 마감일을 설정하고,<br> 팀원과 자신을 업무에 배정할 수 있습니다.</p>
          </div>
          <div class="col-md-4 text-center" data-aos="fade-up" data-aos-delay="200">
            <img src="${pageContext.request.contextPath }/resources/assets/home/images/analysis.png" alt="Free Website Template by Free-Template.co" class="img-fluid w-25 mb-4">
            <h3 class="card-title">업무분석</h3>
            <p>업무리스트 별로 마감일이 지난 업무, 완료된 업무, 계획된 업무는 몇 퍼센트인지 확인하며,<br>프로젝트 안의 업무 완료 비율을 추적할 수 있습니다.</p>
          </div>

        </div>

        <div class="row">
          <div class="col-lg-6 mb-5" data-aos="fade-up" data-aos-delay="">
            <figure class="circle-bg">
            <img src="${pageContext.request.contextPath }/resources/assets/home/images/about.jpg" alt="Free Website Template by Free-Template.co" class="img-fluid">
            </figure>
          </div>
          <div class="col-lg-5 ml-auto" data-aos="fade-up" data-aos-delay="100">
            <div class="mb-4">
              <h3 class="h3 mb-4 text-black">협업을 더욱 스마트하게</h3>
              <p>한 곳에서 프로젝트를 관리하고 업무를 추적해 팀원들과 <br> 원활하게 협업할 수 있습니다.</p>
              
            </div>
              
            <div class="mb-4">
              <ul class="list-unstyled ul-check success">
                <li>Amazon Web Services</li>
                <li>GDPR</li>
                <li>Privacy Shield certified</li>
              </ul>
              
            </div>
          </div>
        </div>
      </div>
    </div>

    <section class="site-section border-bottom bg-light" id="services-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center" data-aos="fade">
            <h2 class="section-title mb-3">Our Services</h2>
          </div>
        </div>
        <div class="row align-items-stretch">
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up">
            <div class="unit-4">
              <div class="unit-4-icon">
                <img src="${pageContext.request.contextPath }/resources/assets/home/images/task.png" alt="Free Website Template by Free-Template.co" class="img-fluid w-25 mb-4">
              </div>
              <div>
                <h3>프로젝트 관리</h3>
                <p>시각적인 업무 보드로 기획 및 업무관리, 담당자 지정, 진행 상태을 확인합니다.</p>
                <p><a href="#">Learn More</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="unit-4">
              <div class="unit-4-icon">
                <img src="${pageContext.request.contextPath }/resources/assets/home/images/time2.png" alt="Free Website Template by Free-Template.co" class="img-fluid w-25 mb-4">
              </div>
              <div>
                <h3>업무시간 관리</h3>
                <p>각 업무와 프로젝트에 소요된 시간을 트래킹하고 활동로그를 확인합니다.</p>
                <p><a href="#">Learn More</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up" data-aos-delay="200">
            <div class="unit-4">
              <div class="unit-4-icon">
                <img src="${pageContext.request.contextPath }/resources/assets/home/images/file2.png" alt="Free Website Template by Free-Template.co" class="img-fluid w-25 mb-4">
              </div>
              <div>
                <h3>파일 관리</h3>
                <p>파일을 한곳에서 관리하며 메신저 또는 프로젝트 파일을 첨부하여 공유합니다.</p>
                <p><a href="#">Learn More</a></p>
              </div>
            </div>
          </div>


          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up" data-aos-delay="">
            <div class="unit-4">
              <div class="unit-4-icon">
                <img src="${pageContext.request.contextPath }/resources/assets/home/images/chat.png" alt="Free Website Template by Free-Template.co" class="img-fluid w-25 mb-4">
              </div>
              <div>
                <h3>업무 메신저</h3>
                <p>파일공유, 수신확인 등 다양한 기능을 통해, 실시간 커뮤니케이션 합니다.</p>
                <p><a href="#">Learn More</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="unit-4">
              <div class="unit-4-icon">
                <img src="${pageContext.request.contextPath }/resources/assets/home/images/project.png" alt="Free Website Template by Free-Template.co" class="img-fluid w-25 mb-4">
              </div>
              <div>
                <h3>성과 리포트</h3>
                <p>성과 보고서 및 실시간 피드백을 통해 업무의 성과를 확인합니다.</p>
                <p><a href="#">Learn More</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up" data-aos-delay="200">
            <div class="unit-4">
              <div class="unit-4-icon">
                <img src="${pageContext.request.contextPath }/resources/assets/home/images/timeLine.png" alt="Free Website Template by Free-Template.co" class="img-fluid w-25 mb-4">
              </div>
              <div>
                <h3>타임라인</h3>
                <p>타임라인을 통해 업무의 진행상황을 한눈에 확인합니다.</p>
                <p><a href="#">Learn More</a></p>
              </div>
            </div>
          </div>

        </div>
      </div>
    </section>


    <section class="site-section bg-light" id="pricing-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center" data-aos="fade-up">
            <h2 class="section-title mb-3">Pricing</h2>
          </div>
        </div>
        <div class="row mb-5">
          <div class="col-md-6 mb-4 mb-lg-0 col-lg-4" data-aos="fade-up" data-aos-delay="">
            <div class="pricing">
              <h3 class="text-center text-black">Free</h3>
              <div class="price text-center mb-4 ">
                <span><span>$0</span> / 월</span>
              </div>
              <ul class="list-unstyled ul-check success mb-5">
                
                <li>30일 무료체험</li>
                <li>체험 후 결제 가능</li>
                <br><br><br><br><br>
              </ul>
              <p class="text-center">
                <a href="${pageContext.request.contextPath }/account/register" class="btn btn-secondary">무료체험 시작</a>
              </p>
            </div>
          </div>

          <div class="col-md-6 mb-4 mb-lg-0 col-lg-4 pricing-popular" data-aos="fade-up" data-aos-delay="100">
            <div class="pricing">
              <h3 class="text-center text-black">Professional</h3>
              <div class="price text-center mb-4 ">
                <span><span>$20</span> / 월</span>
              </div>
              <ul class="list-unstyled ul-check success mb-5">
                
                <li>하나의 워크스페이스</li>
                <li>프로젝트 관리</li>
                <li>파일관리</li>
                <li>업무 피드백</li>
                <li>업무, 프로젝트, 프로젝트 그룹, 체크리스트 작성 무제한</li>
              </ul>
              <p class="text-center">
                <a href="${pageContext.request.contextPath }/account/register" class="btn btn-primary">Buy Now</a>
              </p>
            </div>
          </div>

          <div class="col-md-6 mb-4 mb-lg-0 col-lg-4" data-aos="fade-up" data-aos-delay="200">
            <div class="pricing">
              <h3 class="text-center text-black">Business</h3>
              <div class="price text-center mb-4 ">
                <span><span>$70</span> / 월</span>
              </div>
              <ul class="list-unstyled ul-check success mb-5">
                
                <li>프로페셔널 요금제의 모든 기능</li>
                <li>무제한 워크스페이스</li>
                <li>파일 저장 용량 무제한</li>
                <li>데이터 임포트 및 통합 지원</li>
                <li>요청에 따라 전체 활동 로그 및 사용 데이터 내역 추출 지원</li>
              </ul>
              <p class="text-center">
                <a href="${pageContext.request.contextPath }/account/register" class="btn btn-secondary">Buy Now</a>
              </p>
            </div>
          </div>
        </div>
        
        <div class="row site-section" id="faq-section">
          <div class="col-12 text-center" data-aos="fade">
            <h2 class="section-title">Frequently Ask Questions</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            
            <div class="mb-5" data-aos="fade-up" data-aos-delay="100">
            <h3 class="text-black h4 mb-4">프로젝트 관리자는 어떤 일을 할 수 있나요?</h3>
            <p>프로젝트 관리자는 프로젝트 수정, 삭제 및 글쓰기 권한 설정, 파일 다운로드 권한 설정이 가능합니다. 프로젝트 관리자는 프로젝트를 최초 생성 하거나 프로젝트 관리자에 의해서 권한을 부여 받을 수 있습니다. 개별 프로젝트의 관한 설정은 프로젝트 우측의 설정 버튼을 선택하시면 살펴 볼 수 있습니다.</p>
            </div>
            
            <div class="mb-5" data-aos="fade-up" data-aos-delay="100">
              <h3 class="text-black h4 mb-4">'업무 작성' 기능은 무엇인가요?</h3>
              <p>'업무 작성' 기능은 사파리에서 상대방에게 일을 요청하거나, 일을 진행할 때 이용하는 기능입니다. 사파리의 업무 작성 기능을 활용하면 간편하게 일을 요청하고, 또 진행 상황을 한눈에 알 수 있습니다.</p>
            </div>
            <br>
            <div class="mb-5" data-aos="fade-up" data-aos-delay="100">
	            <h3 class="text-black h4 mb-4">첨부파일 저장기간은 어떻게 되나요?</h3>
	            <p>첨부 파일은 7일간 저장됩니다. 채팅 창에서 7일 이상 지난 파일은 더 이상 다운로드할 수 없습니다. </p>
            </div>
            <br>
            <div class="mb-5" data-aos="fade-up" data-aos-delay="100">
              <h3 class="text-black h4 mb-4">결제금액 계산방법은 어떻게 하나요?</h3>
              <p>요금제는 가입 후 1개월의 체험기간을 제공합니다. 1개월 이후에는 결제정보를 등록하셔야 하며, 등록하지 않을 경우는 사용하실 수 없습니다.</p>
            </div>
          </div>
          
          <div class="col-lg-6">

            <div class="mb-5" data-aos="fade-up" data-aos-delay="100">
              <h3 class="text-black h4 mb-4">서비스 결제 / 비용 처리방식은 어떻게 이뤄지나요?</h3>
              <p>서비스 결제/비용 처리 방식은 '선 납부 형식'이며, 가능한 결제 수단으로는 신용카드, 계좌이체, 무통장 입금이 있습니다. 결제 개월은 1개월, 12개월, 24개월 중 선택하실 수 있으며, 1개월 결제는 '신용카드'만 가능합니다.</p>
            </div>
            
            <div class="mb-5" data-aos="fade-up" data-aos-delay="100">
              <h3 class="text-black h4 mb-4">서비스 연장 / 추가는 어떻게 해야 하나요?</h3>
              <p>기존 사용 중인 서비스 의 연장이나 추가가 필요할 경우, 고객사 내 관리자 분께서 간단하게 신청하실 수 있습니다. 기간 연장의 경우 1개월, 12개월, 24개월 연장이 가능하며, 1개월 연장의 경우 신용카드 결제만 가능합니다. 기간 연장 없이 부가 상품 추가만 원하시는 경우 '연장하지 않고 상품만 추가' 클릭 후 진행 부탁드립니다.</p>
            </div>
            
            <div class="mb-5" data-aos="fade-up" data-aos-delay="100">
              <h3 class="text-black h4 mb-4">서비스 유형 변경은 어떻게 신청하나요?</h3>
              <p>서비스 이용 중 유형 전환은 최소 3개월 사용 후 부터 가능하며, 담당자 협의 후 진행하실 수 있습니다. 유선문의: 1234-1234 (2번 서비스 연장 및 추가 구매문의) / 메일문의: https://github.com/gugu99/safari</p>
            </div>
            
            <div class="mb-5" data-aos="fade-up" data-aos-delay="100">
            <h3 class="text-black h4 mb-4">세금계산서를 발급하고 싶은데 어떻게 해야 하나요?</h3>
            <p>세금계산서 발급은 결제 월 말일에 일괄적으로 발행해드립니다. 세금계산서 발급이 필요하신 고객사 담당자 분들께서는 사파리 대표메일 (https://github.com/gugu99/safari)로 '사업자 등록증 사본'과 '담당자 연락처'를 보내주시기 바랍니다.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

 
    <section class="site-section bg-light" id="contact-section" data-aos="fade">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center">
            <h2 class="section-title mb-3">Contact Us</h2>
          </div>
        </div>
        <div class="row mb-5">
          


          <div class="col-md-4 text-center">
            <p class="mb-4">
              <span class="icon-room d-block h2 text-primary"></span>
              <span>서울특별시 금천구 가산디지털1로 151 (가산동, 세진 이노플렉스1차) 306호</span>
            </p>
          </div>
          <div class="col-md-4 text-center">
            <p class="mb-4">
              <span class="icon-phone d-block h2 text-primary"></span>
              <a href="#">+82 02)1234-1234</a>
            </p>
          </div>
          <div class="col-md-4 text-center">
            <p class="mb-0">
              <span class="icon-mail_outline d-block h2 text-primary"></span>
              <a href="https://github.com/gugu99/safari" target="blank">https://github.com/gugu99/safari</a>
            </p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 mb-5">

            

            <form action="#" class="p-5 bg-white">
              
              <h2 class="h4 text-black mb-5">Contact Form</h2> 

              <div class="row form-group">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label class="text-black" for="fname">First Name</label>
                  <input type="text" id="fname" class="form-control">
                </div>
                <div class="col-md-6">
                  <label class="text-black" for="lname">Last Name</label>
                  <input type="text" id="lname" class="form-control">
                </div>
              </div>

              <div class="row form-group">
                
                <div class="col-md-12">
                  <label class="text-black" for="email">Email</label> 
                  <input type="email" id="email" class="form-control">
                </div>
              </div>

              <div class="row form-group">
                
                <div class="col-md-12">
                  <label class="text-black" for="subject">Subject</label> 
                  <input type="subject" id="subject" class="form-control">
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="message">Message</label> 
                  <textarea name="message" id="message" cols="30" rows="7" class="form-control" placeholder="Write your notes or questions here..."></textarea>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="Send Message" class="btn btn-primary btn-md text-white">
                </div>
              </div>

  
            </form>
          </div>
          
        </div>
      </div>
    </section>

    
    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-9">
            <div class="row">
              <div class="col-md-5">
                <h2 class="footer-heading mb-4">About Us</h2>
                <p>워크스페이스, 프로젝트 관리, 타임라인, 피드백, 파일공유 등 다양한 협업 도구를 갖추고 있습니다.</p>
              </div>
              <div class="col-md-3 ml-auto">
                <h2 class="footer-heading mb-4">Quick Links</h2>
                <ul class="list-unstyled">
                  <li><a href="#about-section" class="smoothscroll">About Us</a></li>
                  <li><a href="#services-section" class="smoothscroll">Services</a></li>
                  <li><a href="#contact-section" class="smoothscroll">Contact Us</a></li>
                </ul>
              </div>
              <div class="col-md-3 footer-social">
                <h2 class="footer-heading mb-4">Follow Us</h2>
                <a href="https://github.com/gugu99/safari" target="blank" class="nav-link"><span class="h3 text-primary icon-github"></span></a>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <h2 class="footer-heading mb-4">Subscribe Newsletter</h2>
            <form action="#" method="post" class="footer-subscribe">
              <div class="input-group mb-3">
                <input type="text" class="form-control border-secondary text-white bg-transparent" placeholder="Enter Email" aria-label="Enter Email" aria-describedby="button-addon2">
                <div class="input-group-append">
                  <button class="btn btn-primary text-black" type="button" id="button-addon2">Send</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <div class="border-top pt-5">
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              <p>Copyright &copy;
                <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made
                with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
              </p>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
        
            </div>
          </div>
          
        </div>
      </div>
    </footer>

  </div> <!-- .site-wrap -->

  <script src="${pageContext.request.contextPath }/resources/assets/home/js/jquery-3.3.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/home/js/jquery-ui.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/home/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/home/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/home/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/home/js/jquery.countdown.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/home/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/home/js/aos.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/home/js/jquery.fancybox.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/home/js/jquery.sticky.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/home/js/isotope.pkgd.min.js"></script>

  
  <script src="${pageContext.request.contextPath }/resources/assets/home/js/main.js"></script>

  
  </body>
</html>
