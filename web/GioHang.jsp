<%-- 
    Document   : GioHang
    Created on : Nov 14, 2016, 6:02:43 PM
    Author     : kelvi
--%>

<%@page import="dao.CTMatHangDAO"%>
<%@page import="model.CTSanPham"%>
<%@page import="java.util.Map"%>
<%@page import="model.Cart"%>
<%@page import="model.Items"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="model.LoaiSanPham"%>
<%@page import="model.CTLoaiMatHang"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>1996s</title>
        <meta name="name" content="content" charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="asset/css/style.css">
        <script src="asset/JQuery/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8" async defer></script>

        <link href="https://fonts.googleapis.com/css?family=Taviraj" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="asset/font-awesome-4.7.0/css/font-awesome.min.css">


    </head>

    <body>
        <%

            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
            LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
            CTLoaiMatHang cTLoaiMatHang = new CTLoaiMatHang();
            CTMatHangDAO cTMatHangDAO = new CTMatHangDAO();
            String categoryID = null;
            if (request.getParameter("categoryID") != null) {
                categoryID = request.getParameter("categoryID");
                cTLoaiMatHang = cTLoaiMatHangDAO.getCTLoaiMH(Long.parseLong(categoryID));
            }
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>
        <div class=wapper>
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
                                    <img src="asset/Images/cooltext222136217567824.png" alt=""/>
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
                                                    <div class="check_button"><a href="#">Xem giỏ hàng</a></div>
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
        </div>
        <div class="main-menu">
            <nav class="navbar" data-spy="affix" data-offset-top="240">
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
                                <a href="MatHangTheoLoaiHang.jsp?maLoai=<%=c.getMaLoai()%>" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=c.getTenLoai()%> <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <% for (CTLoaiMatHang d : cTLoaiMatHangDAO.getListCTLoaiMH(c.getMaLoai())) {%>
                                    <li><a href="CTMatHangTheoLoaiHang.jsp?categoryID=<%=d.getMaLoaiMH()%>" title=""><%=d.getTenLoaiMH()%></a>
                                    </li>
                                    <% }%></ul><%}%>
                            </li>
                            <li><a href="" title="">LIÊN HỆ</a>
                            </li>
                        </ul>

                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
        </div>
        <div class="main">
            <div class="container">
                <div class="row">
                    <ul class="breadcrumb">
                        <li><span class="fa fa-home" style="margin:15px"></span><a href="Home.jsp" class="link">Home</a></li>
                        <li>Thông tin giỏ hàng</li>
                    </ul>
                </div>
                <div class="row">
                    <%if (cart.countCart() == 0) {%>
                    <h1>// Giỏ hàng trống</h1><%} else {%>
                    <div class="col-md-6">
                        <h3>Thông tin người mua hàng</h3>
                        <h5><i>(Vui lòng điền đầy đủ thông tin)</i></h5>
                        <form method="POST" action="Checkout">
                            <div class="form-group">
                                <label>Họ & Tên <i style="color: red">(*)</i></label>
                                <input type="text" name="name" class="form-control" id="inputName" placeholder="Nhập họ tên" required>
                            </div>
                            <div class="form-group">
                                <label>Số điện thoại <i style="color: red">(*)</i></label>
                                <input type="text" name="sdt" class="form-control" id="inputSdt" placeholder="Điện thoại liên lạc" required>
                            </div>
                            <div class="form-group">
                                <label>Email <i style="color: red">(*)</i></label>
                                <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email" required>
                            </div>
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <input type="text" name="address" class="form-control" id="inputAdress" placeholder="Địa chỉ nhận hàng" required>
                            </div>
                            <div class="form-group">
                                <label>Ghi chú <i style="color: red">(*)</i></label>
                                <textarea name="note" class="form-control" id="inputNote" placeholder="Thời gian giao hàng hoặc yêu cầu khác" rows="5" required></textarea>
                            </div>
                            <button type="submit" id="dathang" class="btn btn-primary" style="width:100%">Đặt hàng</button>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <h3>Chi tiết sản phẩm trong giỏ hàng</h3>

                        <%for (Map.Entry<Long, Items> list : cart.getCartItems().entrySet()) {%>
                        <table class="table">
                            <tbody> 
                                <tr>
                                    <td>
                                        <img src="LoadHinhAnh?mamh=<%=list.getValue().getSanPham().getMaMH()%>" alt="">
                                    </td>
                                    <td>
                                        <p><%=list.getValue().getSanPham().getTenMH()%></p>  

                                        <p><%=list.getValue().getColor()%>, <%=list.getValue().getSize()%></p>



                                    </td>
                                    <td>
                                        <div>
                                            <%
                                                Locale locale = new Locale("vi", "VN");
                                                NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
                                                Double dongia = list.getValue().getSanPham().getDonGia();
                                            %><%=fmt.format(dongia)%><i style="color: red">*</i></div>
                                        <form method="POST" action="SuaGioHang">
                                            <div class="input-group">
                                                <input type="hidden" name="productID" value="<%=list.getValue().getSanPham().getMaMH()%>">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <input type="text" class="form-control" value="<%=list.getValue().getQuantity()%>" name="soluong">
                                                        </td>

                                                        <td>
                                                            <button class="btn btn-default" type="submit" style="border-radius: 0px">Update</button>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </form>
                                    </td>
                                    <td>
                                        <form method="POST" action="XoaGioHang">
                                            <input type="hidden" name="productID" value="<%=list.getValue().getSanPham().getMaMH()%>">
                                            <button type="submit" style="margin-top: 17px;border-radius: 1px">
                                                <i class="fa fa-remove" style="color: red;"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                <%}%>
                                <tr >
                                    <td align="right" colspan="3">
                                        <span for="" style="float: right">Tổng cộng:<b style="color: red">
                                                <%
                                                    Locale locale1 = new Locale("vi", "VN");
                                                    NumberFormat fmt1 = NumberFormat.getCurrencyInstance(locale1);
                                                    Double tongtien = cart.totalCart();
                                                %><%=fmt1.format(tongtien)%></b></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                    </div>
                    <%}%>

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
                        <img src="asset/Images/cooltext222136217567824.png" alt=""/>
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
            <p role="button" class="back-to-top" data-toggle="tooltip" data-placement="top" title="Lên đầu trang">
                    <img src="asset/Images/1349751884_navigation-up-button_blue.png" alt="" />
                </p>
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
