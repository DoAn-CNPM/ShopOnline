<%-- 
    Document   : Contact
    Created on : Dec 16, 2016, 1:47:51 PM
    Author     : kelvi
--%>

<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="dao.SanPhamDAO"%>
<%@page import="model.CTLoaiMatHang"%>
<%@page import="model.LoaiSanPham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>1996s - Mua Online Quần Áo</title>
        <meta name="name" content="content" charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="asset/css/style.css">
        <link href="asset/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
       

    </head>

    <body>
        <%
            LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
        %>
        <div class="wrapper">
            <jsp:include page="Header.jsp"></jsp:include>
            <div class="main">
                <div class="container">
                    <div class="row">
                        <ul class="breadcrumb">
                            <li><span class="fa fa-home" style="margin:15px"></span><a href="Home.jsp" class="link">Home</a></li>
                            <li class="active">Liên hệ</li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 id="contact" class="panel-title"><span><i class="fa fa-address-card-o"></i></span> LIÊN HỆ CHÚNG TÔI</h3>
                            </div>
                            <div class="panel-body">
                                <div class="col-md-6">
                                    <h4 style="margin-left: 20px"><i class="fa fa-thermometer-full"></i>
                                        HOTLINE:
                                    </h4>
                                    <ul class="address">
                                        <li>
                                            <span class="fa fa-phone" aria-hidden="true"></span>
                                            <div class="media-body">
                                                <p>Tel: 01675 946 414</p>
                                            </div>
                                        </li>
                                        <li class="">
                                            <span class="fa fa-bolt"></span>
                                            <div class="media-body">
                                                <p>Than phiền: 01629 40 43 42</p>
                                            </div>
                                        </li>
                                        <li>
                                            <span class="fa fa-envelope-o"></span>
                                            <div class="media-body">
                                                <p>Email: 14110166@student.hcmute.edu.vn</p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <h4 style="margin-left: 40px"><i class="fa fa-map-signs"></i>
                                        Hệ thống cửa hàng 1996s
                                    </h4>
                                    <div class="top-address1">
                                        <ul>
                                            <li><span style="font-size:15px;"><i class="fa fa-location-arrow" aria-hidden="true"></i>19 Nguyễn Trãi,P2 Quận 5,TP.HCM</span></li>
                                            <li><span style="font-size:15px;"><i class="fa fa-location-arrow" aria-hidden="true"></i>439 Nguyễn Trãi,P7,Quận 5,TP.HCM</span></li>
                                            <li><span style="font-size:15px;"><i class="fa fa-location-arrow" aria-hidden="true"></i>412 Lê Văn Sỹ,P 14,Quận 3,TP.HCM </span></li>
                                            <li><span style="font-size:15px;"><i class="fa fa-location-arrow" aria-hidden="true"></i>55 Quang Trung,P10,Quận Gò vấp,TP.HCM</span></li>
                                            <li><span style="font-size:15px;"><i class="fa fa-location-arrow" aria-hidden="true"></i>170A Võ Văn Ngân,P.Bình Thọ,Q.Thủ Đức</span></li>
                                            <li><span style="font-size:15px;"><i class="fa fa-location-arrow" aria-hidden="true"></i>16D Nguyễn Ảnh Thủ, P.Trung Mỹ Tây, Q.12</span></li>
                                        </ul>                         
                                    </div> 
                                </div>     
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 id="contact" class="panel-title"><span><i class="fa fa-location-arrow" aria-hidden="true"></i></span> VỊ TRÍ</h3>
                            </div>
                            <div class="panel-body">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.4882375048137!2d106.76982521428005!3d10.85042109227135!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175270ad28d48ab%3A0xa6c02de0a7c40d6c!2zVHLGsOG7nW5nIMSQSFNQIEvhu7kgVGh14bqtdCBUcC4gSENN!5e0!3m2!1sen!2s!4v1477921988048" 
                                        frameborder="0" style="border:0;width: 100%;height: 270px" allowfullscreen></iframe>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <br>
            </div>
        </div>
        <p role="button" class="back-to-top" data-toggle="tooltip" data-placement="top" title="Lên đầu trang">
            <img src="asset/Images/1349751884_navigation-up-button_blue.png" alt="" />
        </p>
    </div>

    <script src="asset/JQuery/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8" async defer></script>

    <script src="asset/bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8" async defer></script>
    <script src="asset/Scripts/back-to-top.js" type="text/javascript" charset="utf-8" async defer></script>

</body>

</html>
