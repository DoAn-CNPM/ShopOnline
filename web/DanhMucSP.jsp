<%-- 
    Document   : DanhMucSP
    Created on : Nov 30, 2016, 12:18:44 PM
    Author     : kelvi
--%>

<%@page import="dao.SanPhamDAO"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="dao.UsersDAO"%>
<%@page import="model.NhanVien"%>
<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="model.LoaiSanPham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin | Danh mục sản phẩm</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="asset/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="asset/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="asset/css/style_2.css" rel="stylesheet" type="text/css"/>

    </head>
    <body class="skin-black">
        <%
            LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
            NhanVien nhanVien = null;
            if (session.getAttribute("userAdmin") != null) {
                nhanVien = (NhanVien) session.getAttribute("userAdmin");
            }
            UsersDAO usersDAO = new UsersDAO();
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
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
                            <p>Hello, <%=nhanVien.getHoTen()%></p>

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
                        <li class="active">
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
                                <li class="active">Danh mục sản phẩm</li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-12">
                            <!--earning graph start-->
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    <span><i class="fa fa-bars"></i>  Quản lý danh mục</span>
                                </header>
                                <div class="panel-body">
                                    <div class="line"></div>
                                    <label class="label label-success" style="font-size: 15px"><a data-toggle="modal" href="#form-insert-lmh"
                                              data-target="#form-insert-lmh" id="add-ctlmh">Thêm Loại mặt hàng</a></label>

                                    <br><br>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Mã loại SP</th>
                                                <th>Tên loại SP</th>
                                                <th>Tùy chọn</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int count = 0;
                                                for (LoaiSanPham lsp : loaiSanPhamDAO.getListLoaiSP()) {
                                                    count++;
                                            %>
                                            <tr>
                                                <td><%=count%></td>
                                                <td><%=lsp.getMaLoai()%></td>
                                                <td><%=lsp.getTenLoai()%></td>
                                                <td>
                                                    <a href="UpdateLSP.jsp?maLoai=<%=lsp.getMaLoai()%>">Chi tiết</a> || 
                                                    <a data-toggle="modal" href='#form-update-lmh'
                                                       data-target="#form-update-lmh"
                                                       data-maloai='<%=lsp.getMaLoai()%>'
                                                       data-tenloai='<%=lsp.getTenLoai()%>'>Sửa</a> || 
                                                    <a href="QLLoaiSPServlet?command=deleteLSP&maLoai=<%=lsp.getMaLoai()%>"
                                                       onclick="return confirm('Bạn có chắc chắn muốn xóa ?')">Xóa</a>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                    <div class="modal fade" id="form-insert-lmh">
                                        <div class="modal-dialog modal-sm">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title">Thêm loại mặt hàng</h4>
                                                </div>
                                                <form action="QLLoaiSPServlet" method="POST" class="form-horizontal"
                                                      role="form">
                                                    <div class="modal-body">

                                                        <fieldset class="form-group">
                                                            <label for="input-tenlmh" class="col-sm-2">Tên</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" name="tenlmh" id="input-tenlmh"
                                                                       class="form-control input-sm" value="" required="">
                                                            </div>
                                                        </fieldset>
                                                    </div>
                                                    <div class="modal-footer">

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
                                    <div class="modal fade" id="form-update-lmh">
                                        <div class="modal-dialog modal-sm">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title">Chỉnh sửa loại mặt hàng</h4>
                                                </div>
                                                <form action="QLLoaiSPServlet" method="POST" class="form-horizontal"
                                                      role="form">
                                                    <div class="modal-body">
                                                        <fieldset class="form-group">
                                                            <label for="input-tenlmh" class="col-sm-2">Mã</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" name="malmh" id="input-malmh" readonly
                                                                       class="form-control input-sm" value="" required="">
                                                            </div>
                                                        </fieldset>

                                                        <fieldset class="form-group">
                                                            <label for="input-tenlmh" class="col-sm-2">Tên</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" name="tenlmh" id="input-tenlmh1"
                                                                       class="form-control input-sm" value="" required="">
                                                            </div>
                                                        </fieldset>
                                                    </div>
                                                    <div class="modal-footer">

                                                        <input type="hidden" value="updateLMH" name="command">
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
        <script>
                                                           $('#form-update-lmh').on('show.bs.modal', function (event) {
                                                               var a = $(event.relatedTarget); // Button that triggered the modal
                                                               var maloaiMH = a.data('maloai'); // Extract info from data-* attributes
                                                               var tenloaiMH = a.data('tenloai'); // Extract info from data-* attributes

                                                               $('#input-malmh').val(maloaiMH);
                                                               $('#input-tenlmh1').val(tenloaiMH);
                                                           });
        </script>
    </body>
</html>
