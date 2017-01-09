<%-- 
    Document   : CTSanPham
    Created on : Dec 15, 2016, 2:33:33 PM
    Author     : kelvi
--%>

<%@page import="model.SanPham"%>
<%@page import="dao.CTHinhAnhDAO"%>
<%@page import="model.CTHinhAnh"%>
<%@page import="dao.CTMatHangDAO"%>
<%@page import="model.CTSanPham"%>
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
            CTMatHangDAO cTMatHangDAO = new CTMatHangDAO();
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            SanPham sp = new SanPham();
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
            CTHinhAnhDAO cTHinhAnhDAO = new CTHinhAnhDAO();
            Long mamh = sanPhamDAO.randomMaMH();
            if (request.getParameter("MaMH") != null) {
                mamh = Long.parseLong(request.getParameter("MaMH"));
                sp = sanPhamDAO.getSanPham(mamh);
            }
            session.setAttribute("mamh", mamh);
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
                        <li>
                            <a href="QLNews.jsp">
                                <i class="fa fa-newspaper-o" aria-hidden="true"></i><span>Tin tức</span>
                            </a>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>
            <div class="modal fade" id="form-dmk">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Đổi mật khẩu</h4>
                        </div>
                        <form method="post" action="Doimatkhau">
                            <div class="modal-body">

                                <div class="form-group">
                                    <lable>Mật khẩu cũ:</lable>
                                    <input class="form-control" name="matkhaucu" type="pass">
                                </div>
                                <div class="form-group">
                                    <lable>Mật khẩu mới:</lable>
                                    <input class="form-control" name="matkhaumoi" type="pass">
                                </div>
                                <div class="form-group">
                                    <lable>Xác nhận:</lable>
                                    <input class="form-control" name="xacnhan" type="pass">
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="hidden" value="<%=nhanVien.getMaNV()%>" name="manv">
                                <button type="submit" class="btn btn-primary btn-sm">Lưu
                                </button>
                                <button type="button" class="btn btn-default btn-sm"
                                        data-dismiss="modal">Close</button>

                            </div>
                        </form>

                    </div>
                </div>
            </div>  
            <aside class="right-side">

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <!--breadcrumbs start -->
                            <ul class="breadcrumb">
                                <li><a href="Home.jsp"><i class="fa fa-home"></i> Trang chủ</a></li>

                                <li class="active">Chi tiết sản phẩm</li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:5px;">

                    </div>
                    <!-- Main row -->
                    <div class="row">
                        <div class="col-md-12">
                            <!--earning graph start-->
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    <span><i class="fa fa-image"></i> Thêm hình ảnh</span>
                                </header>
                                <div class="panel-body">
                                    <div class="col-md-6">
                                        <div id="form-login" ng-app="demoApp" ng-controller="LoginCtrl">
                                            <form method="post" action="ImageCTMH" enctype="multipart/form-data" 
                                                  name="form" ng-submit="login()" novalidate>
                                                <div class="form-group">
                                                    <label class="control-label">Hình ảnh</label>
                                                    <input type="file" name="fileupload" id="file" class="inputfile" value="Chọn">
                                                    <label for="file">Chọn file</label>
                                                </div>
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-info" 
                                                            >Thêm</button>
                                                    <a data-toggle="modal" href="#form-detail-ctha" class="btn btn-info">Chi tiết</a>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <!--earning graph end-->
                            <div class="modal fade" id="form-detail-ctha">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">&times;</button>
                                            <h4 class="modal-title">Hình ảnh mặt hàng: <%=sp.getTenMH()%></h4>
                                        </div>
                                        <div class="modal-body">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>STT</th>
                                                        <th>Hình ảnh</th>
                                                        <th>Tùy chọn</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        int count = 0;
                                                        for (CTHinhAnh ct : cTHinhAnhDAO.getlistWithMaMH(mamh)) {
                                                            count++;
                                                    %>
                                                    <tr>
                                                        <td><%=count%></td>
                                                        <td><img src="<%=ct.getHinhAnh()%>" style="width: 70px;height: 70px"></td>
                                                        <td><a href="XoaHinhAnh?MaMH=<%=mamh%>&HinhAnh=<%=ct.getHinhAnh()%>">Xóa</a></td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default btn-sm"
                                                    data-dismiss="modal">Đóng</button>

                                        </div>
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
                                    <span><i class="fa fa-bars"></i> Chi tiết mặt hàng
                                </header>
                                <a class="btn btn-success" data-toggle="modal" href="#form-insert-ctmh"
                                   style="margin: 10px 0px 0px 15px;">Thêm chi tiết</a>
                                <div class="panel-body">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Màu sắc</th>
                                                <th>Size</th>
                                                <th>Tùy chọn</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%  int dem = 0;
                                                for (CTSanPham ct : cTMatHangDAO.getListWithMaSP(mamh)) {
                                                    dem++;
                                            %>
                                            <tr>
                                                <td><%=dem%></td>
                                                <td><%=ct.getMauSac()%></td>
                                                <td><%=ct.getSize()%></td>
                                                <td><a data-toggle="modal" href="#form-update-ctmh"
                                                       data-mamh="<%=ct.getMaMH()%>"
                                                       data-mausac="<%=ct.getMauSac()%>"
                                                       data-size="<%=ct.getSize()%>">Sửa</a> || 
                                                    <a href="ThemCTMatHang?MaMH=<%=ct.getMaMH()%>&mausac=<%=ct.getMauSac()%>
                                                       &size=<%=ct.getSize()%>">Xóa</a></td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </section>
                            <div class="modal fade" id="form-update-ctmh">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">&times;</button>
                                            <img src="asset/Images/store_1483157799_405.png" alt=""/>
                                            <h4 class="modal-title">Chỉnh sửa chi tiết mặt hàng</h4>
                                        </div>
                                        <form action="ThemCTMatHang" method="POST"
                                              role="form">
                                            <div class="modal-body">

                                                <fieldset class="form-group">
                                                    <label for="input-tenlmh" class="col-sm-4">Mã SP</label>
                                                    <div class="col-sm-8">
                                                        <input readonly type="text" name="mamh" id="input-mamh"
                                                               class="form-control input-sm" value="" required="">
                                                    </div>
                                                </fieldset>
                                                <fieldset class="form-group">
                                                    <label for="input-tenlmh" class="col-sm-4">Color</label>
                                                    <div class="col-sm-8">
                                                        <input type="text" name="mausac"
                                                               class="form-control input-sm" id="input-mausac" value="" required="">
                                                    </div>
                                                </fieldset>
                                                <fieldset class="form-group">
                                                    <label for="input-tenlmh" class="col-sm-4">Size</label>
                                                    <div class="col-sm-8">
                                                        <input type="text" name="size"
                                                               class="form-control input-sm" id="input-size" value="" required="">
                                                    </div>
                                                </fieldset>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="hidden" value="update" name="command"> 
                                                <button type="submit" class="btn btn-primary btn-sm">Lưu
                                                </button>
                                                <button type="button" class="btn btn-default btn-sm"
                                                        data-dismiss="modal">Đóng</button>

                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--earning graph end-->
                            <div class="modal fade" id="form-insert-ctmh">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">&times;</button>
                                            <img src="asset/Images/store_1483157799_405.png" alt=""/>
                                            <h4 class="modal-title">Thêm chi tiết mặt hàng</h4>
                                        </div>
                                        <form action="ThemCTMatHang" method="POST"
                                              role="form">
                                            <div class="modal-body">
                                                <fieldset class="form-group">
                                                    <label for="input-tenlmh" class="col-sm-3">Color</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" name="mausac"
                                                               class="form-control input-sm" value="" required="">
                                                    </div>
                                                </fieldset>
                                                <fieldset class="form-group">
                                                    <label for="input-tenlmh" class="col-sm-3">Size</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" name="size"
                                                               class="form-control input-sm" value="" required="">
                                                    </div>
                                                </fieldset>
                                            </div>
                                            <div class="modal-footer">

                                                <input type="hidden" value="<%=mamh%>" name="mamh">
                                                <input type="hidden" value="insert" name="command"> 
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
                </section><!-- /.content -->
                <div class="footer-main">

                </div>
            </aside><!-- /.right-side -->

        </div><!-- ./wrapper -->
        <script src="asset/JQuery/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="asset/JQuery/angular.min.js" type="text/javascript"></script>
        <script src="asset/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script>
                                                      $('#form-update-ctmh').on('show.bs.modal', function (event) {
                                                          var a = $(event.relatedTarget); // Button that triggered the modal
                                                          var mamh = a.data('mamh'); // Extract info from data-* attributes
                                                          var mausac = a.data('mausac');
                                                          var size = a.data('size');

                                                          $('#input-mamh').val(mamh);
                                                          $('#input-mausac').val(mausac);
                                                          $('#input-size').val(size);
                                                      });
        </script>
    </body>
</html>
