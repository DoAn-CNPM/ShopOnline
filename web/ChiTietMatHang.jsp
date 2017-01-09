
<%@page import="dao.CTHinhAnhDAO"%>
<%@page import="model.CTHinhAnh"%>
<%@page import="java.util.Map"%>
<%-- 
    Document   : ChiTietMatHang
    Created on : Nov 10, 2016, 8:58:51 AM
    Author     : Kelvin
--%>
<%@page import="model.Cart"%>
<%@page import="model.CTSanPham"%>
<%@page import="model.Items"%>
<%@page import="dao.CTMatHangDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.SanPham"%>
<%@page import="dao.SanPhamDAO"%>
<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="model.CTLoaiMatHang"%>
<%@page import="model.LoaiSanPham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <title>Bonfire a Ecommerce Category Flat Bootstarp Responsive Website Template | Single :: w3layouts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="asset/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="asset/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="asset/JQuery/angular.min.js" type="text/javascript"></script>
        <script src="asset/JQuery/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="asset/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Custom Theme files -->
        <!--theme-style-->
        <link href="asset/css/style.css" rel="stylesheet" type="text/css" />
        <!--//theme-style-->
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({
                        scrollTop: $(this.hash).offset().top
                    }, 1000);
                });
            });
        </script>
        <link href="asset/css/etalage.css" rel="stylesheet" type="text/css" />
        <script src="asset/JQuery/jquery.etalage.min.js" type="text/javascript"></script>
        <script>
            jQuery(document).ready(function ($) {

                $('#etalage').etalage({
                    thumb_image_width: 300,
                    thumb_image_height: 400,
                    source_image_width: 900,
                    source_image_height: 1200,
                    show_hint: true,
                    click_callback: function (image_anchor, instance_id) {
                        alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                    }
                });

            });
        </script>
        <link href="asset/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <%

            LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
            CTMatHangDAO cTMatHangDAO = new CTMatHangDAO();
            CTHinhAnhDAO cTHinhAnhDAO=new CTHinhAnhDAO();
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            SanPham sanPham = new SanPham();
            CTLoaiMatHang cTLoaiMatHang = new CTLoaiMatHang();
            String productID="";
            String categoryID = "";
            LoaiSanPham loaiSanPham = new LoaiSanPham();
            if (request.getParameter("categoryID") != null) {
                categoryID = request.getParameter("categoryID");

            }
            if (request.getParameter("productID") != null) {
                productID=request.getParameter("productID");
                sanPham = sanPhamDAO.getSanPham(Long.parseLong(productID));
            }
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            Locale locale = new Locale("vi", "VN");
            NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
        %>
        <div class="wapper">
            <div class="Header">
                <div class="header-container">
                    <div class="top-link">
                        <div class="container">
                            <div class="top-link-inner">
                                <div class="row">
                                    <div class="col-md-6 col-sm-4">
                                        <i class="fa fa-phone-square fa-2x" aria-hidden="true" style="margin-top: 5px;color: #fff"></i>
                                        <span id="hotline">HOTLINE: 19001560</span>
                                    </div>
                                    <div class="col-md-6 col-sm-8">
                                        <ul>
                                            <li><a href="Login.jsp" title="">Đăng nhập</a>
                                            </li>
                                            <li><a href="" title="">Quản lý đơn hàng</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="header">
                        <div class="container">
                            <div class="row">
                                <div class=" col-md-4 col-sm-4">
                                    <div class="form-search">
                                        <input type="text" name="" class="input-text" id="txtSearch" placeholder="Tìm kiếm">
                                        <span class="glyphicon glyphicon-search" role="button"></span>
                                    </div>

                                </div>
                                <div class="col-xs-12 col-md-4 col-sm-4">
                                    <h1 class="logo">
                                        <img src="asset/Images/store_1442032777_158.png" alt="">
                                    </h1>
                                </div>
                                <div class="col-xs-12 col-md-4 col-sm-4">
                                    <div class="header-in">
                                        <ul class="icon1 sub-icon1">
                                            <li>
                                                <span role="button"><a href="https://www.facebook.com/kelvinphong168" title="" target="_blank">
                                                        <img src="asset/Images/facebook.png" alt=""></a></span>
                                            </li>
                                            <li>
                                                <span role="button"><a href="https://www.youtube.com/channel/UCNCwjpjfEIBzc-ZCKz1MiXw" title="" target="_blank">
                                                        <img src="asset/Images/youtube.png" alt=""></a></span>
                                            </li>
                                            <li>
                                                <span role="button"><a href="https://www.instagram.com/?hl=en" title="" target="_blank">
                                                        <img src="asset/Images/instagram.png" alt=""></a></span>
                                            </li>
                                            <li>
                                                <span role="button"><a href="https://plus.google.com/" title="" target="_blank">
                                                        <img src="asset/Images/google-plus.png" alt=""></a></span>
                                            </li>

                                            <li><div class="cart">
                                                    <a href="#" class="cart-in"> </a>
                                                    <span> <%=cart.countCart()%></span>
                                                </div>
                                                <ul class="sub-icon1 list">
                                                    <div class="shopping_cart">
                                                        <%for (Map.Entry<Long, Items> list : cart.getCartItems().entrySet()) {%>
                                                        <div class="cart_box">
                                                            <div class="message">
                                                                <div class="list_img"><img src="LoadHinhAnh?mamh=<%=list.getValue().getSanPham().getMaMH()%>" class="img-responsive" alt=""></div>
                                                                <div class="list_desc"><h4><%=list.getValue().getSanPham().getTenMH()%></h4><%=list.getValue().getQuantity()%> x<span class="actual">
                                                                        <%
                                                                            Locale locale1 = new Locale("vi", "VN");
                                                                            NumberFormat fmt1 = NumberFormat.getCurrencyInstance(locale1);
                                                                            Double dongia = list.getValue().getSanPham().getDonGia();
                                                                            %><%=fmt1.format(dongia)%></span></div>
                                                                <div class="clearfix"></div>
                                                            </div>
                                                        </div>
                                                        <%}%>
                                                    </div>
                                                    <div class="total">
                                                        <div class="total_left">Tổng cộng : </div>
                                                        <div class="total_right"><%
                                                            Locale locale2 = new Locale("vi", "VN");
                                                            NumberFormat fmt2 = NumberFormat.getCurrencyInstance(locale2);
                                                            Double tongcong = cart.totalCart();
                                                            %><%=fmt2.format(tongcong)%></div>
                                                        <div class="clearfix"> </div>
                                                    </div>
                                                    <div class="login_buttons">
                                                        <div class="check_button"><a href="GioHang.jsp?cart">Xem giỏ hàng</a></div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main-menu">
                    <nav class="navbar" data-spy="affix" role="navigation" data-offset-top="207">
                        <div class="container">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="Home.jsp"><span class="glyphicon glyphicon-home"></span></a>
                            </div>

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                        <li><a href="SanPhamMoi.jsp?pages=1" title="">NEW ARRIVALS</a>
                                        </li>
                                    <% for (LoaiSanPham c : loaiSanPhamDAO.getListLoaiSP()) {%>
                                    <li class="dropdown">
                                        <a href="CTMatHangTheoLoaiHang.jsp?categoryID=<%=c.getMaLoai()%>&pages=1" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=c.getTenLoai()%> <span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <% for (CTLoaiMatHang d : cTLoaiMatHangDAO.getListCTLoaiMH(c.getMaLoai())) {%>
                                            <li><a href="CTMatHangTheoLoaiHang.jsp?categoryID=<%=d.getMaLoaiMH()%>&pages=1" title=""><%=d.getTenLoaiMH()%></a>
                                            </li>
                                            <% }%></ul><%}%>
                                    </li>
                                    <li><a href="Contact.jsp" title="">LIÊN HỆ</a>
                                    </li>
                                </ul>

                            </div>
                            <!-- /.navbar-collapse -->
                        </div>
                        <!-- /.container-fluid -->
                    </nav>
                </div>
            </div>
            <div class="main">
                <div class="container">
                    <div class="row">
                        <ol class="breadcrumb">
                            <li><span class="fa fa-home" style="margin:15px"></span><a href="Home.jsp">Home</a></li>

                            <li><a href="CTMatHangTheoLoaiHang.jsp?categoryID=<%=sanPham.getMaLoaiMH()%>&pages=1"><%=sanPham.getTenMH()%></a></li>

                        </ol>
                    </div>
                    <div class="row product-info">
                        <div class="col-md-4">
                            <ul id="etalage">
                                <li>
                                    <a href="optionallink.html">

                                        <img class="etalage_thumb_image img-responsive" src="LoadHinhAnh?mamh=<%=sanPham.getMaMH()%>" alt=""/>
                                        <img class="etalage_source_image img-responsive" src="LoadHinhAnh?mamh=<%=sanPham.getMaMH()%>" alt=""/>
                                    </a>
                                </li>
                                <%for (CTHinhAnh ct : cTHinhAnhDAO.getListHinhAnh(Long.parseLong(productID))) {%>
                                <li>
                                    <img class="etalage_thumb_image img-responsive" src="<%=ct.getHinhAnh()%>" alt="">
                                    <img class="etalage_source_image img-responsive" src="<%=ct.getHinhAnh()%>" alt=""> 
                                </li>
                                <%}%>

                            </ul>
                        </div>
                        <div class="col-md-5">
                            <div class="single-para">
                                <h3><%=sanPham.getTenMH()%></h3>
                                <p style="font-size: 12px;color: grey"><%=sanPham.getMaMH()%></p>
                                <h4 class="price"><%

                                    Double dongia = sanPham.getDonGia();
                                    %>
                                    <%=fmt.format(dongia)%></h4>

                                <h5>Có <%=sanPham.getSoLuong()%> sản phẩm trong cửa hàng</h5>
                                <p><%=sanPham.getMoTa()%></p>

                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="buyBox">
                                <div id="form-login" ng-app="demoApp" ng-controller="ThemGioHang">
                                    <form method="POST" action="ThemGioHang" name="form" ng-submit="login()"
                                          novalidate>
                                        <div class="form-group">
                                            <label for="selectColor" required>Color:</label>
                                            <select class="form-control" name="color" id="selectColor" ng-model="color" required>
                                                <option value="">Chọn màu</option>
                                                <%for (CTSanPham ct : cTMatHangDAO.getListColor(Long.parseLong(productID))) {%>
                                                <option value=<%=ct.getMauSac()%>>
                                                    <%=ct.getMauSac()%>
                                                </option>
                                                <%}%>
                                            </select>
                                            <i class=""
                                               ng-show="form.color.$dirty && form.color.$valid"></i>
                                            <div ng-show="form.color.$dirty && form.color.$invalid"
                                                 class="text-danger"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="selectSize" required>Size</label>
                                            <select class="form-control" name="size" id="selectSize"  ng-model="size" required>
                                                <option value="">Chọn Size</option>
                                                <%for (CTSanPham ct : cTMatHangDAO.getListSize(Long.parseLong(productID))) {%>
                                                <option value=<%=ct.getSize()%>>
                                                    <%=ct.getSize()%>
                                                </option>
                                                <%}%>
                                            </select>
                                            <i class=""
                                               ng-show="form.size.$dirty && form.size.$valid"></i>
                                            <div ng-show="form.size.$dirty && form.size.$invalid"
                                                 class="text-danger"></div>
                                        </div>
                                        <div class="form-group">
                                            <label class="inputSL">Số lượng</label>
                                            <input name="soluong" type="number" class="form-control" id="inputSL" ng-model="soluong" required>
                                            <i class=""
                                               ng-show="form.soluong.$dirty && form.soluong.$valid"></i>
                                            <div ng-show="form.soluong.$dirty && form.soluong.$invalid"
                                                 class="text-danger"></div>
                                        </div>
                                        <div class="form-group">
                                            <input type="hidden" name="productID" value="<%=sanPham.getMaMH()%>">

                                            <button type="submit" class="form-control"
                                                    onClick="alert('Thêm sản phẩm vào giỏ hàng thành công')" style="margin-bottom: 10px" 
                                                    ng-disabled="!form.$dirty || (form.$dirty && form.$invalid)">+ Thêm vào giỏ</button>
                                        </div>
                                        <div class="form-group">
                                            <input class="btn btn-primary form-control" type="submit" name="muangay" value="Mua ngay"
                                                   ng-disabled="!form.$dirty || (form.$dirty && form.$invalid)">
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr>
                        <h3 style="color: grey">Chi Tiết Sản Phẩm</h3>
                        <div class="col-sm-12 text-center">
                            <% for (CTHinhAnh ct : cTHinhAnhDAO.getListHinhAnh(Long.parseLong(productID))) {%>
                            <img src="<%=ct.getHinhAnh()%>" alt=""/>
                            <%}%>

                        </div>
                        <hr>
                    </div>
                    <div class="row">

                        <h3 style="color: grey">Sản phẩm khác</h3>
                        <hr>
                        <%for (SanPham sp : sanPhamDAO.ranListProduct()) {%>
                        <div class="col-md-3" id="hovergallery2">
                            <a href="ChiTietMatHang.jsp?productID=<%=sp.getMaMH()%>" class="thumbnail">
                                <img src="LoadHinhAnh?mamh=<%=sp.getMaMH()%>">
                                <div class="caption">
                                    <h4 style="font-size: 18px"><%=sp.getTenMH()%></h4>
                                    <%
                                        int discount = sp.getDiscount();
                                        if (discount == 0) {
                                    %>
                                    <h4 style="color: #ec5355;margin-top: -1px;font-size: 15px;font-weight: 700">
                                        <%
                                            Double dongia1 = sp.getDonGia();
                                        %>
                                        <%=fmt.format(dongia1)%>
                                    </h4>

                                    <%} else {%>

                                    <h4 style="color: grey; margin-left: 18px;text-decoration: line-through;margin-top: -1px;float: left;font-size: 15px">
                                        <%
                                            Double dongia2 = sp.getDonGia();
                                        %>
                                        <%=fmt.format(dongia2)%>
                                    </h4> 
                                    <h4 style="color: #ec5355; margin-right: -65px;font-size: 15px;margin-top: -1px;font-weight: 700">
                                        <%
                                            Double dongia3 = sp.getDonGia();
                                            dongia3 = dongia3 - dongia3 * discount / 100;
                                        %>
                                        <%=fmt.format(dongia3)%>
                                    </h4> 
                                    <%}%>
                                </div>
                            </a>
                        </div>
                        <%}%>

                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="footer-links">
                <div class="container">
                    <hr>
                    <div class="row">
                        <div class="top-social">
                            <span role="button"><a href="https://www.facebook.com/kelvinphong168" title="" target="_blank"><img src="asset/Images/facebook.png" alt=""></a></span>
                            <span role="button"><a href="https://www.youtube.com/channel/UCNCwjpjfEIBzc-ZCKz1MiXw" title="" target="_blank"><img src="asset/Images/youtube.png" alt=""></a></span>
                            <span role="button"><a href="https://www.instagram.com/?hl=en" title="" target="_blank"><img src="asset/Images/instagram.png" alt=""></a></span>
                            <span role="button"><a href="https://plus.google.com/" title="" target="_blank"><img src="asset/Images/google-plus.png" alt=""></a></span>
                            <span role="button"><a href="https://twitter.com/?lang=en" title="" target="_blank"><img src="asset/Images/twitter.png" alt=""></a></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-footer">
                <div class="container">
                    <div class="col-md-4">                       
                        <h3 style="color: #fff;margin-top: 40px">VỀ CHÚNG TÔI</h3>
                        <div>
                            <p><span style="font-size: 27px">B</span>ảo hành 365 ngày<span></span></p>
                            <p><span style="font-size: 27px">S</span>ẵn sàng đổi hoặc hoàn tiền <br><i> khi sản phẩm không đạt chất lượng</i></p>
                            <p><span style="font-size: 27px">G</span>iao hàng tận nơi nhanh chóng và tiện lợi<span></span></p>
                        </div>
                        <br>
                        <p>"Chúng tôi sẵn sàng đương đầu với thử thách...!" - Sau 3 năm thành lập đến nay hệ thống cửa hàng 1996s đã ngày càng phát triển và hoàn thiện hơn so với lúc đầu thành lập, và đáp ứng nhu cầu mua sắm của mọi người, đặc biệt là các bạn trẻ. Cửa hàng 1996s đã mang đến đầy đủ mọi mặt hàng gồm quần áo, giày dép, sẵn sàng phục vụ nhu vầu của mọi người khi đến với shop.</p>
                    </div>
                    <div class="col-md-4">
                        <img src="asset/Images/store_1442032777_158.png" alt="" style="width: 100%;margin-top: 10px">
                        <div class="footer-static-content">
                            <ul class="address">
                                <li>
                                    <span class="fa fa-phone"></span>
                                    <div class="media-body">
                                        <p>1900 1560 - 1900 1800</p>
                                    </div>
                                </li>
                                <li class="">
                                    <span class="fa fa-bolt"></span>
                                    <div class="media-body">
                                        <p>Than phiền: 1900 113</p>
                                    </div>
                                </li>
                                <li>
                                    <span class="fa fa-envelope-o"></span>
                                    <div class="media-body">
                                        <p>cskh@1996sShop.com</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h4><i class="fa fa-map-signs"></i>
                                    Hệ thống cửa hàng 1996s
                                </h4>
                                <div class="top-address">
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
                    <div class="col-md-4">
                        <h3 style="color: #fff;margin-top: 40px">LIÊN HỆ CHÚNG TÔI</h3>
                        <p>Số 1, Võ Văn Ngân, Quận Thủ Đức, Thành phố Hồ Chí Minh</p>
                        <p><i class="fa fa-phone-square fa-lg"></i>  Phone: (+84) 1675946414</p>
                        <p><i class="fa fa-envelope fa-lg"></i>  Email: phong.kelvin168@gmail.com</p>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.4882375048137!2d106.76982521428005!3d10.85042109227135!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175270ad28d48ab%3A0xa6c02de0a7c40d6c!2zVHLGsOG7nW5nIMSQSFNQIEvhu7kgVGh14bqtdCBUcC4gSENN!5e0!3m2!1sen!2s!4v1477921988048" width="400" height="250" frameborder="0" style="border:0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>

        </div>
        <p role="button" class="back-to-top" data-toggle="tooltip" data-placement="top" title="Lên đầu trang">
            <img src="asset/Images/1349751884_navigation-up-button_blue.png" alt="" />
        </p>
        <script src="asset/Scripts/back-to-top.js" type="text/javascript"></script>
        <script>
                                                       var demoApp = angular.module('demoApp', []).controller("ThemGioHang",
                                                               ['$scope', function ($scope) {
                                                                       $scope.success = false;
                                                                       $scope.register = function () {
                                                                           $scope.success = true;
                                                                       }
                                                                   }]);
        </script>
    </div>

</body>

</html>

