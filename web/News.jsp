<%-- 
    Document   : News
    Created on : Dec 17, 2016, 5:45:47 PM
    Author     : kelvi
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.News"%>
<%@page import="dao.NewsDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.LoaiSanPham"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="java.util.Locale"%>
<%@page import="model.SanPham"%>
<%@page import="dao.SanPhamDAO"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="model.CTLoaiMatHang"%>
<%@page import="model.LoaiSanPham"%>
<%@page import="dao.LoaiSanPhamDAO"%>
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

        <link rel="stylesheet" type="text/css" href="asset/font-awesome-4.7.0/css/font-awesome.min.css">

    </head>

    <body>
        <%
            LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
            NewsDAO newsDAO = new NewsDAO();
            SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy");
        %>
        <div class=wapper>
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="main">
                    <div class="main-content">
                        <div class="container">
                            <div class="row">
                                <ol class="breadcrumb">
                                    <li><strong>
                                            <span id="btn-home" class="glyphicon glyphicon-home" aria-hidden="true" style="color: grey"></span>
                                            <a href="Home.jsp">Trang chủ</a>
                                        </strong>
                                    </li>
                                    <li class="active"><strong>Tin tức</strong></li>
                                </ol>
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-lg-3 col-md-3 col-sm-3">
                                    <div class="col-xs-12 col-lg-12 col-md-12 col-sm-12">
                                        <div class="page-title">
                                            <h1>Tin Tức Khác</h1>
                                        </div>
                                    </div>
                                    <br><br>
                                    <div class="col-xs-12 col-lg-12 col-md-12 col-sm-12">
                                    <%for (News news : newsDAO.getrandom()) {%>
                                    <div class="row" id="news">
                                        <div class="col-xs-12 col-lg-5 col-md-5 col-sm-5">
                                            <a href="ChiTietNews.jsp?id=<%=news.getId()%>">
                                                <img src="LoadHANews?id=<%=news.getId()%>" class="img-responsive" style="height: 85px;width: 93px"></a>
                                        </div>
                                        <div class="col-xs-12 col-lg-7 col-md-7 col-sm-7">
                                            <p id="title"><%=news.getTitle()%></p>
                                            <span style="font-size: 12px"><a href="ChiTietNews.jsp?id=<%=news.getId()%>">Xem thêm</a></span>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                            <div class="col-xs-12 col-lg-9 col-md-9 col-sm-9">
                                <%for (News n : newsDAO.getAll()) {%>
                                <div class="row">
                                    <div class="col-xs-12 col-lg-5 col-md-5 col-sm-12">
                                        <img src="LoadHANews?id=<%=n.getId()%>" style="width: 340px;height:200px" class="img-responsive">
                                    </div>
                                    <div class="col-xs-12 col-lg-7 col-md-7 col-sm-12">
                                        <a href="ChiTietNews.jsp?id=<%=n.getId()%>"
                                           style="font-size: 24px;color: #ec5355"><%=n.getTitle()%></a>
                                        <br><br>
                                        <i class="fa fa-clock-o" aria-hidden="true"></i>
                                        <span><%=fmt.format(n.getNgaydang())%></span>
                                        <p><a href="ChiTietNews.jsp?id=<%=n.getId()%>">Xem thêm +</a></p>
                                    </div>
                                </div>
                                <hr>
                                <%}%>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <jsp:include page="Footer.jsp"></jsp:include>
            <p role="button" class="back-to-top" data-toggle="tooltip" data-placement="top" title="Lên đầu trang">
                <img src="asset/Images/1349751884_navigation-up-button_blue.png" alt="" />
            </p>
        </div>
        <script src="asset/JQuery/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8" async defer></script>

        <script src="asset/bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8" async defer></script>
        <script src="asset/Scripts/back-to-top.js" type="text/javascript" charset="utf-8" async defer></script>

    </body>

</html>
