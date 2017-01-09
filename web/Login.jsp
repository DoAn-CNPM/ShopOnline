
<%@page import="model.CTLoaiMatHang"%>
<%@page import="model.LoaiSanPham"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="model.NhanVien"%>
<%@page import="dao.RoleDAO"%>
<%@page import="model.Role"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
        <!-- Latest compiled and minified CSS -->
        <!-- Optional theme -->
        <link href="asset/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
        <!-- Latest compiled and minified JavaScript -->
        <link href="asset/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="asset/material-design-iconic-font/css/material-design-iconic-font.min.css" rel="stylesheet" type="text/css" />
        <link href="asset/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <script src="asset/JQuery/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="asset/JQuery/angular.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var form = $("#login-form");
                var username = $("#user");
                var password = $("#pass");
                form.submit(function () {
                    if ($('input[type=radio]:checked').val() === "Admin" || $('input[type=radio]:checked').val() === "NhanVien") {
                        if (username.val().length === 0) {
                            alert('Tên tài khoản không được để trống');
                            return false;
                        } else if (password.val().length === 0) {
                            alert('Mật khẩu không được để trống');
                            return false;
                        } else {
                            return true;
                        }
                    } else {
                        alert('Chưa chọn vai trò');
                        return false;
                    }
                });
            });
        </script>
    </head>
    <body>
        <%
            RoleDAO roleDao = new RoleDAO();
            String categoryID = "";
            if (request.getParameter("categoryID") != null) {
                categoryID = request.getParameter("categoryID");
            }
        %>

        <div class="wapper">
            <jsp:include page="Header.jsp"></jsp:include>
                <div class="main">

                    <div class="container">
                        <div class="row">
                            <ol class="breadcrumb">
                                <li><span id="btn-home" class="glyphicon glyphicon-home" aria-hidden="true" style="color: grey"></span>
                                    <a href="Home.jsp">Trang chủ</a>
                                </li>
                                <li class="active">Đăng nhập</li>
                            </ol>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <h4 style="margin-bottom: 15px !important">Đăng nhập hệ thống</h4>
                                <p>Bằng cách đăng nhập vào hệ thống, nhân viên có thể dễ dàng quản lý webite hơn. Việc thêm, sửa, xóa các đối tượng của shop trở nên rất dễ dàng.</p>
                            </div>
                            <div class="col-md-6">

                                <div ng-app="demoApp" ng-controller="LoginCtrl">

                                    <form id="login-form" method="post" action="Login" class="form-horizontal" name="form" ng-submit="login()" novalidate>
                                        <div class="form-group">
                                            <div class="col-xs-offset-4 col-xs-8">
                                            <%for (Role c : roleDao.getListRole()) {%>
                                            <label class="radio-inline">
                                                <input type="radio" value="<%=c.getRoleID()%>" name="Role" ng-model="role" required> <%=c.getRoleName()%>
                                            </label>
                                            <%}%>
                                            <i class="fa fa-check text-success" ng-show="form.role.$dirty && form.role.$valid"></i>
                                            <div ng-show="form.role.$dirty && form.role.$invalid" class="text-danger">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="username" class="col-xs-4 control-label required">* Tài khoản</label>

                                        <div class="col-xs-8">

                                            <input name="username" type="text" class="form-control" placeholder="" ng-model="username"
                                                   autocomplete="off" id="user" required>
                                            <div ng-show="form.username.$dirty && form.username.$invalid" class="text-danger">
                                                <i class="fa fa-times-circle text-danger"></i>
                                                <!--Nếu dữ liệu không hợp lệ-->
                                                <span ng-show="form.username.$error.required">Tên đăng nhập không được để trống</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-xs-4 control-label required">* Mật khẩu
                                        </label>
                                        <div class="col-xs-8">
                                            <input name="password" ng-model="password" type="password" class="form-control" placeholder=""
                                                 id="pass" required>
                                            <div ng-show="form.password.$dirty && form.password.$invalid" class="text-danger">
                                                <i class="fa fa-times-circle" aria-hidden="true" text-danger></i>
                                                <span ng-show="form.password.$error.required">
                                                    Mật khẩu không được bỏ trống
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-offset-4 col-xs-8">
                                            <span id="forget-pass"><a href="#form-qmk" data-toggle="modal">Quên mật khẩu</a></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-offset-4 col-xs-8">
                                            <button id="btn-login" type="submit" class="btn btn-primary">
                                                Đăng nhập
                                            </button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                            <div class="modal fade" id="form-qmk">
                                <div class="modal-dialog modal-sm" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">&times;</button>
                                            <img src="asset/Images/store_1483157799_405.png" alt="" style="width: 100%;height: 100px"/>
                                            <h4 class="modal-title">Quên mật khẩu</h4>
                                        </div>
                                        <form method="post" action="Quenmatkhau">
                                            <div class="modal-body">
                                                <p style="text-align: justify">* Để lấy lại mật khẩu, bạn phải điền chính xác tên đăng nhập và email của mình, nếu hệ thống kiểm tra chính xác thì
                                                    sẽ có một email gửi đến email bạn đã nhập</p>

                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon" id="sizing-addon2"><i class="fa fa-desktop" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" placeholder="Tên tài khoản" aria-describedby="sizing-addon2">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon" id="sizing-addon2">@</span>
                                                        <input type="email" class="form-control" placeholder="Email" aria-describedby="sizing-addon2">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary btn-sm">Gửi
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
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>
        <script src="asset/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

        <script>
                                                    var demoApp = angular.module('demoApp', [])
                                                            .controller("LoginCtrl", ['$scope', function ($scope) {
                                                                    $scope.success = false;
                                                                    $scope.register = function () {
                                                                        $scope.success = true;
                                                                    }
                                                                }]);
        </script>
    </body>

</html>