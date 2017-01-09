<%-- 
    Document   : ThongKe
    Created on : Dec 18, 2016, 12:03:25 PM
    Author     : kelvi
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="model.HoaDon"%>
<%@page import="dao.DonDatHangDAO"%>
<%@page import="dao.HoaDonDAO"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="model.NhanVien"%>
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
            if (session.getAttribute("userNV") != null) {
                nhanVien = (NhanVien) session.getAttribute("userNV");
            }
            DonDatHangDAO donDatHangDAO = new DonDatHangDAO();
            HoaDonDAO hoaDonDAO = new HoaDonDAO();
            String from = "";
            String to = "";
            Calendar cal = Calendar.getInstance();
            int month = cal.get(Calendar.MONTH);
            int year = cal.get(Calendar.YEAR);
            if (session.getAttribute("from") == null) {
                from = "" + year + "-0" + (month + 1) + "-01";
            } else {
                from = session.getAttribute("from").toString();
            }
            if (session.getAttribute("to") == null) {
                to = "" + year + "-0" + (month + 1) + "-30";
            } else {
                to = session.getAttribute("to").toString();
            }
            SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy");
            Locale locale = new Locale("vi", "VN");
            NumberFormat fmr = NumberFormat.getCurrencyInstance(locale);
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
                        <li>
                            <a href="NhanVien.jsp">
                                <i class="fa fa-home"></i> <span>Home</span>
                            </a>
                        </li>
                        <li>
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
                        <li class="active">
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

                                    <li><a href="NhanVien.jsp">Nhân viên</a></li>
                                    <li class="active">Thống kê</li>
                                </ul>
                                <!--breadcrumbs end -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">

                                <!--earning graph start-->
                                <section class="panel panel-info">
                                    <header class="panel-heading">
                                        <span><i class="fa fa-list-ol"></i> Danh sách hóa đơn</span>
                                    </header>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <form action="Thongke" method="post" class="form-horizontal">
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Từ ngày</label>
                                                        <div class="col-sm-9">
                                                            <input class="form-control" name="from" type="date">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Đến ngày</label>
                                                        <div class="col-sm-9">
                                                            <input class="form-control" name="to" type="date">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-3 col-sm-9">
                                                            <button type="submit" class="btn btn-default">Thống kê</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="label label-primary" style="font-size: 15px">Từ ngày <%=from%> 
                                                đến ngày <%=to%></label><br><br>
                                            <table class="table table-hover table-responsive">
                                                <thead>
                                                    <tr>
                                                        <th>Mã HD</th>
                                                        <th>Mã ĐĐH</th>
                                                        <th>Tổng tiền</th>
                                                        <th>Ngày thanh toán</th>
                                                        <th>Nhân viên</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        int count = 0;
                                                        for (HoaDon hd : hoaDonDAO.getlistMonth(Date.valueOf(from), Date.valueOf(to))) {
                                                            count++;
                                                    %>
                                                    <tr>
                                                        <td><%=hd.getMaHD()%></td>
                                                        <td><%=hd.getMaDDH()%></td>
                                                        <td><%=fmr.format(hd.getTongTien())%></td>
                                                        <td><%=fmt.format(hd.getNgayTT())%></td>
                                                        <td><%=hd.getMaNV()%></td>
                                                    </tr>

                                                    <%}%>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td><strong>Tổng cộng: <%=count%></strong></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </section>
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
