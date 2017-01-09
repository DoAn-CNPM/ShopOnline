<%-- 
    Document   : SanPham
    Created on : Dec 12, 2016, 10:49:20 PM
    Author     : kelvi
--%>

<%@page import="model.LoaiSanPham"%>
<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="model.SanPham"%>
<%@page import="model.CTLoaiMatHang"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
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

            UsersDAO usersDAO = new UsersDAO();
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
            LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();

            String maLoaiMH = "";
            if (request.getParameter("MaLoaiMH") != null) {
                maLoaiMH = request.getParameter("MaLoaiMH");
            }
            CTLoaiMatHang cTLoaiMatHang = cTLoaiMatHangDAO.getCTLoaiMH(Long.parseLong(maLoaiMH));
            LoaiSanPham loaiSanPham = loaiSanPhamDAO.getLSPWithMaLoai(cTLoaiMatHang.getMaLoai());
            SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
            Locale locale = new Locale("vi", "VN");
            NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
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
                        <li class="active">
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
                                <li  class="active">Quản lý sản phẩm</li>
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
                                    <span><i class="fa fa-product-hunt"></i> Thêm mặt hàng
                                </header>
                                <div class="panel-body">
                                    <div class="row">
                                        <form method="post" action="SanPham" enctype="multipart/form-data">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="" class="control-label">Loại mặt hàng</label>
                                                    <select class="form-control" name="maloaimh">

                                                        <%for (CTLoaiMatHang ct : cTLoaiMatHangDAO.getAll()) {
                                                                LoaiSanPham lsp = loaiSanPhamDAO.getLSPWithMaLoai(ct.getMaLoai());
                                                        %>
                                                        <option value="<%=ct.getMaLoaiMH()%>">
                                                            <%=ct.getTenLoaiMH()%> - <%=lsp.getTenLoai()%>
                                                        </option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Tên mặt hàng</label>
                                                    <input type="text" class="form-control" name="tenmh" required="">
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Mô tả</label>
                                                    <textarea class="form-control" name="mota"></textarea>
                                                </div>


                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">Hình ảnh</label>
                                                    <input type="file" class="form-control" name="hinhanh" required="">
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Số lượng</label>
                                                    <input class="form-control" name="soluong" required="" type="number">
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Đơn giá</label>
                                                    <input class="form-control" name="dongia" required="" type="number">
                                                </div> 
                                                <button type="submit" class="btn btn-success">Thêm</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </section>
                            <!--earning graph end-->
                            <div class="modal fade" id="form-insert-ctmh">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">&times;</button>
                                            <h4 class="modal-title">Thêm chi tiết mặt hàng</h4>
                                        </div>
                                        <form action="ThemCTMatHang" method="POST"
                                              role="form">
                                            <div class="modal-body">

                                                <fieldset class="form-group">
                                                    <label for="input-tenlmh" class="col-sm-4">Màu sắc</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="mausac"
                                                               class="form-control input-sm" value="" required="">
                                                    </div>
                                                </fieldset>
                                                <fieldset class="form-group">
                                                    <label for="input-tenlmh" class="col-sm-4">Size</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="size"
                                                               class="form-control input-sm" value="" required="">
                                                    </div>
                                                </fieldset>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="hidden" value="insert" name="command"> 
                                                <input type="hidden" id="input-mamh" name="mamh">
                                                <button type="submit" class="btn btn-primary btn-sm">Lưu
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm"
                                                        data-dismiss="modal">Đóng</button>

                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!--earning graph start-->
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    <span><i class="fa fa-rub"></i> Loại sản phẩm: <%=loaiSanPham.getTenLoai()%> - <%=cTLoaiMatHang.getTenLoaiMH()%>
                                </header>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <form method="post" action="LayML">
                                                <div class="form-group">
                                                    <label for="" class="control-label">Chọn loại mặt hàng</label>
                                                    <select class="form-control" name="maloaimh">

                                                        <%for (CTLoaiMatHang ct : cTLoaiMatHangDAO.getAll()) {
                                                                LoaiSanPham lsp = loaiSanPhamDAO.getLSPWithMaLoai(ct.getMaLoai());
                                                        %>
                                                        <option value="<%=ct.getMaLoaiMH()%>">
                                                            <%=ct.getTenLoaiMH()%> - <%=lsp.getTenLoai()%>
                                                        </option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                                <input name="command" type="hidden" value="SP">
                                                <button type="submit" class="btn btn-success">Tìm kiếm</button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="table-responsive">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Mã</th>
                                                        <th>Tên MH</th>
                                                        <th>Số lượng</th>
                                                        <th>Hình ảnh</th>
                                                        <th>Tùy chọn</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        for (SanPham sp : sanPhamDAO.getlistSpWithMaLoai(Long.parseLong(maLoaiMH))) {%>
                                                    <tr>
                                                        <td><%=sp.getMaMH()%></td>
                                                        <td><%=sp.getTenMH()%></td>
                                                        <td><%=sp.getSoLuong()%></td>
                                                        <td><img src="LoadHinhAnh?mamh=<%=sp.getMaMH()%>" style="width: 100px;height: 100px"></td>
                                                        <td><a data-toggle="modal" href="#form-insert-ctmh"
                                                               data-mamh="<%=sp.getMaMH()%>">Thêm chi tiết</a>
                                                            || <a data-toggle="modal" href="#form-update-mh"
                                                                  data-mamh="<%=sp.getMaMH()%>"
                                                                  data-tenmh="<%=sp.getTenMH()%>"
                                                                  data-mota="<%=sp.getMoTa()%>"
                                                                  data-soluong="<%=sp.getSoLuong()%>"
                                                                  data-dongia="<%=sp.getDonGia()%>"
                                                                  >Sửa</a> || <a href="CTSanPham.jsp?MaMH=<%=sp.getMaMH()%>">Chi tiết</a>
                                                                  || <a href="SanPham?MaMH=<%=sp.getMaMH()%>&MaLoaiMH=<%=sp.getMaLoaiMH()%>"
                                                                        onclick="return confirm('Bạn có chắc chắn muốn xóa ?')">Xóa</a></td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <!--earning graph end-->
                        </div>
                        <div class="modal fade" id="form-update-mh">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Chỉnh sửa mặt hàng</h4>
                                    </div>
                                    <form action="UpdateSanPham" method="POST"
                                          role="form">
                                        <div class="modal-body">
                                            <fieldset class="form-group">
                                                <label for="input-tenlmh" class="col-sm-4">Mã mặt hàng</label>
                                                <div class="col-sm-6">
                                                    <input readonly type="text" name="mamh"
                                                           class="form-control input-sm" id="input-mamh1" required="">
                                                </div>
                                            </fieldset>
                                            <fieldset class="form-group">
                                                <label for="input-tenlmh" class="col-sm-4">Tên mặt hàng</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="tenmh"
                                                           class="form-control input-sm" id="input-tenmh" required="">
                                                </div>
                                            </fieldset>
                                            <fieldset class="form-group">
                                                <label for="input-tenlmh" class="col-sm-4">Mô tả</label>
                                                <div class="col-sm-6">
                                                    <textarea type="text" name="mota"
                                                              class="form-control input-sm" id="input-mota" required=""></textarea>
                                                </div>
                                            </fieldset>
                                            <fieldset class="form-group">
                                                <label for="input-tenlmh" class="col-sm-4">Số lượng</label>
                                                <div class="col-sm-6">
                                                    <input type="number" name="soluong"
                                                           class="form-control input-sm" id="input-soluong" required="">
                                                </div>
                                            </fieldset>
                                            <fieldset class="form-group">
                                                <label for="input-tenlmh" class="col-sm-4">Đơn giá</label>
                                                <div class="col-sm-6">
                                                    <input type="number" name="dongia"
                                                           class="form-control input-sm" id="input-dongia" required="" step="10000">
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="hidden" value="<%=maLoaiMH%>" name="maloaimh">
                                            <button type="submit" class="btn btn-primary btn-sm">Lưu
                                            </button>
                                            <button type="button" class="btn btn-default btn-sm"
                                                    data-dismiss="modal">Đóng</button>

                                        </div>
                                    </form>
                                </div>
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
            $('#form-insert-ctmh').on('show.bs.modal', function (event) {
                var a = $(event.relatedTarget); // Button that triggered the modal
                var mamh = a.data('mamh'); // Extract info from data-* attributes

                $('#input-mamh').val(mamh);
            });
        </script>
        <script>
            $('#form-update-mh').on('show.bs.modal', function (event) {
                var a = $(event.relatedTarget); // Button that triggered the modal
                var mamh = a.data('mamh'); // Extract info from data-* attributes
                var tenmh = a.data('tenmh');
                var mota = a.data('mota');
                var soluong = a.data('soluong');
                var dongia = a.data('dongia');

                $('#input-mamh1').val(mamh);
                $('#input-tenmh').val(tenmh);
                $('#input-mota').val(mota);
                $('#input-soluong').val(soluong);
                $('#input-dongia').val(dongia);
            });
        </script>

    </body>
</html>