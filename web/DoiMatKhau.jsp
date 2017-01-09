<%-- 
    Document   : DoiMatKhau
    Created on : Jan 9, 2017, 10:15:11 AM
    Author     : vin
--%>

<%@page import="model.NhanVien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đổi mật khẩu</title>
        
    </head>
    <body>
        <%
            NhanVien nhanVien = null;
            if (session.getAttribute("userAdmin") != null) {
                nhanVien = (NhanVien) session.getAttribute("userAdmin");
            }
            if (session.getAttribute("userNV") != null) {
                nhanVien = (NhanVien) session.getAttribute("userNV");
            }
        %>
        <div class="modal fade" id="form-dmk">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                            <img src="asset/Images/store_1483157799_405.png" alt="" style="width: 100%;height: 100px"/>
                            <h4 class="modal-title">Đổi mật khẩu</h4>
                        </div>
                        <form method="post" action="Doimatkhau">
                            <div class="modal-body">
                                <p>Để đổi mật khẩu hiện tại, vui lòng điền đầy đủ thông tin dưới đây để hệ thống thực hiện việc đổi mật khẩu</p>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon" id="sizing-addon2"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
                                        <input type="password" class="form-control" name="matkhaucu" placeholder="Mật khẩu cũ" aria-describedby="sizing-addon2">
                                    </div>
                                </div>
                                <div class="form-group">
                                   <div class="input-group">
                                        <span class="input-group-addon" id="sizing-addon2"><i class="fa fa-unlock" aria-hidden="true"></i></span>
                                        <input type="password" class="form-control" name="matkhaumoi" placeholder="Mật khẩu mới" aria-describedby="sizing-addon2">
                                    </div>
                                </div>
                                <div class="form-group">
                                   <div class="input-group">
                                        <span class="input-group-addon" id="sizing-addon2"><i class="fa fa-key" aria-hidden="true"></i></span>
                                        <input type="password" class="form-control" name="xacnhan" placeholder="Xác nhận" aria-describedby="sizing-addon2">
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="hidden" value="<%=nhanVien.getMaNV()%>" name="manv">
                                <button type="submit" class="btn btn-primary btn-sm">Lưu
                                </button>
                                <button type="button" class="btn btn-default btn-sm"
                                        data-dismiss="modal">Đóng</button>

                            </div>
                        </form>

                    </div>
                </div>
            </div> 
    </body>
</html>
