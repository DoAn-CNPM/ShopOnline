<%-- 
    Document   : SanPhamNoiBat
    Created on : Dec 11, 2016, 12:09:22 PM
    Author     : kelvi
--%>

<%@page import="model.LoaiSanPham"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CTLoaiMatHang"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="dao.SanPhamDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Nổi bật - 1996s.vn</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="name" content="content" charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="asset/css/style.css">

        <link href="https://fonts.googleapis.com/css?family=Taviraj" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="asset/font-awesome-4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
            CTLoaiMatHang cTLoaiMatHang = new CTLoaiMatHang();
            String categoryID = "";
            int pages = 0, firstResult = 0, maxResult = 0, total = 0;

            if (request.getParameter("pages") != null) {
                pages = Integer.parseInt(request.getParameter("pages"));
            }

            total = sanPhamDAO.countProductNB();
            if (total <= 12) {
                firstResult = 0;
                maxResult = total;
            } else {
                firstResult = (pages - 1) * 12;
                maxResult = 12;
            }
            ArrayList<SanPham> listsp = sanPhamDAO.getListSPNB2(firstResult, maxResult);
            Locale locale = new Locale("vi", "VN");
            NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
        %>
        <div class="wapper">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="main">
                    <div class="container">
                        <div class="row">
                            <div class="line"></div>                   
                        </div>
                        <div class="row">
                            <ul class="breadcrumb">
                                <li><span class="fa fa-home" style="margin:15px"></span><a href="Home.jsp" class="link">Home</a></li>                                             
                                <li class="active">Nổi bật</li> 
                            </ul>
                            <div class="row">
                            <%for (SanPham sp : listsp) {%>
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

                        <div class="row" align ="right">
                            <%if(total>0){%>
                            <ul class="pagination" >
                                <li class="disable"><a class="pag" href="SanPhamMoi.jsp?pages=1">&laquo;</a></li>
                                    <%for (int i = 1; i <= total / 12 + 1; i++) {%>
                                <li><a href="SanPhamMoi.jsp?pages=<%=i%>"><%=i%></a></li>
                                    <%}%>
                                <li><a href="SanPhamMoi.jsp?pages=<%=(total / 12) + 1%>" class="pag">&raquo;</a></li>
                            </ul>
                            <%}else{%>
                            <%}%>
                        </div>
                    </div>
                </div>
                <jsp:include page="Footer.jsp"></jsp:include>
                <p role="button" class="back-to-top" data-toggle="tooltip" data-placement="top" title="Lên đầu trang">
                    <img src="asset/Images/1349751884_navigation-up-button_blue.png" alt="" />
                </p>

            </div>
        </div>
        <script src="asset/Scripts/back-to-top.js" type="text/javascript" charset="utf-8" async defer></script>
    </body>
</html>
