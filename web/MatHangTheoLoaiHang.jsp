<%-- 
    Document   : MatHangTheoLoaiHang
    Created on : Jan 3, 2017, 9:15:35 PM
    Author     : vin
--%>

<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="dao.SanPhamDAO"%>
<%@page import="model.CTLoaiMatHang"%>
<%@page import="model.LoaiSanPham"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.SanPham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            String maloai="";
            int pages = 0, firstResult = 0, maxResult = 0, total = 0;
            if(request.getParameter("maLoai")!=null){
                maloai=request.getParameter("maLoai");
            }
            if (request.getParameter("categoryID") != null) {
                categoryID = (request.getParameter("categoryID"));
                cTLoaiMatHang = cTLoaiMatHangDAO.getCTLoaiMH(Long.parseLong(categoryID));
            }
            if (request.getParameter("pages") != null) {
                pages = Integer.parseInt(request.getParameter("pages"));
            }

            total = sanPhamDAO.countProductByMaLoai(Long.parseLong(maloai));
            if (total <= 16) {
                firstResult = 0;
                maxResult = total;
            } else {
                firstResult = (pages - 1) * 16;
                maxResult = 16;
            }
            ArrayList<SanPham> listsp = sanPhamDAO.getListProductByMaLoai(Long.parseLong(maloai), firstResult, maxResult);
            Locale locale = new Locale("vi", "VN");
            NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
        %>
        <div class="wapper">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="main">
                    <div class="main-menu">
                        <nav class="navbar" data-spy="affix" role="navigation" data-offset-top="197">
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
                                        <a href="MatHangTheoLoaiHang.jsp?maLoai=<%=c.getMaLoai()%>&pages=1" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=c.getTenLoai()%> <span class="caret"></span></a>
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
                <div class="container">

                    <div class="row">
                        <div class="line"></div>                   
                    </div>
                    <div class="row">
                        <ul class="breadcrumb">
                            <li><span class="fa fa-home" style="margin:15px"></span><a href="Home.jsp" class="link">Home</a></li> 
                                    <% LoaiSanPham lsp = loaiSanPhamDAO.getLSPWithMaLoai(Long.parseLong(maloai));%>
                            <li class="active"><%=lsp.getTenLoai()%></li>
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
                                                
                                                Double dongia = sp.getDonGia();
                                            %>
                                            <%=fmt.format(dongia)%>
                                        </h4>

                                        <%} else {%>

                                        <h4 style="color: grey; margin-left: 18px;text-decoration: line-through;margin-top: -1px;float: left;font-size: 15px">
                                            <%
                                                Double dongia = sp.getDonGia();
                                            %>
                                            <%=fmt.format(dongia)%>
                                        </h4> 
                                        <h4 style="color: #ec5355; margin-right: -65px;font-size: 15px;margin-top: -1px;font-weight: 700">
                                            <%
                                         
                                                Double dongia1 = sp.getDonGia();
                                                dongia1 = dongia1 - dongia1 * discount / 100;
                                            %>
                                            <%=fmt.format(dongia1)%>
                                        </h4> 
                                        <%}%>
                                    </div>
                                </a>                                                   
                            </div>
                            <%}%>
                        </div>
                        <%if(total>0){%>
                        <div class="row" align ="right">
                            <ul class="pagination">
                                <li class="disable"><a class="pag" href="CTMatHangTheoLoaiHang.jsp?categoryID=<%=Long.parseLong(categoryID)%>&pages=1">&laquo;</a></li>
                                    <%for (int i = 1; i <= total / 16 + 1; i++) {%>
                                <li><a href="CTMatHangTheoLoaiHang.jsp?categoryID=<%=Long.parseLong(categoryID)%>&pages=<%=i%>"><%=i%></a></li>
                                    <%}%>
                                <li><a href="CTMatHangTheoLoaiHang.jsp?categoryID=<%=Long.parseLong(categoryID)%>&pages=<%=(total / 16) + 1%>" class="pag">&raquo;</a></li>
                            </ul>
                        </div>
                        <%}else{%>
                            
                        <%}%>
                    </div>
                </div>
                <jsp:include page="Footer.jsp"></jsp:include>
                <p role="button" class="back-to-top" data-toggle="tooltip" data-placement="top" title="Lên đầu trang">
                    <img src="asset/Images/1349751884_navigation-up-button_blue.png" alt="" />
                </p>
            </div>
        </div>
        <script src="asset/Scripts/back-to-top.js" type="text/javascript"></script>
    </body>
</html>
