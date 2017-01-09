<%-- 
    Document   : QLNews
    Created on : Dec 17, 2016, 6:17:42 PM
    Author     : kelvi
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.News"%>
<%@page import="dao.NewsDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="dao.HoaDonDAO"%>
<%@page import="dao.DonDatHangDAO"%>
<%@page import="dao.SanPhamDAO"%>
<%@page import="dao.UsersDAO"%>
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
            if (session.getAttribute("userAdmin") != null) {
                nhanVien = (NhanVien) session.getAttribute("userAdmin");
            }
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
            NewsDAO newsDAO = new NewsDAO();
            SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");
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
                        <li>
                            <a href="Admin.jsp">
                                <i class="fa fa-home"></i> <span>Home</span>
                            </a>
                        </li>
                        <li>
                            <a href="DanhMucSP.jsp">
                                <i class="fa fa-list"></i> <span>Danh mục mặt hàng</span>
                            </a>
                        </li>

                        <li>
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
                        <li class="active">
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

                                <li class="active">News</li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
                    <!-- Main row -->
                    <div class="row">
                        <div class="col-md-12">
                            <!--earning graph start-->
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    <span><i class="fa fa-newspaper-o"></i> Tạo mới tin tức</span>
                                </header>
                                <div class="panel-body">
                                    <form method="post" action="NewsServlet" enctype="multipart/form-data">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <lable class="control-label">Tiêu đề</lable>
                                                <input class="form-control" name="tieude" type="text">
                                            </div>
                                            <div class="form-group">
                                                <lable class="control-label">Từ ngày</lable>
                                                <input class="form-control" name="tungay" type="date">
                                            </div>
                                            <div class="form-group">
                                                <lable class="control-label">Đến ngày</lable>
                                                <input class="form-control" name="denngay" type="date">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <lable class="control-label">Hình ảnh</lable>
                                                <input class="form-control" name="hinhanh" type="file">
                                            </div>
                                            <div class="form-group">
                                                <lable class="control-label">Áp dụng</lable>
                                                <textarea class="form-control" name="apdung" type="text"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <lable class="control-label">Nội dung</lable>
                                                <textarea class="form-control" name="noidung" type="text"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <input type="hidden" value="insert" name="command">
                                                <button type="submit" class="btn btn-success">Thêm</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </section>
                            <!--earning graph end-->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!--earning graph start-->
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    <span><i class="fa fa-bars"></i> Danh sách tin tức</span>
                                </header>
                                <div class="panel-body">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Mã</th>
                                                <th>Tiêu đề</th>
                                                <th>Ngày đăng</th>
                                                <th>Từ ngày</th>
                                                <th>Đến ngày</th>
                                                <th>Tùy chọn</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (News n : newsDAO.getAll()) {%>
                                            <tr>
                                                <td><%=n.getId()%></td>
                                                <td><%=n.getTitle()%></td>
                                                <td><%=fmt.format(n.getNgaydang())%></td>
                                                <td><%=fmt.format(n.getTungay())%></td>
                                                <td><%=fmt.format(n.getDenngay())%></td>
                                                <td><a data-toggle="modal" href="#form-update-news"
                                                       data-id="<%=n.getId()%>"
                                                       data-tieude="<%=n.getTitle()%>"
                                                       data-tungay="<%=n.getTungay()%>"
                                                       data-denngay="<%=n.getDenngay()%>"
                                                       data-apdung="<%=n.getAdcho()%>"
                                                       data-noidung="<%=n.getNoidung()%>">Sửa</a> || 
                                                    <a href="NewsServlet?ID=<%=n.getId()%>">Xóa</a></td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </section>
                            <!--earning graph end-->

                        </div>

                    </div>
                    <div class="modal fade" id="form-update-news">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Chỉnh sửa tin tức</h4>
                                </div>
                                <form method="post" action="NewsServlet"  class="form-horizontal">
                                    <div class="modal-body">

                                        <fieldset class="form-group">
                                            <lable class="col-sm-3 control-label">ID</lable>
                                            <div class="col-sm-9">
                                                <input readonly="" class="form-control" name="id" type="text"
                                                       id="input-id">
                                            </div>
                                        </fieldset>
                                        <fieldset class="form-group">
                                            <lable class="col-sm-3 control-label">Tiêu đề</lable>
                                            <div class="col-md-9">
                                                <input class="form-control" name="tieude" type="text"
                                                   id="input-tieude">
                                            </div>
                                        </fieldset>
                                        <fieldset class="form-group">
                                            <lable class="col-md-3 control-label">Từ ngày</lable>
                                            <div class="col-md-9">
                                                <input class="form-control" name="tungay" type="date"
                                                   id="input-tungay">
                                            </div>
                                        </fieldset>
                                        <fieldset class="form-group">
                                            <lable class="col-md-3 control-label" >Đến ngày</lable>
                                            <div class="col-md-9">
                                                <input class="form-control" name="denngay" type="date"
                                                   id="input-denngay">
                                            </div>
                                        </fieldset>
                                        <fieldset class="form-group">
                                            <lable class="col-md-3 control-label">Áp dụng</lable>
                                            <div class="col-md-9">
                                                <textarea class="form-control" name="apdung" type="text"
                                                      id="input-apdung"></textarea>
                                            </div>
                                        </fieldset>
                                        <fieldset class="form-group">
                                            <lable class="col-md-3 control-label">Nội dung</lable>
                                            <div class="col-md-9">
                                                 <textarea class="form-control" name="noidung" type="text"
                                                      id="input-noidung"></textarea>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="hidden" value="update" name="command">
                                        <button type="submit" class="btn btn-primary btn-sm">Lưu
                                        </button>
                                        <button type="button" class="btn btn-default btn-sm"
                                                data-dismiss="modal">Close</button>

                                    </div>
                                </form>

                            </div>
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
        <script>
            $('#form-update-news').on('show.bs.modal', function (event) {
                var a = $(event.relatedTarget); // Button that triggered the modal
                var id = a.data('id'); // Extract info from data-* attributes
                var tieude = a.data('tieude'); // Extract info from data-* attributes
                var tungay = a.data('tungay');
                var denngay = a.data('denngay');
                var apdung = a.data('apdung');
                var noidung = a.data('noidung');

                $('#input-id').val(id);
                $('#input-tieude').val(tieude);
                $('#input-tungay').val(tungay);
                $('#input-denngay').val(denngay);
                $('#input-apdung').val(apdung);
                $('#input-noidung').val(noidung);
            });
        </script>
    </body>
</html>
