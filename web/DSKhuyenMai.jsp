<%-- 
    Document   : DSKhuyenMai
    Created on : Dec 12, 2016, 11:03:36 PM
    Author     : kelvi
--%>

<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.SanPham"%>
<%@page import="dao.SanPhamDAO"%>
<%@page import="model.CTKhuyenMai"%>
<%@page import="dao.CTKhuyenMaiDAO"%>
<%@page import="dao.KhuyenMaiDAO"%>
<%@page import="model.KhuyenMai"%>
<%@page import="dao.UsersDAO"%>
<%@page import="model.NhanVien"%>
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
        <script src="asset/JQuery/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#del-km").click(function () {
                    var makm = $("#MaKM").val();
                    var mamh=$("#MaMH").val();
                    var tenkm=$("#TenKM").val();
                    $.get('KhuyenMai', {'makm': makm,'mamh':mamh,'tenkm':tenkm}, function () {
                       
                    });
                });
            });
        </script>
    </head>
    <body class="skin-black">
        <%
            NhanVien nhanVien = null;
            if (session.getAttribute("userAdmin") != null) {
                nhanVien = (NhanVien) session.getAttribute("userAdmin");
            }
            KhuyenMaiDAO khuyenMaiDAO = new KhuyenMaiDAO();
            CTKhuyenMaiDAO cTKhuyenMaiDAO = new CTKhuyenMaiDAO();
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            CTKhuyenMai cTKhuyenMai = new CTKhuyenMai();
            SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
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
                                    <a href="#">
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

                        <li  class="active">
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
                                <li><a href="KhuyenMai.jsp?MaLoai=1">Khuyến mãi</a></li>
                                <li class="active">DS Khuyến mãi</li>
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
                                    <span><i class="fa fa-bars"></i> Danh sách khuyến mãi</span>
                                </header>
                                <div class="panel-body">
                                    <div class="line"></div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <span id="km-result"></span>
                                            <div class="table-responsive">
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Mã KM</th>
                                                            <th>Mã MH</th>
                                                            <th>Ngày BD</th>
                                                            <th>Ngày KT</th>
                                                            <th>Loại KM</th>
                                                            <th>Tùy chọn</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%for (KhuyenMai km : khuyenMaiDAO.getAll()) {
                                                                cTKhuyenMai = cTKhuyenMaiDAO.getWithMaKM(km.getMaKM());
                                                        %>
                                                        <tr>
                                                            <td><%=km.getMaKM()%></td>
                                                            <td><%=cTKhuyenMai.getMaMH()%></td>
                                                            <td><%=dt.format(km.getNgayBD())%></td>
                                                            <td><%=dt.format(km.getNgayKT())%></td>
                                                            <td><%=km.getLoai()%>%</td>
                                                            <td><a data-toggle="modal" href="#form-update-km"
                                                                   data-target="#form-update-km"
                                                                   data-makm="<%=km.getMaKM()%>"
                                                                   data-tenkm="<%=km.getTenKM()%>"
                                                                   data-ngaybd="<%=km.getNgayBD()%>"
                                                                   data-ngaykt="<%=km.getNgayKT()%>"
                                                                   data-loai="<%=km.getLoai()%>">Sửa</a>
                                                                || <a href="KhuyenMai?makm=<%=km.getMaKM()%>&mamh=<%=cTKhuyenMai.getMaMH()%>" id="del-km">Xóa</a>
                                                                <input type="hidden" value="<%=km.getMaKM()%>" id="MaKM">
                                                                <input type="hidden" value="<%=cTKhuyenMai.getMaMH()%>" id="MaMH">
                                                                <input type="hidden" value="<%=km.getTenKM()%>" id="TenKM">
                                                            </td>
                                                        </tr>
                                                        <%}%>
                                                    </tbody>
                                                </table>  
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="form-update-km">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true">&times;</button>

                                                    <h4 class="modal-title">Chỉnh sửa khuyến mãi</h4>
                                                </div>
                                                <form action="KhuyenMai" method="POST" class="form-horizontal"
                                                      role="form">
                                                    <div class="modal-body">
                                                        <fieldset class="form-group">
                                                            <label for="input-makm" class="col-sm-3">Mã</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" name="makm" id="input-makm"
                                                                       readonly class="form-control input-sm" value="" required="">
                                                            </div>
                                                        </fieldset>
                                                        <fieldset class="form-group">
                                                            <label for="input-tenkm" class="col-sm-3">Tên</label>
                                                            <div class="col-sm-9">
                                                                <textarea type="text" name="tenkm" id="input-tenkm"
                                                                          class="form-control input-sm" value="" required=""></textarea>
                                                            </div>
                                                        </fieldset>
                                                        <fieldset class="form-group">
                                                            <label for="input-nbd" class="col-sm-3">Ngày bắt đầu</label>
                                                            <div class="col-sm-9">
                                                                <input type="date" name="from" id="input-ngaybd"
                                                                       class="form-control input-sm" value="" required="">
                                                            </div>
                                                        </fieldset>
                                                        <fieldset class="form-group">
                                                            <label for="input-nkt" class="col-sm-3">Ngày kết thúc</label>
                                                            <div class="col-sm-9">
                                                                <input type="date" name="to" id="input-ngaykt"
                                                                       class="form-control input-sm" value="" required="">
                                                            </div>
                                                        </fieldset>
                                                        <fieldset class="form-group">
                                                            <label for="input-loaikm" class="col-sm-3">Loại KM (%)</label>
                                                            <div class="col-sm-9">
                                                                <input type="number" name="loaiKM" id="input-loai" step="10" min="10" max="50"
                                                                       class="form-control input-sm" value="" required="">
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

        <script src="asset/JQuery/angular.min.js" type="text/javascript"></script>
        <script src="asset/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="asset/Scripts/app.js" type="text/javascript"></script>
        <script>
            $('#form-update-km').on('show.bs.modal', function (event) {
                var a = $(event.relatedTarget); // Button that triggered the modal
                var makm = a.data('makm'); // Extract info from data-* attributes
                var tenkm = a.data('tenkm'); // Extract info from data-* attributes
                var ngaybd = a.data('ngaybd');
                var ngaykt = a.data('ngaykt');
                var loai = a.data('loai');

                $('#input-makm').val(makm);
                $('#input-tenkm').val(tenkm);
                $('#input-ngaybd').val(ngaybd);
                $('#input-ngaykt').val(ngaykt);
                $('#input-loai').val(loai);
            });
        </script>
    </body>
</html>
