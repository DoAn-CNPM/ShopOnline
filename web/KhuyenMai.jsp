<%-- 
    Document   : KhuyenMai
    Created on : Dec 1, 2016, 8:42:50 AM
    Author     : kelvi
--%>

<%@page import="model.KhuyenMai"%>
<%@page import="dao.KhuyenMaiDAO"%>
<%@page import="dao.CTDonDatHangDAO"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="model.CTLoaiMatHang"%>
<%@page import="dao.SanPhamDAO"%>
<%@page import="model.SanPham"%>
<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="model.LoaiSanPham"%>
<%@page import="model.NhanVien"%>
<%@page import="dao.UsersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin | Người quản trị</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="asset/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="asset/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="asset/css/style_2.css" rel="stylesheet" type="text/css"/>

    </head>
    <body class="skin-black">
        <%
            NhanVien nhanVien = null;
            if (session.getAttribute("userAdmin") != null) {
                nhanVien = (NhanVien) session.getAttribute("userAdmin");
            }
            LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            String maloai = request.getParameter("MaLoai");
        %>
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="Admin.jsp" class="logo">
                Admin
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">

                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i>
                                <% if (nhanVien != null) {%>
                                <span><%=nhanVien.getHoTen()%> <i class="caret"></i></span>
                                    <%}%>
                            </a>
                            <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                <li>
                                    <a href="Profile.jsp?MaNV=<%=nhanVien.getMaNV()%>">
                                        <i class="fa fa-user fa-fw pull-right"></i>
                                        Thông tin cá nhân
                                    </a>
                                    <a data-toggle="modal" href="#form-dmk">
                                        <i class="fa fa-cog fa-fw pull-right"></i>
                                        Đổi mật khẩu
                                    </a>

                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="Logout"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">

                        <div class="pull-left info">
                            <% if (nhanVien != null) {%>
                            <p>Hello, <%=nhanVien.getHoTen()%></p>
                            <%}%>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li >
                            <a href="Admin.jsp">
                                <i class="fa fa-home"></i> <span>Home</span>
                            </a>
                        </li>
                        <li>
                            <a href="DanhMucSP.jsp">
                                <i class="fa fa-list"></i> <span>Danh mục mặt hàng</span>
                            </a>
                        </li>

                        <li class="active">
                            <a href="KhuyenMai.jsp?MaLoai=1">
                                <i class="fa fa-foursquare"></i> <span>Khuyến mãi</span>
                            </a>
                        </li>

                        <li>
                            <a href="QLNguoiDung.jsp">
                                <i class="fa fa-user"></i> <span>Quản lý người dùng</span>
                            </a>
                        </li>
                        <li>
                            <%Long maloaimh = cTLoaiMatHangDAO.randomMaLoaiMH();%>
                            <a href="SanPham.jsp?MaLoaiMH=<%=maloaimh%>">
                                <i class="fa fa-user"></i> <span>Quản lý sản phẩm</span>
                            </a>
                        </li>
                        <li>
                            <a href="QLNews.jsp">
                                <i class="fa fa-newspaper-o" aria-hidden="true"></i><span>Tin tức</span>
                            </a>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>
            <jsp:include page="DoiMatKhau.jsp"></jsp:include>
            <aside class="right-side">

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <!--breadcrumbs start -->
                            <ul class="breadcrumb">
                                <li><a href="Home.jsp"><i class="fa fa-home"></i> Trang chủ</a></li>

                                <li><a href="Admin.jsp">Admin</a></li>
                                <li class="active">Khuyến mãi</li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:5px;">

                    </div>
                    <!-- Main row -->

                    <div class="row">
                        <div class="col-md-6">
                            <!--earning graph start-->
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    <span><i class="fa fa-hourglass-start"></i> Khuyến mãi</span>  
                                </header>
                                <div class="panel-body">
                                    <div class="line"></div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <a href="DSKhuyenMai.jsp" type="button" class="btn btn-primary">DS Khuyến mãi
                                            </a>
                                            <br><br>
                                            <form action="KhuyenMai" method="POST" class="form-horizontal"
                                                  role="form">
                                                <div class="form-group">
                                                    <label for="input-tenlmh" class="col-sm-4">Tên khuyến mãi</label>
                                                    <div class="col-sm-8">
                                                        <input type="text" name="tenkm" id="input-tenlmh"
                                                               class="form-control input-sm" value="" required="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="input-tenlmh" class="col-sm-4">Từ ngày</label>
                                                    <div class="col-sm-8">
                                                        <input type="date" name="from" class="form-control input-sm" required="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="input-tenlmh" class="col-sm-4">Đến ngày</label>
                                                    <div class="col-sm-8">
                                                        <input type="date" name="to" class="form-control input-sm" required="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="input-tenlmh" class="col-sm-4">Trên mặt hàng</label>
                                                    <div class="col-sm-8">
                                                        <input type="text" name="mamh" class="form-control input-sm" required="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="input-tenlmh" class="col-sm-4">Loại khuyến mãi</label>
                                                    <div class="col-sm-8">
                                                        <select class="form-control" name="loaiKM">
                                                            <option value="">Chọn</option>
                                                            <option value="10">
                                                                10%
                                                            </option>
                                                            <option value="20">
                                                                20%
                                                            </option>
                                                            <option value="30">
                                                                30%
                                                            </option>
                                                            <option value="40">
                                                                40%
                                                            </option>
                                                            <option value="50">
                                                                50%
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-sm-offset-4 col-xs-8">
                                                        <input type="hidden" value="insert" name="command">
                                                        <button type="submit" class="btn btn-success btn-sm">Thêm
                                                        </button>

                                                    </div>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class="col-md-6">
                            <!--earning graph start-->
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    <span><i class="fa fa-search-plus"></i> Tìm kiếm mặt hàng</span>  
                                </header>
                                <div class="panel-body">
                                    <div class="line"></div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <form method="post" action="LayML">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Chọn loại mặt hàng</label>
                                                    <select class="form-control" name="maLSP">
                                                        <%for (LoaiSanPham c : loaiSanPhamDAO.getListLoaiSP()) {%>
                                                        <option value="<%=c.getMaLoai()%>"><%=c.getTenLoai()%></option>

                                                        <%}%>
                                                    </select>
                                                </div>
                                                <input name="command" type="hidden" value="KM">
                                                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                                            </form>
                                        </div>

                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <td>
                                                            Mã mặt hàng
                                                        </td>
                                                        <td>
                                                            Tên mặt hàng
                                                        </td>
                                                        <td>Số lượng đặt mua</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        CTDonDatHangDAO ctddhdao = new CTDonDatHangDAO();
                                                        int sl = 0;
                                                        for (SanPham sp : sanPhamDAO.getWithMaLoai(Long.parseLong(maloai))) {
                                                            sl = ctddhdao.getSLMuatheoMAMH(sp.getMaMH());
                                                    %>
                                                    <tr>
                                                        <td>
                                                            <%=sp.getMaMH()%>
                                                        </td>
                                                        <td>
                                                            <%=sp.getTenMH()%>
                                                        </td>
                                                        <td>
                                                            <%=sl%>
                                                        </td>
                                                    </tr>

                                                    <%}%>
                                                </tbody>
                                            </table>  
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                </section><!-- /.content -->
                <div class="modal fade" id="form-dskm">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                <h3>Danh sách khuyến mãi</h3>
                            </div>

                            <div class="modal-body">

                            </div>
                        </div>
                    </div>
                    <div class="footer-main">
                    Copyright &copy <a href="https://www.youtube.com/channel/UCNCwjpjfEIBzc-ZCKz1MiXw"
                                       target="_blank">1996s</a>, 2016
                </div>
                </div>
            </aside><!-- /.right-side -->

        </div><!-- ./wrapper -->
        <script src="asset/JQuery/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="asset/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="asset/Scripts/app.js" type="text/javascript"></script>
    </body>
</html>
