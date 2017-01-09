<%-- 
    Document   : Header.jsp
    Created on : Nov 7, 2016, 9:04:15 PM
    Author     : Kelvin
--%>

<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="model.LoaiSanPham"%>
<%@page import="model.CTLoaiMatHang"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Map"%>
<%@page import="model.Items"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <meta name="name" content="content" charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="asset/css/style.css">
        <link href="https://fonts.googleapis.com/css?family=Taviraj" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="asset/font-awesome-4.7.0/css/font-awesome.min.css">
        <script src="asset/JQuery/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8" async defer></script>
        <script src="asset/JQuery/angular.min.js" type="text/javascript" charset="utf-8" async defer></script>
    </head>
    <body>
        <%
            LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>
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
                                    <li><a href="Login.jsp" title="">Quản lý đơn hàng</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header" style="height: 200px">
                <div class="container">
                    <div class="row">
                        <div class=" col-md-4 col-sm-4">
                            <div class="form-search">
                                <input type="text" name="" class="input-text" id="txtSearch" placeholder="Tìm kiếm">
                                <span class="glyphicon glyphicon-search" role="button" ></span>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <h1 class="logo">
                                <img src="asset/Images/store_1483157799_405.png" alt=""/>
                            </h1>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4" style="margin-top: 40px">
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
                                                        <div class="alert-close"> </div> 
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
                            </div
                        </div>
                    </div>
                </div>                                
            </div>
        </div>
                                                <div class="main-menu">
                                                    <nav class="navbar" data-spy="affix" role="navigation" data-offset-top="242">
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
                            <a href="MatHangTheoLoaiHang.jsp?maLoai=<%=c.getMaLoai()%>&pages=1" class="dropdown-toggle" data-toggle="dropdown"><span><%=c.getTenLoai()%></span> <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <% for (CTLoaiMatHang d : cTLoaiMatHangDAO.getListCTLoaiMH(c.getMaLoai())) {%>
                                <li><a href="CTMatHangTheoLoaiHang.jsp?categoryID=<%=d.getMaLoaiMH()%>&pages=1" title=""><%=d.getTenLoaiMH()%></a>
                                </li>
                                
                                <% }%></ul>
                            <div class="clearfix"></div>
                            <%}%>
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
</body>
</html>
