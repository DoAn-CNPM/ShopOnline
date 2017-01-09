<%-- 
    Document   : Profile
    Created on : Dec 14, 2016, 12:30:47 AM
    Author     : kelvi
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.UsersDAO"%>
<%@page import="model.NhanVien"%>
<%@page import="dao.LoaiSanPhamDAO"%>
<%@page import="dao.CTLoaiMatHangDAO"%>
<%@page import="model.CTLoaiMatHang"%>
<%@page import="model.LoaiSanPham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="asset/bootstrap/css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="asset/css/style.css">

        <link rel="stylesheet" type="text/css" href="asset/font-awesome-4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%
            CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();
            LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
            NhanVien nhanVien = new NhanVien();
            UsersDAO usersDAO = new UsersDAO();
            String manv ="";
            if (request.getParameter("MaNV") != null) {
                manv = request.getParameter("MaNV");
                nhanVien = usersDAO.getNVwithMaNV(Long.parseLong(manv));
            }
           
            SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");
        %>
        <div class=wapper>
            <jsp:include page="Header.jsp"></jsp:include>
             
            <div class="main-content">
                <div class="container">
                    <div class="line"></div>
                    <div class="row">
                        <div class="col-md-12">
                            <ol class="breadcrumb">
                                <li><a href="Home.jsp"><i class="fa fa-home"></i> Trang chủ</a></li>
                                <li class="active">Trang cá nhân</li>
                            </ol>
                        </div>                      
                    </div>
                    <div class="row">
                        <div class="col-md-4" id="image-user">
                            <%if (nhanVien.getImage() == null) {
                                    if (nhanVien.getGioiTinh()==null) {
                            %>
                            <img src="asset/Images/person-flat.png" alt=""/>
                            <%} else if (nhanVien.getGioiTinh().equals("male")) {%>
                            <img src="asset/Images/person-flat.png" alt=""/>
                            <%} else {%>
                            <img src="asset/Images/person-girl-flat.png" alt=""/>
                            <%}
                             } else {%>
                            <img src="<%=nhanVien.getImage()%>" style="width: 250px;height: 265px;border-radius: 50%">
                            <%}%>
                            <br><br>
                            <form action="UpdateImage" method="post"  enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="file" name="fileupload" id="file" class="inputfile" value="Chọn">
                                    <label for="file">Chọn file</label>
                                </div>
                                <% session.setAttribute("manv", manv);%>
                                <button type="submit" class="btn btn-info">Upload</button>
                            </form>
                        </div>

                        <div class="col-md-8">
                            <form class="form-horizontal" method="post" action="Profile">
                                <div class="form-group">
                                    <label for="inputusername" class="col-sm-4 control-label">Tên đăng nhập</label>
                                    <div class="col-sm-8">
                                        <input type="text" readonly class="form-control" name="username" value="<%=nhanVien.getUserName()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputusername" class="col-sm-4 control-label">Mật khẩu</label>
                                    <div class="col-sm-8">
                                        <input type="password" readonly name="password" class="form-control" type="password" value="<%=nhanVien.getPassWord()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputusername" class="col-sm-4 control-label">Họ và tên</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="hoten" class="form-control" value="<%=nhanVien.getHoTen()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Giới tính</label>
                                    <div class="col-sm-8">
                                        <%if (nhanVien.getGioiTinh() == null) {%>
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" id="inlineRadio1" value="male"> Nam
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" id="inlineRadio2" value="female"> Nữ
                                        </label>
                                        <%} else if (nhanVien.getGioiTinh().equals("male")) {%>
                                        <label class="radio-inline">
                                            <input type="radio" checked name="gender" id="inlineRadio1" value="male"> Nam
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" id="inlineRadio2" value="female"> Nữ
                                        </label>
                                        <%} else {%>
                                        <label class="radio-inline">
                                            <input type="radio"  name="gender" id="inlineRadio1" value="male"> Nam
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" checked name="gender" id="inlineRadio2" value="female"> Nữ
                                        </label>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputusername" class="col-sm-4 control-label">Ngày sinh</label>
                                    <div class="col-sm-8">
                                        <input type="date" class="form-control" name="birthday" value="<%=nhanVien.getNgSinh()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputusername" class="col-sm-4 control-label">Số điện thoại</label>
                                    <div class="col-sm-8">
                                        <input type="tel" class="form-control" name="sdt" value="<%=nhanVien.getSDT()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputusername" class="col-sm-4 control-label">Email</label>
                                    <div class="col-sm-8">
                                        <input type="email" readonly class="form-control" name="email" value="<%=nhanVien.getEmail()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputusername" class="col-sm-4 control-label">Địa chỉ</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="diachi" class="form-control" value="<%=nhanVien.getDiaChi()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-4 col-sm-8">

                                        <input type="hidden" value="<%=manv%>" name="maNV">
                                        <button type="submit" class="btn btn-success" onclick="return alert('Cập nhật thành công thông tin người dùng')">Cập nhật</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="Footer.jsp"></jsp:include>
            <p role="button" class="back-to-top" data-toggle="tooltip" data-placement="top" title="Lên đầu trang">
                <img src="asset/Images/1349751884_navigation-up-button_blue.png" alt="" />
            </p>
        </div>
        <script src="asset/JQuery/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="asset/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
         <script src="asset/Scripts/back-to-top.js" type="text/javascript" charset="utf-8" async defer></script>
    </body>
</html>
