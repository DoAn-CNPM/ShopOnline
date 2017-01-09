<%-- 
    Document   : Home
    Created on : Nov 7, 2016, 8:56:19 PM
    Author     : Kelvin
--%>

<%@page import="dao.KhuyenMaiDAO"%>
<%@page import="model.KhuyenMai"%>
<%@page import="dao.CTKhuyenMaiDAO"%>
<%@page import="model.CTKhuyenMai"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
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
            String categoryID = "";
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            if (request.getParameter("categoryID") != null) {
                categoryID = request.getParameter("categoryID");
            }
            Locale locale = new Locale("vi", "VN");
            NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
            CTKhuyenMaiDAO cTKhuyenMaiDAO = new CTKhuyenMaiDAO();
            KhuyenMai km = new KhuyenMai();
            KhuyenMaiDAO khuyenMaiDAO = new KhuyenMaiDAO();
            ArrayList<CTKhuyenMai> list1 = cTKhuyenMaiDAO.getlistCTKMNgayBD();
            ArrayList<CTKhuyenMai> list2 = cTKhuyenMaiDAO.getlistCTKMNgayKT();
            if (list1.size() > 0) {
                for (CTKhuyenMai ct1 : list1) {
                    km = khuyenMaiDAO.getWithMaKM(ct1.getMaKM());
                    sanPhamDAO.updateDiscount(ct1.getMaMH(), km.getLoai());
                }
            }
            if (list2.size() > 0) {
                for (CTKhuyenMai ct2 : list2) {
                    sanPhamDAO.updateDiscount0(ct2.getMaMH());
                    cTKhuyenMaiDAO.delete(ct2.getMaKM(), ct2.getMaMH());
                }
            }
   
        %>
        <div class=wapper>
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="main">
                    
                <div class="main-content">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-top: -20px">
                        <!-- Indicators -->
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <a href="News.jsp"><img src="asset/Images/sb_1475206169_770.jpg" alt=""/></a>
                                <div class="carousel-caption">

                                </div>
                            </div>
                            <div class="item">
                                <% Long maloai=loaiSanPhamDAO.getMaLoaiMHAoKhoac();%>
                                <a href="MatHangTheoLoaiHang.jsp?maLoai=<%=maloai%>&pages=1"><img src="asset/Images/sb_1479719693_809.jpg" alt=""/></a>
                                <div class="carousel-caption">

                                </div>
                            </div>
                            <div class="item">
                                <% Long maloai1=loaiSanPhamDAO.getMaLoaiMHDoNu();%>
                                <a href="MatHangTheoLoaiHang.jsp?maLoai=<%=maloai1%>&pages=1"><img src="asset/Images/sb_1479719744_70.jpg" alt=""/></a>
                                <div class="carousel-caption">

                                </div>
                            </div>
                            <div class="item">
                                <a href="ChiTietNews.jsp?id=1481986694293"><img src="asset/Images/sb_1480403139_38.jpg" alt=""/></a>
                                <div class="carousel-caption">

                                </div>
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                </div>
                <div class="product-selling">
                    <h3><a href="SanPhamNoiBat.jsp?pages=1">Sản phẩm nổi bật <span >/ Sản phẩm bán chạy</span></a></h3>
                    <div class="container">
                        <div class="row">
                            <%for (SanPham sp : sanPhamDAO.getListSPNB1()) {%>
                            <div class="col-md-2" id="hovergallery1">
                                <a href="ChiTietMatHang.jsp?productID=<%=sp.getMaMH()%>" class="thumbnail" style="width: 160px">
                                    <img src="LoadHinhAnh?mamh=<%=sp.getMaMH()%>" alt="" style="height: 170px;width: 150px;margin-top: 20px">
                                    <div class="caption-nb">
                                        <h4 style="font-size: 18px;text-align: center;"><%=sp.getTenMH()%></h4>
                                        <%
                                            int discount = sp.getDiscount();
                                            if (discount == 0) {
                                        %>
                                        <h4 style="color: #ec5355;margin-top: -1px;font-size: 15px;font-weight: 700;text-align: center;">
                                            <%
                                                Double dongia = sp.getDonGia();
                                            %>
                                            <%=fmt.format(dongia)%>
                                        </h4>

                                        <%} else {%>

                                        <h4 style="color: grey;text-decoration: line-through;margin-top: -1px;float: left;font-size: 15px">
                                            <%
                                             
                                                Double dongia = sp.getDonGia();
                                            %>
                                            <%=fmt.format(dongia)%>
                                        </h4> 
                                        <h4 style="color: #ec5355;font-size: 15px;margin-top: -1px;font-weight: 700;margin-left: 85px">
                                            <%
                                                Locale locale1 = new Locale("vi", "VN");
                                                NumberFormat fmt1 = NumberFormat.getCurrencyInstance(locale1);
                                                Double dongia1 = sp.getDonGia();
                                                dongia1 = dongia1 - dongia1 * discount / 100;
                                            %>
                                            <%=fmt1.format(dongia1)%>
                                        </h4> 
                                        <%}%>
                                    </div>
                                </a>

                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
                <div class="producttabs-slider">
                    <div class="container">
                        <div class="row"><br></div>
                        <div class="row" id="hovergallery1">
                            <div class="col-lg-5 col-md-5 col-sm-12">
                                <div id="hb1">
                                    <div class="hb1_image">
                                        <a href="SanPhamMoi.jsp" class="btnDesktop">
                                            <img src="asset/Images/699c35ad-ede5-0100-1d87-0012f92e916f.jpg" alt="" class="img-responsive"/></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-12">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <div id="hb2">
                                        <div class="hb2_image" >
                                            <%Long maloai2 = loaiSanPhamDAO.getMaLoaiMHDoNu();%>
                                            <a href="MatHangTheoLoaiHang.jsp?maLoai=<%=maloai2%>&pages=1">
                                                <img src="asset/Images/sb_1480584850_312.jpg" alt="" class="img-responsive"/></a>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div id="hb3">
                                            <div class="hb3_image">
                                                <%Long maloaiMH2 = cTLoaiMatHangDAO.getMaLoaiMHGiayNam();%>
                                                <a href="CTMatHangTheoLoaiHang.jsp?categoryID=<%=maloaiMH2%>&pages=1">
                                                    <img src="asset/Images/sb_1477291487_43.png" alt="" class="img-responsive"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div id="hb3">
                                            <div class="hb3_image">
                                                <%Long maloaiMH3 = cTLoaiMatHangDAO.getMaLoaiMHGiayNu();%>
                                                <a href="CTMatHangTheoLoaiHang.jsp?categoryID=<%=maloaiMH3%>&pages=1">
                                                    <img src="asset/Images/sb_1477291533_457.png" alt="" class="img-responsive"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
