<%-- 
    Document   : DanhMucSP
    Created on : Nov 30, 2016, 12:18:44 PM
    Author     : kelvi
--%>

<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="dao.HoaDonDAO"%>
<%@page import="dao.SanPhamDAO"%>
<%@page import="dao.UsersDAO"%>
<%@page import="model.NhanVien"%>
<%@page import="dao.DonDatHangDAO"%>
<%@page import="model.DonDatHang"%>
<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="model.LoaiSanPham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User | Nhân Viên</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="asset/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="asset/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="asset/css/style_2.css" rel="stylesheet" type="text/css"/>

    </head>
    <body class="skin-black">
        <%
            NhanVien nhanVien = null;
            if (session.getAttribute("userNV") != null) {
                nhanVien = (NhanVien) session.getAttribute("userNV");
            }

            UsersDAO usersDAO = new UsersDAO();
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            DonDatHangDAO donDatHangDAO = new DonDatHangDAO();
            HoaDonDAO hoaDonDAO = new HoaDonDAO();
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
            DonDatHangDAO ddhDAO = new DonDatHangDAO();
        %>
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="NhanVien.jsp" class="logo">
                Nhân viên
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
                                <span><%=nhanVien.getHoTen()%> <i class="caret"></i></span>
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
                            <p>Hello, <span><%=nhanVien.getHoTen()%></span></p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li>
                            <a href="NhanVien.jsp">
                                <i class="fa fa-home"></i> <span>Home</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="DonDatHang.jsp">
                                <i class="fa fa-paper-plane" aria-hidden="true"></i> <span>Đơn đặt hàng</span>
                            </a>
                        </li>
                        <li>
                            <a href="DonDatHangDD.jsp">
                                <i class="fa fa-paper-plane" aria-hidden="true"></i> <span>Đơn đặt hàng đã duyệt</span>
                            </a>
                        </li>
                        <li>
                            <a href="HoaDon.jsp">
                                <i class="fa fa-money" aria-hidden="true"></i> <span>Hóa đơn</span>
                            </a>
                        </li>
                        <li>
                            <a href="ThongKe.jsp">
                                <i class="fa fa-area-chart" aria-hidden="true"></i> <span>Thống kê</span>
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

                                <li class="active">Đơn đặt hàng</li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-12">
                            <!--earning graph start-->
                            <section class="panel panel-info">

                                <header class="panel-heading">
                                    <span><i class="fa fa-bars"></i> Quản lý Đơn đặt hàng</span>
                                </header>
                                <div class="panel-body">
                                    <div class="line"></div>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Mã ĐĐH</th>
                                                <th>Tên KH</th>
                                                <th>Địa chỉ</th>
                                                <th>Email</th>
                                                <th>SDT</th>
                                                <th>Tùy chọn</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int count = 0;
                                                for (DonDatHang ds : ddhDAO.getDDHnotHD()) {
                                                    count++;
                                            %>
                                            <tr>
                                                <td><%=count%></td>
                                                <td><%= ds.getMaDDH()%></td>
                                                <td><%=ds.getTenKH()%></td>
                                                <td><%=ds.getDiaChi()%></td>
                                                <td><%=ds.getEmail()%></td>
                                                <td><%=ds.getSoDT()%></td>
                                                <td>
                                                    <a href="LapHoaDon?manv=<%=nhanVien.getMaNV()%>&maddh=<%=ds.getMaDDH()%>"
                                                       onclick="return confirm('Bạn có chắc chắn muốn lập hóa đơn ?')">Lập hóa đơn</a> ||
                                                    <a href="ChiTietDDH.jsp?maDDH=<%=ds.getMaDDH()%>">Chi tiết</a> || 
                                                    <a href="XoaHoaDon?MaDDH=<%=ds.getMaDDH()%>" 
                                                       onclick="return confirm('Bạn có chắc chắn muốn xóa hóa đơn này ?')">Xóa</a>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </section>
                            <!--earning graph end-->
                        </div>
                    </div>
                </section><!-- /.content -->
                <div class="footer-main">
                    Copyright &copy <a href="https://www.youtube.com/channel/UCNCwjpjfEIBzc-ZCKz1MiXw"
                                       target="_blank">1996s</a>, 2016
                </div>
            </aside><!-- /.right-side -->

        </div><!-- ./wrapper -->
        <script src="asset/JQuery/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="asset/JQuery/angular.min.js" type="text/javascript"></script>
        <script src="asset/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="asset/Scripts/app.js" type="text/javascript"></script>
    </body>
</html>
