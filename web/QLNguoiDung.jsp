<%-- 
    Document   : Home
    Created on : Nov 7, 2016, 8:56:19 PM
    Author     : Kelvin
--%>

<%@page import="dao.RoleDAO"%>
<%@page import="dao.SanPhamDAO"%>
<%@page import="dao.UsersDAO"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="model.CTLoaiMatHang"%>
<%@page import="model.LoaiSanPham"%>
<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="model.NhanVien"%>
<%@page import="model.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin | Quản lý người dùng</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="asset/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="asset/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="asset/css/style_2.css" rel="stylesheet" type="text/css"/>
        <script src="asset/JQuery/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;
                $("#username").keyup(function (e) {
                    clearTimeout(x_timer);
                    var user_name = $(this).val();
                    x_timer = setTimeout(function () {
                        check_username_ajax(user_name);
                    }, 1000);
                });

                function check_username_ajax(username) {
                    $("#user-result").html('<img src="img/ajax-loader.gif" />');
                    $.post('CheckUserName', {'username': username}, function (data) {
                        $("#user-result").html(data);
                    });
                }
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;
                $("#search-nv").keyup(function () {
                    clearTimeout(x_timer);
                    var manv = $(this).val();
                    $.post('CheckUserName', {'username': username}, function (data) {
                        $("#user-result").html(data);
                    });
                });
            });
        </script>
        <script type="text/javascript">
            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }
        </script>
    </head>
    <body class="skin-black">
        <%
            NhanVien nhanVien = new NhanVien();
            if (session.getAttribute("userAdmin") != null) {
                nhanVien = (NhanVien) session.getAttribute("userAdmin");
            }
            UsersDAO usersDAO = new UsersDAO();
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            RoleDAO roleDAO = new RoleDAO();
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
                        <li >
                            <a href="DanhMucSP.jsp">
                                <i class="fa fa-list"></i> <span>Danh mục mặt hàng</span>
                            </a>
                        </li>

                        <li>
                            <a href="KhuyenMai.jsp?MaLoai=1">
                                <i class="fa fa-foursquare"></i> <span>Khuyến mãi</span>
                            </a>
                        </li>

                        <li class="active">
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
                                <li class="active">Quản lý người dùng</li>
                            </ul>
                            <!--breadcrumbs end -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!--earning graph start-->
                            <section class="panel panel-info">
                                <header class="panel-heading">
                                    <span><i class="fa fa-user-circle-o"></i> Quản lý người dùng</span>
                                </header>
                                <div class="panel-body">
                                    <div class="line"></div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card-box table-responsive">
                                              
                                                <label class="lable label-success"><a data-toggle="modal" href="#form-insert-user"
                                                   data-target="#form-insert-user" id="add-ctlmh">Thêm Nhân Viên
                                                    </a></label>
                                                <table id="datatable-buttons" class="table table-hover table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Username</th>
                                                            <th>Password</th>
                                                            <th>Họ&tên</th>
                                                            <th>SĐT</th>
                                                            <th>Email</th>
                                                            <th>Địa chỉ</th>
                                                            <th>Tùy chọn</th>
                                                        </tr>
                                                    </thead>

                                                    <%
                                                    for (NhanVien nv : usersDAO.getListNV()) {%>
                                                    <tr>
                                                        <td><%=nv.getMaNV()%></td>
                                                        <td><%=nv.getUserName()%></td>
                                                        <td><%=nv.getPassWord()%></td>
                                                        <td><%=nv.getHoTen()%></td>
                                                        <td><%=nv.getSDT()%></td>
                                                        <td><%=nv.getEmail()%></td>
                                                        <%if (nv.getDiaChi() != null) {%>
                                                        <td><%=nv.getDiaChi()%></td>
                                                        <%} else {%>
                                                        <td></td>
                                                        <%}%>
                                                        <td>
                                                            <a data-toggle="modal" href="#form-update-user"
                                                               data-target="#form-update-user"
                                                               data-manv="<%=nv.getMaNV()%>"
                                                               data-username="<%=nv.getUserName()%>"
                                                               data-password="<%=nv.getPassWord()%>"
                                                               data-hoten="<%=nv.getHoTen()%>"
                                                               data-ngaysinh="<%=nv.getNgSinh()%>"
                                                               data-sdt="<%=nv.getSDT()%>"
                                                               data-email="<%=nv.getEmail()%>"
                                                               data-diachi="<%=nv.getDiaChi()%>">Sửa</a> ||
                                                            <a onclick="return confirm('Bạn có chắc chắn muốn xóa?')" 
                                                               href="QLNguoiDung?maNV=<%=nv.getMaNV()%>">
                                                                Xóa</a>
                                                        </td>
                                                    </tr>
                                                    <%}%>
                                                </table>
                                            </div>
                                            <div class="modal fade" id="form-update-user">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-hidden="true">&times;</button>
                                                            <img src="asset/Images/store_1483157799_405.png" alt="" style="height: 70px;width:150px" class="img-responsive"/>
                                                            <h3 class="modal-title">Chỉnh sửa nhân viên</h3>
                                                        </div>
                                                        <form action="QLNguoiDung" method="POST" class="form-horizontal"
                                                              role="form">
                                                            <div class="modal-body">
                                                                <fieldset class="form-group">
                                                                    <label for="inputEmail3" class="col-sm-3 control-label">
                                                                        Mã
                                                                    </label>
                                                                    <div class="col-sm-9">
                                                                        <input readonly type="text" name="maNV" class="form-control" id="input-manv" placeholder="">
                                                                    </div>
                                                                </fieldset>
                                                                <fieldset class="form-group">

                                                                    <label for="inputPassword3" class="col-sm-3 control-label">
                                                                        Tên đăng nhập
                                                                    </label>
                                                                    <div class="col-sm-9">
                                                                        <input readonly type="text" id="input-username" class="form-control" placeholder="" name="userName">
                                                                    </div>

                                                                </fieldset>
                                                                <fieldset class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-3 control-label">
                                                                        Mật khẩu
                                                                    </label>
                                                                    <div class="col-sm-9">
                                                                        <input type="password" id="input-pass"  class="form-control" placeholder="" name="passWord" minlength="6">
                                                                    </div>
                                                                </fieldset>
                                                                <fieldset class="form-group">
                                                                    <label class="col-sm-3 control-label">Họ&Tên</label>
                                                                    <div class="col-sm-9">
                                                                        <input type="text" class="form-control" id="input-hoten"  placeholder="" name="hoTen">
                                                                    </div>
                                                                </fieldset>
                                                                <fieldset class="form-group">
                                                                    <label class="col-sm-3 control-label">Ngày sinh</label>
                                                                    <div class="col-sm-9">
                                                                        <input type="date" class="form-control" id="input-ngaysinh"  placeholder="" name="ngaySinh">
                                                                    </div>
                                                                </fieldset>
                                                                <fieldset class="form-group">
                                                                    <label class="col-sm-3 control-label">SĐT</label>
                                                                    <div class="col-sm-9">
                                                                        <input type="number" class="form-control" id="input-sdt" placeholder="" required="" name="sdt">
                                                                    </div>
                                                                </fieldset>

                                                                <fieldset class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-3 control-label">
                                                                        Email
                                                                    </label>
                                                                    <div class="col-sm-9">
                                                                        <input type="email" class="form-control" id="input-email"  placeholder="" name="Email">
                                                                    </div>
                                                                </fieldset> 
                                                                <fieldset class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-3 control-label">
                                                                        Địa chỉ
                                                                    </label>
                                                                    <div class="col-sm-9">
                                                                        <textarea type="text" class="form-control" id="input-diachi"  placeholder="" name="diachi"></textarea>
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
                                            <div class="modal fade" id="form-insert-user">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-hidden="true">&times;</button>
                                                            <img src="asset/Images/store_1483157799_405.png" alt="" style="height: 70px;width:150px" class="img-responsive"/>
                                                            <h3 class="modal-title">Thêm nhân viên</h3>

                                                        </div>
                                                        <form action="QLNguoiDung" method="POST" class="form-horizontal"
                                                              role="form">
                                                            <div class="modal-body">

                                                                <fieldset class="form-group">

                                                                    <label for="inputPassword3" class="col-sm-3 control-label">
                                                                        Tên đăng nhập
                                                                    </label>
                                                                    <div class="col-sm-9">
                                                                        <input type="text" class="form-control" placeholder="" required="" name="userName"
                                                                               id="username">
                                                                        <span id="user-result"></span>
                                                                    </div>

                                                                </fieldset>
                                                                <fieldset class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-3 control-label">
                                                                        Mật khẩu
                                                                    </label>
                                                                    <div class="col-sm-9">
                                                                        <input type="password" class="form-control" placeholder="" required="" name="passWord" minlength="6">
                                                                    </div>
                                                                </fieldset>
                                                                <fieldset class="form-group">
                                                                    <label class="col-sm-3 control-label">Họ & Tên</label>
                                                                    <div class="col-sm-9">
                                                                        <input type="text" class="form-control" placeholder="" required="" name="hoTen">
                                                                    </div>
                                                                </fieldset>
                                                                <fieldset class="form-group">
                                                                    <label class="col-sm-3 control-label">SĐT</label>
                                                                    <div class="col-sm-9">
                                                                        <input type="number" class="form-control" placeholder="" onkeypress="return isNumberKey(event)" required="" name="sdt">
                                                                    </div>
                                                                </fieldset>

                                                                <fieldset class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-3 control-label">
                                                                        Email
                                                                    </label>
                                                                    <div class="col-sm-9">
                                                                        <input type="email" class="form-control" placeholder="" required="" name="Email">
                                                                    </div>
                                                                </fieldset>
                                                                <fieldset class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-3 control-label">
                                                                        Vai trò
                                                                    </label>
                                                                    <div class="col-sm-9">
                                                                        <%for (Role c

                                                                            : roleDAO.getListRole () 
                                                                                ) {%>
                                                                        <label class="radio-inline">
                                                                            <input type="radio" id="inlineRadio1" value="<%=c.getRoleID()%>" name="roleID"> <%=c.getRoleName()%>
                                                                        </label>
                                                                        <%}%>
                                                                        <!-- <input type="text" class="form-control" placeholder="" name="roleID"> -->
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
        <script src="asset/Scripts/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="asset/Scripts/dataTables.bootstrap4.min.js" type="text/javascript"></script>
        <script src="asset/Scripts/dataTables.responsive.min.js" type="text/javascript"></script>

        <script type="text/javascript">
                                                                            $(document).ready(function () {
                                                                                $('#datatable').DataTable();

                                                                                //Buttons examples
                                                                                var table = $('#datatable-buttons').DataTable({
                                                                                    lengthChange: false,
                                                                                    buttons: ['copy']
                                                                                });

                                                                                table.buttons().container()
                                                                                        .appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');
                                                                            });

        </script>
        <script>
            $('#form-update-user').on('show.bs.modal', function (event) {
                var a = $(event.relatedTarget); // Button that triggered the modal
                var manv = a.data('manv'); // Extract info from data-* attributes
                var username = a.data('username'); // Extract info from data-* attributes
                var pass = a.data('password');
                var hoten = a.data('hoten');
                var ngaysinh = a.data('ngaysinh');
                var sdt = a.data('sdt');
                var email = a.data('email');
                var diachi = a.data('diachi');

                $('#input-manv').val(manv);
                $('#input-username').val(username);
                $('#input-pass').val(pass);
                $('#input-hoten').val(hoten);
                $('#input-ngaysinh').val(ngaysinh);
                $('#input-sdt').val(sdt);
                $('#input-email').val(email);
                $('#input-diachi').val(diachi);
            }
            );
        </script>
    </body>
</html>
