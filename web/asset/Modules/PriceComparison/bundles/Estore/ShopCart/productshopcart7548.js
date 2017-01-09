
//====PRODUCT SHOPCART====
var wpShopCart = {
    _companyId: 0,
    _checkFilter: false,
    _checkCustomer: false,
    Configs: {
        HANDLER_CALLBACK_SHOPCART_URL: "/Modules/PriceComparison/Handler/ShopCart.ashx"
    },
    Utils: {
        IsValidEmail: function (strValue) {
            var emailRegExp = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.([a-z]){2,4})$/; return emailRegExp.test(strValue);
        }
    },
    selectors: {
        ITEM_RANK_TOTALPRICE: "#lblTotalPriceShopCart",
        ITEM_RANK_HEADER01: "#header_step01",
        ITEM_RANK_HEADER02: "#header_step02",
        ITEM_RANK_HEADER03: "#header_step03",
        ITEM_RANK_HEADER04: "#header_step04",
        ITEM_RANK_NEXT_STEP2: "#next_step02",
        ITEM_RANK_NEXT_STEP3: "#next_step03",
        ITEM_RANK_BACK_STEP2: "#back_step02",
        ITEM_RANK_BACK_STEP3: "#back_step03",
        ITEM_RANK_STEP0: "#step_0",
        ITEM_RANK_STEP1: "#step_01",
        ITEM_RANK_STEP2: "#step_02",
        ITEM_RANK_STEP3: "#step_03",
        ITEM_RANK_STEP4: "#step_04",
        ITEM_RANK_CUSTOMER_CHECK: "#reviceCustomer",
        ITEM_RANK_CUSTOMER_INFORMATION: "#reCustomer_Infor",
        ITEM_RANK_LIST_PRODUCT_SHOPCART: "#list_product_shopcart",
        ITEM_RANK_MESSAGE: "#message",
        ITEM_RANK_LOADING: "#loading_finish",
        ITEM_RANK_HEAD_STEP: "#head_step",
        ITEM_RANK_COUPON: "#htmlcoupon"
    },
    checkFilter: function () {
        var list = "";
        if (!$('#groupsfiter').is(':empty')) {
            $('#groupsfiter select.filterselect').each(function () {
                if ($(this).val() != "0") {
                    if (list.length > 0)
                        list += ',' + $(this).val();
                    else {
                        list += $(this).val();
                    }
                }
                else {
                    wpShopCart._checkFilter = true;
                }
            });
        }
        return list;
    },
    inforBox: function () {
        $.ajax({
            type: "POST",
            data: { method: 'InforBox', args: { companyId: wpShopCart._companyId } },
            url: wpShopCart.Configs.HANDLER_CALLBACK_SHOPCART_URL,
            success: function (r) {
                var _res = $.parseJSON(r);
                switch (_res.status) {
                    case "success":
                        var oData = $.parseJSON(_res.data);
                        if (oData.total != null) {
                            if ($('div.money-value').length) {
                                $("div.money-value").html(oData.total);
                            }
                        }
                        if (oData.quantity != null) {
                            if ($('div.basket-count').length) {
                                $("div.basket-count").html(oData.quantity);
                            }
                        }
                        break;
                    //case "error":
                    //    alert(oData.toSource());
                    //    alert(res.message + res.data);
                    //    break;
                    //case "fail":
                    //    alert("Hệ thống đang quá tải, bạn vui lòng quay lại sau !!!");
                    //    break;
                };
            },
            error: function (data, errorThrown) {
                alert(errorThrown);
            }
        });
    },
    checkCustomer: function () {
        var txtEmail = $("#txtEmail");
        var txtName = $("#txtName");
        var txtPhone = $("#txtPhoneNumber");
        var txtAdress = $("#txtAddress");
        if (txtName.val() == null || txtName.val() == '') {
            alert("Bạn chưa nhập họ và tên !");
            txtName.focus();
            return;
        }
        if (txtPhone.val() == null || txtPhone.val() == '') {
            alert("Bạn chưa nhập số điện thoại !");
            txtPhone.focus();
            return;
        }
        //if (txtEmail.val() == null || txtEmail.val() == '') {
        //    alert("Bạn chưa nhập đia chỉ email!");
        //    txtEmail.focus();
        //    return;
        //}
        //var RegEmail = wpShopCart.Utils.IsValidEmail(txtEmail.val());
        //if (RegEmail == false) {
        //    alert("Địa chỉ email không hợp lệ!");
        //    txtEmail.focus();
        //    return false;
        //}
        if (txtAdress.val() == null || txtAdress.val() == '') {
            alert("Bạn chưa nhập địa chỉ !");
            txtAdress.focus();
            return;
        }
        if (wpShopCart._checkCustomer) {
            var retxtEmail = $("#tbReceiveEmail");
            var retxtName = $("#tbReceiveName");
            var retxtPhone = $("#tbReceivePhoneNumber");
            var retxtAdress = $("#tbReceiveAddress");
            if (retxtName.val() == null || retxtName.val() == '') {
                alert("Bạn chưa nhập họ và tên người nhận hàng !");
                retxtName.focus();
                return;
            }
            if (retxtPhone.val() == null || retxtPhone.val() == '') {
                alert("Bạn chưa nhập số điện thoại người nhận hàng !");
                retxtPhone.focus();
                return;
            }
            //if (retxtEmail.val() == null || retxtEmail.val() == '') {
            //    alert("Địa chưa nhập đia chỉ email người nhận hàng!");
            //    retxtEmail.focus();
            //    return;
            //}
            //var RegEmail = wpShopCart.Utils.IsValidEmail(retxtEmail.val());
            //if (RegEmail == false) {
            //    alert("Địa chỉ email người nhận hàng không hợp lệ!");
            //    retxtEmail.focus();
            //    return false;
            //}
            if (retxtAdress.val() == null || retxtAdress.val() == '') {
                alert("Bạn chưa nhập địa chỉ người nhận hàng !");
                retxtAdress.focus();
                return;
            }
        }
        wpShopCart.viewProduct();
    },
    setddlImg: function (option_id, option_type_id) {
        if (document.getElementById('select_' + option_id) == null) {
            return;
        }
        for (var i = 0; i < document.getElementById('select_' + option_id).options.length; i++) {
            if (document.getElementById("select_" + option_id).options[i].value == option_type_id) {
                document.getElementById("select_" + option_id).selectedIndex = i;
            }
        }
        //set class menu-image
        var index_select;
        for (var j = 0; j < document.getElementById('select_' + option_id).options.length; j++) {
            index_select = document.getElementById('select_' + option_id).options[j].value;
            if (index_select != null) {
                var n = index_select.indexOf(":");
                if (parseInt(n) > 0) {
                    var mySplitResult = index_select.split(":");
                    document.getElementById('menu_image_' + mySplitResult[1]).className = "";
                }
            }
        }
        var mySplitSelect = option_type_id.split(":");
        document.getElementById('menu_image_' + mySplitSelect[1]).className = "active";
    },
    loginCustomer: function () {
        var txtEmail = $("#tbEmail");
        var txtPass = $("#tbPassWord");
        if (txtEmail.val() == null || txtEmail.val() == '') {
            alert("Bạn chưa nhập đia chỉ email!");
            txtEmail.focus();
            return;
        }
        var RegEmail = wpShopCart.Utils.IsValidEmail(txtEmail.val());
        if (RegEmail == false) {
            alert("Địa chỉ email không hợp lệ!");
            txtEmail.focus();
            return false;
        }
        if (txtPass.val() == null || txtPass.val() == '') {
            alert("Bạn chưa nhập mật khẩu !");
            txtPass.focus();
            return;
        }
        $.ajax({
            type: "POST",
            data: { method: 'LoginCustomer', args: { companyId: wpShopCart._companyId, email: txtEmail.val(), pass: txtPass.val() } },
            url: wpShopCart.Configs.HANDLER_CALLBACK_SHOPCART_URL,
            success: function (r) {
                var _res = $.parseJSON(r);
                switch (_res.status) {
                    case "success":
                        var oData = $.parseJSON(_res.data);
                        if (oData.strCustomer != null) {
                            var array = oData.strCustomer.split('|');
                            $("#txtName").val(array[0]);
                            $("#txtPhoneNumber").val(array[1]);
                            $("#txtEmail").val(array[2]);
                            $("#ddlProvinces").val(array[3]);
                            $("#txtAddress").val(array[4]);
                            txtEmail.val('');
                            txtPass.val('');
                        }
                        $(wpShopCart.selectors.ITEM_RANK_HEADER03).addClass("selected");
                        $(wpShopCart.selectors.ITEM_RANK_STEP3).show();
                        $(wpShopCart.selectors.ITEM_RANK_STEP2).hide();
                        $(wpShopCart.selectors.ITEM_RANK_STEP1).hide();
                        break;
                    case "error":
                        alert(res.message + res.data);
                        break;
                    case "fail":
                        alert("Bạn hay kiểm tra lại tài khoản và mật khẩu !!!");
                        break;
                };
            },
            error: function (data, errorThrown) {
                alert(errorThrown);
            }
        });
    },
    inforCustomer: function () {
        var txtEmail = $("#txtEmail");
        var txtPhone = $("#txtPhoneNumber");
        $.ajax({
            type: "POST",
            data: { method: 'InforCustomer', args: { companyId: wpShopCart._companyId, email: txtEmail.val(), pass: txtPhone.val() } },
            url: wpShopCart.Configs.HANDLER_CALLBACK_SHOPCART_URL,
            success: function (r) {
                var _res = $.parseJSON(r);
                switch (_res.status) {
                    case "success":
                        var oData = $.parseJSON(_res.data);
                        if (oData.strCustomer != null) {
                            if (oData.strCustomer.length > 0) {
                                var array = oData.strCustomer.split('|');
                                $("#txtName").val(array[0]);
                                $("#txtPhoneNumber").val(array[1]);
                                $("#txtEmail").val(array[2]);
                                $("#ddlProvinces").val(array[3]);
                                $("#txtAddress").val(array[4]);
                            }
                        }
                        break;
                    case "error":
                        alert(res.message + res.data);
                        break;
                    case "fail":
                        alert("Bạn hay kiểm tra lại tài khoản và mật khẩu !!!");
                        break;
                };
            },
            error: function (data, errorThrown) {
                alert(errorThrown);
            }
        });
    },
    viewProduct: function () {
        var _shipped = $('input:radio[name=choices]:checked').val();
        var _payment = $('input:radio[name=payments]:checked').val();
        var _txtName = $("#txtName").val();
        var _txtPhoneNumber = $("#txtPhoneNumber").val();
        var _txtAddress = $("#txtAddress").val();
        var _ddlProvinces = $('#ddlProvinces').val();
        var _txtEmail = $("#txtEmail").val();
        var _chkCutomer = 1;
        if (wpShopCart._checkCustomer = false) {
            _chkCutomer = 0;
        }
        var _tbReceiveName = $("#tbReceiveName").val();
        var _tbReceivePhoneNumber = $("#tbReceivePhoneNumber").val();
        var _tbReceiveAddress = $("#tbReceiveAddress").val();
        var _ddlReceiveProvince = $("#ddlReceiveProvince").val();
        var _tbReceiveEmail = $("#tbReceiveEmail").val();
        var _coupon = $("#hfValueCoupon").val();

        $.ajax({
            type: "POST",
            data: { method: 'ListProductShopCart', args: { companyId: wpShopCart._companyId, shipped: _shipped, payment: _payment, txtName: _txtName, txtPhoneNumber: _txtPhoneNumber, txtAddress: _txtAddress, ddlProvinces: _ddlProvinces, txtEmail: _txtEmail, chkCutomer: _chkCutomer, tbReceiveName: _tbReceiveName, tbReceivePhoneNumber: _tbReceivePhoneNumber, tbReceiveAddress: _tbReceiveAddress, ddlReceiveProvince: _ddlReceiveProvince, tbReceiveEmail: _tbReceiveEmail, coupon: _coupon } },
            url: wpShopCart.Configs.HANDLER_CALLBACK_SHOPCART_URL,
            success: function (r) {
                var _res = $.parseJSON(r);
                switch (_res.status) {
                    case "success":
                        var oData = $.parseJSON(_res.data);
                        //alert(oData.toSource());
                        if (oData.content != null) {
                            $(wpShopCart.selectors.ITEM_RANK_HEADER04).addClass("selected");
                            $(wpShopCart.selectors.ITEM_RANK_LIST_PRODUCT_SHOPCART).html(oData.content);
                            $(wpShopCart.selectors.ITEM_RANK_STEP3).hide();
                            $(wpShopCart.selectors.ITEM_RANK_STEP4).show();
                        }
                        break;
                    case "error":
                        alert(oData.toSource());
                        alert(res.message + res.data);
                        break;
                    case "fail":
                        alert("Hệ thống đang quá tải, bạn vui lòng quay lại sau !!!");
                        break;
                };
            },
            error: function (data, errorThrown) {
                alert(errorThrown);
            }
        });
    },
    orderProduct: function () {
        var _shipped = $('input:radio[name=choices]:checked').val();
        var _payment = $('input:radio[name=payments]:checked').val();
        var _txtName = $("#txtName").val();
        var _txtPhoneNumber = $("#txtPhoneNumber").val();
        var _txtAddress = $("#txtAddress").val();
        var _ddlProvinces = $('#ddlProvinces').val();
        var _txtEmail = $("#txtEmail").val();
        var _chkCutomer = 1;
        if (wpShopCart._checkCustomer = false) {
            _chkCutomer = 0;
        }
        var _tbReceiveName = $("#tbReceiveName").val();
        var _tbReceivePhoneNumber = $("#tbReceivePhoneNumber").val();
        var _tbReceiveAddress = $("#tbReceiveAddress").val();
        var _ddlReceiveProvince = $("#ddlReceiveProvince").val();
        var _tbReceiveEmail = $("#tbReceiveEmail").val();
        var _note = $("#txtNote").val();
        var _coupon = $("#hfValueCoupon").val();
        $.ajax({
            type: "POST",
            data: { method: 'OrderProduct', args: { companyId: wpShopCart._companyId, shipped: _shipped, payment: _payment, txtName: _txtName, txtPhoneNumber: _txtPhoneNumber, txtAddress: _txtAddress, ddlProvinces: _ddlProvinces, txtEmail: _txtEmail, chkCutomer: _chkCutomer, tbReceiveName: _tbReceiveName, tbReceivePhoneNumber: _tbReceivePhoneNumber, tbReceiveAddress: _tbReceiveAddress, ddlReceiveProvince: _ddlReceiveProvince, tbReceiveEmail: _tbReceiveEmail, note: _note, coupon: _coupon } },
            url: wpShopCart.Configs.HANDLER_CALLBACK_SHOPCART_URL,
            beforeSend: function () {
                $(wpShopCart.selectors.ITEM_RANK_LOADING).html('<div style="padding:10px 0 10px 0;text-align:center;"><img src="/images/loader_ge.gif" alt="Loading..." /><div>');
                $(wpShopCart.selectors.ITEM_RANK_STEP4).hide();
            },
            success: function (r) {
                var _res = $.parseJSON(r);
                //alert(_res.toSource());
                switch (_res.status) {
                    case "success":
                        if ((_res.data != null) && (_res.data.length > 0)) {
                            window.location = _res.data; // check thanh toan 
                        }
                        else {
                            $(wpShopCart.selectors.ITEM_RANK_LOADING).html('');
                            $(wpShopCart.selectors.ITEM_RANK_MESSAGE).show();
                            $(wpShopCart.selectors.ITEM_RANK_STEP4).hide();
                        }
                        break;
                    case "error":
                        alert(oData.toSource());
                        alert(res.message + res.data);
                        break;
                    case "fail":
                        alert("Hệ thống đang quá tải, bạn vui lòng quay lại sau !!!");
                        break;
                };
            },
            error: function (data, errorThrown) {
                alert(errorThrown);
            }
        });
    },
    addProduct: function (_productId) {
        var _quantity = $("#txtQuanlity").val();
        var _filter = wpShopCart.checkFilter();  // Check filter group product
        if (!$('#groupsfiter').is(':empty')) {
            if (wpShopCart._checkFilter) {
                alert("Bạn chưa chọn bộ lọc");
                wpShopCart._checkFilter = false;
                return;
            }
        }
        $.ajax({
            type: "POST",
            data: { method: 'AddShopCart', args: { companyId: wpShopCart._companyId, productId: _productId, quantity: _quantity, filter: _filter } },
            url: wpShopCart.Configs.HANDLER_CALLBACK_SHOPCART_URL,
            success: function (r) {
                var _res = $.parseJSON(r);
                switch (_res.status) {
                    case "success":
                        var oData = $.parseJSON(_res.data);
                        if (oData.content) {
                            wpShopCart.inforBox();
                            window.location = oData.content;
                        }
                        else {
                            alert("Hệ thống đang quá tải, bạn vui lòng quay lại sau !!!");
                        }
                        break;
                    case "error":
                        alert(res.message + res.data);
                        break;
                    case "fail":
                        alert("Hệ thống đang quá tải, bạn vui lòng quay lại sau !!!");
                        break;
                };
            },
            error: function (data, errorThrown) {
                alert(errorThrown);
            }
        });
    },
    removeProduct: function (_productId, _filter) {
        var _coupon = $("#hfValueCoupon").val();
        $.ajax({
            type: "POST",
            data: { method: 'RemoveShopCart', args: { companyId: wpShopCart._companyId, productId: _productId, filter: _filter, coupon: _coupon } },
            url: wpShopCart.Configs.HANDLER_CALLBACK_SHOPCART_URL,
            success: function (r) {
                var _res = $.parseJSON(r);
                switch (_res.status) {
                    case "success":
                        var oData = $.parseJSON(_res.data);
                        //alert(oData.toSource());
                        if (oData.content != null) {
                            wpShopCart.inforBox();
                            $(wpShopCart.selectors.ITEM_RANK_TOTALPRICE).html(oData.content);
                        }
                        var goups = _filter.replaceAll(':', '');
                        goups = goups.replaceAll(',', '');
                        $("#" + _productId + goups).remove();
                        if (oData.quantity != null) {
                            if (parseInt(oData.quantity) == 0) {
                                $(wpShopCart.selectors.ITEM_RANK_STEP0).show();
                                $(wpShopCart.selectors.ITEM_RANK_STEP1).hide();
                            }
                        }
                        // check coupon
                        var _alert = "Bạn đã xóa sản phẩm khỏi xóa hàng";
                        if (oData.value != null) {
                            $(wpShopCart.selectors.ITEM_RANK_COUPON).html("<td align='right' colspan='4'>Khuyễn mãi : <span style='color: Red;'>" + oData.valuecoupon + "</span></td><td align='right'><span style='color: Red;'>" + oData.value + "</span></td><td></td>");
                        }
                        else {
                            $(wpShopCart.selectors.ITEM_RANK_COUPON).html('');
                            if (oData.status != null) {
                                switch (oData.status) {
                                    case "1":
                                        _alert += ", Mã khuyến mại ko áp dụng cho sản phẩm này "
                                        break;
                                    case "2":
                                        _alert += ", Giá trị đơn hàng chưa đủ dùng mã khuyễn mãi "
                                        break;
                                }
                            }
                        }
                        alert(_alert);
                        break;
                    case "error":
                        alert(res.message + res.data);
                        break;
                    case "fail":
                        alert("Hệ thống đang quá tải, bạn vui lòng quay lại sau !!!");
                        break;
                };
            },
            error: function (data, errorThrown) {
                alert(errorThrown);
            }
        });
    },
    updateProduct: function (_productId, _filter) {
        var _quantity = $("#quanlity_t_" + _productId).val();
        var _coupon = $("#hfValueCoupon").val();
        var _value = $("#quanlity_t_" + _productId).attr("title");
        if (parseInt(_quantity) <= 0) {
            $("#quanlity_t_" + _productId).val("1");
            alert("Bạn phải nhập số lượng lớn hơn 0 !!!");
            return;
        }
        if (parseInt(_quantity) != parseInt(_value)) {
            $.ajax({
                type: "POST",
                data: { method: 'UpdateShopCart', args: { companyId: wpShopCart._companyId, productId: _productId, quantity: _quantity, filter: _filter, coupon: _coupon } },
                url: wpShopCart.Configs.HANDLER_CALLBACK_SHOPCART_URL,
                success: function (r) {
                    var _res = $.parseJSON(r);
                    switch (_res.status) {
                        case "success":
                            var oData = $.parseJSON(_res.data);
                            //alert(oData.toSource());
                            if (oData.total != null) {
                                wpShopCart.inforBox();
                                $(wpShopCart.selectors.ITEM_RANK_TOTALPRICE).html(oData.total);
                            }
                            if (oData.totalProduct != null) {
                                $("#total_t_" + _productId).html(oData.totalProduct);
                            }
                            $("#quanlity_t_" + _productId).attr("title", _quantity);
                            // check coupon
                            if (oData.value != null) {
                                $(wpShopCart.selectors.ITEM_RANK_COUPON).html("<td align='right' colspan='4'>Khuyễn mãi : <span style='color: Red;'>" + oData.valuecoupon + "</span></td><td align='right'><span style='color: Red;'>" + oData.value + "</span></td><td></td>");
                            }
                            else
                                $(wpShopCart.selectors.ITEM_RANK_COUPON).html('');
                            break;
                        case "error":
                            alert(_res.message + _res.data);
                            break;
                        case "fail":
                            alert("Hệ thống đang quá tải, bạn vui lòng quay lại sau !!!");
                            break;
                    };
                },
                error: function (data, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    },
    refreshCart: function () {
        $.ajax({
            type: "POST",
            data: { method: 'RefreshCart', args: { companyId: wpShopCart._companyId } },
            url: wpShopCart.Configs.HANDLER_CALLBACK_SHOPCART_URL,
            success: function (r) {
                var _res = $.parseJSON(r);
                switch (_res.status) {
                    case "success":
                        $(wpShopCart.selectors.ITEM_RANK_STEP0).hide();
                        $(wpShopCart.selectors.ITEM_RANK_STEP1).show();
                        wpShopCart.inforBox();
                        break;
                    case "error":
                        $(wpShopCart.selectors.ITEM_RANK_STEP0).show();
                        $(wpShopCart.selectors.ITEM_RANK_STEP1).hide();
                        $(wpShopCart.selectors.ITEM_RANK_HEAD_STEP).hide();
                        break;
                    case "fail":
                        $(wpShopCart.selectors.ITEM_RANK_STEP0).show();
                        $(wpShopCart.selectors.ITEM_RANK_STEP1).hide();
                        $(wpShopCart.selectors.ITEM_RANK_HEAD_STEP).hide();
                        break;
                };
            },
            error: function (data, errorThrown) {
                alert(errorThrown);
            }
        });
    },
    addCoupon: function () {
        var _coupon = $("#couponCode");
        if (_coupon.val() == null || _coupon.val() == '') {
            alert("Bạn chưa nhập mã khuyến mãi !!!");
            _coupon.focus();
            return;
        }
        $.ajax({
            type: "POST",
            data: { method: 'AddCoupon', args: { companyId: wpShopCart._companyId, couponCode: _coupon.val() } },
            url: wpShopCart.Configs.HANDLER_CALLBACK_SHOPCART_URL,
            success: function (r) {
                var _res = $.parseJSON(r);
                switch (_res.status) {
                    case "success":
                        var oData = $.parseJSON(_res.data);
                        if (oData != null) {
                            wpShopCart.inforBox();
                            $(wpShopCart.selectors.ITEM_RANK_COUPON).html("<td align='right' colspan='4'>Khuyễn mãi : <span style='color: Red;'>" + oData.valuecoupon + "</span></td><td align='right'><span style='color: Red;'>" + oData.value + "</span></td><td></td>");
                            $("#hfValueCoupon").val(_coupon.val());
                            wpShopCart.inforBox();
                        }
                        break;
                    case "error":
                        alert(_res.message + _res.data);
                        break;
                    case "fail":
                        alert("Hệ thống đang quá tải, bạn vui lòng quay lại sau !!!");
                        break;
                };
            },
            error: function (data, errorThrown) {
                alert("Hệ thống đang quá tải, bạn vui lòng quay lại sau !!!");
            }
        });
    },
    init: function (_companyId) {
        var _tempRanked = this;
        wpShopCart._companyId = _companyId;
        wpShopCart.refreshCart();
        $(_tempRanked.selectors.ITEM_RANK_STEP2).hide();
        $(_tempRanked.selectors.ITEM_RANK_STEP3).hide();
        $(_tempRanked.selectors.ITEM_RANK_STEP4).hide();
        $(_tempRanked.selectors.ITEM_RANK_STEP5).hide();
        $(_tempRanked.selectors.ITEM_RANK_MESSAGE).hide();
        $(_tempRanked.selectors.ITEM_RANK_CUSTOMER_INFORMATION).hide();

        //step_02
        $(_tempRanked.selectors.ITEM_RANK_NEXT_STEP2).click(function () {
            // $(_tempRanked.selectors.ITEM_RANK_STEP2).show();
            $(_tempRanked.selectors.ITEM_RANK_STEP1).hide();
            $(_tempRanked.selectors.ITEM_RANK_STEP2).hide();
            $(_tempRanked.selectors.ITEM_RANK_STEP3).show();
            $(_tempRanked.selectors.ITEM_RANK_HEADER03).addClass("selected");
            $(_tempRanked.selectors.ITEM_RANK_HEADER02).addClass("selected");
        });
        //step_03
        $(_tempRanked.selectors.ITEM_RANK_NEXT_STEP3).click(function () {
            $(_tempRanked.selectors.ITEM_RANK_STEP2).hide();
            $(_tempRanked.selectors.ITEM_RANK_STEP3).show();
            $(_tempRanked.selectors.ITEM_RANK_HEADER03).addClass("selected");
        });
        //back step 02
        $(_tempRanked.selectors.ITEM_RANK_BACK_STEP2).click(function () {
            $(_tempRanked.selectors.ITEM_RANK_STEP1).show();
            $(_tempRanked.selectors.ITEM_RANK_STEP3).hide();
            $(_tempRanked.selectors.ITEM_RANK_HEADER03).removeClass("selected");
        });
        //check Customer 
        $(_tempRanked.selectors.ITEM_RANK_CUSTOMER_CHECK).click(function () {
            if ($(_tempRanked.selectors.ITEM_RANK_CUSTOMER_CHECK).attr('checked')) {
                $(_tempRanked.selectors.ITEM_RANK_CUSTOMER_INFORMATION).hide();
                wpShopCart._checkCustomer = false;
            } else {
                $(_tempRanked.selectors.ITEM_RANK_CUSTOMER_INFORMATION).show();
                wpShopCart._checkCustomer = true;
            }
        });

        //Thông tin thanh toán
        $('.borderPayment input[type=radio]').click(function () {
            $('.cus-payment .box-info-payment').hide();
            $(this).parent().next('.box-info-payment').show();
        });
        //thong tin van chuyen
        $('.info-vc input[type=radio]').click(function () {
            $('.cus-ship .box-info-vc').hide();
            $(this).parent().next('.box-info-vc').show();
        });

        //Back view customer
        $(_tempRanked.selectors.ITEM_RANK_BACK_STEP3).click(function () {
            $(_tempRanked.selectors.ITEM_RANK_STEP3).show();
            $(_tempRanked.selectors.ITEM_RANK_STEP4).hide();
            $(_tempRanked.selectors.ITEM_RANK_HEADER04).removeClass("selected");
        });
    }
}

//=========================

var wpShipChung = {
    getCity: function (cityId) {
        $.ajax({
            type: "GET",
            url: "http://services.shipchung.vn/api/merchant/rest/lading/city",
            data: {},
            success: function (res) {
                if (!res.error) {
                    var city = [];
                    var list = "<option  value='0' >Thành phố</option >";
                    city = res.data;
                    for (var i = 0; i < city.length; i++) {
                        list = list + "<option  onclick='wpShipChung.getProvince(" + city[i].CityId + ",0);' ";
                        if (city[i].CityId == cityId)
                            list = list + "selected='true' ";
                        list = list + "value='" + city[i].CityId + "' >" + city[i].CityName + "</option >";
                    }
                    $("#ddlCity").html(list);
                }
                else
                    alert(res.error_message);
            },
            error: function (msg) {
            }
        });
    },
    getProvince: function (cityId, provinceId) {
        var url = "'" + "http://services.shipchung.vn/api/merchant/rest/lading/province/" + cityId + "'";
        $.ajax({
            type: "GET",
            url: "http://services.shipchung.vn/api/merchant/rest/lading/province/" + cityId,
            data: {},
            success: function (res) {
                var list = "<option  value='0' >Quận, huyện</option >";
                if (!res.error) {
                    var city = [];
                    city = res.data;
                    for (var i = 0; i < city.length; i++) {
                        list = list + "<option onclick='wpShipChung.getPrice();'";
                        if (provinceId != null) {
                            if (city[i].ProvinceId == provinceId) {
                                list = list + " selected='true' ";
                            }
                        }
                        list = list + " value='" + city[i].ProvinceId + "'>" + city[i].ProvinceName + "</option>";
                    }
                    $('#shipprice').html("");
                }
                //else
                //    alert(res.error_message);
                $("#ddlProvince").html(list);
            },
            error: function (msg) {
            }
        });
    },
    getPrice: function () {
        var fromCity = $("#hdfFromCity").val();
        var fromProvince = $("#hdfFromProvince").val();
        var weight = $("#hdfWeight").val();
        var amount = 10000000;
        var boxSize = "";
        //var boxSize = "30x30x30";
        //boxSize = $("#hdfSize").val()
        var toCity = $("#ddlCity").val();
        var toProvince = $("#ddlProvince").val();
        if (toProvince > 0) {
            $.ajax({
                type: "POST",
                url: "http://services.shipchung.vn/api/rest/courier/calculate",
                data: {
                    "Domain": "shipchung.vn",
                    "From": {
                        "City": fromCity,
                        "Province": fromProvince
                    },
                    "To": {
                        "City": toCity,
                        "Province": toProvince
                    },
                    "Order": {
                        "Weight": weight,
                        "Amount": amount,
                        "BoxSize": boxSize
                    },
                    "Config": {
                        "Service": 1,
                        "Protected": 2,
                        "CoD": 1,
                        "Payment": 1,
                        "Fragile": 2,
                        "Checking": 1
                    }
                },
                success: function (res) {
                    if (res.code == 'SUCCESS') {
                        $('#shipsuccess').show();
                        $('#shipprice').html(wpShipChung.FormatPrice(res.data.pvc));
                        $('#timeship').html("Thời gian: " + res.data.courier.system[0].leatime_total / 24 + " ngày");
                    }
                    if (res.code == 'UNSUPPORTED') {
                        $('#shipsuccess').hide();
                        $('#shipprice').html("Không hỗ trợ");
                        $('#timeship').html("Shipchung chưa hỗ trợ lấy hàng tại khu vực này, vui lòng liên hệ CSKH để được hỗ trợ ");
                    }

                },
                error: function (msg) {
                }
            });
        }
    },
    FormatPrice: function (price) {
        price = price + "";
        price = $.trim(price.replace(".", "").replace("đ", "").replace("VNĐ", ""));
        price = (price + "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
        return price + " đ";

    }
}

String.prototype.replaceAll = function (strTarget, strSubString) {
    var strText = this;
    var intIndexOfMatch = strText.indexOf(strTarget);
    // Keep looping while an instance of the target string
    while (intIndexOfMatch != -1) {
        // Relace out the current instance.
        strText = strText.replace(strTarget, strSubString)
        // Get the index of any next matching substring.
        intIndexOfMatch = strText.indexOf(strTarget);
    }
    return (strText);
}

function keypress(e) {
    var keypressed = null;
    if (window.event) {
        keypressed = window.event.keyCode; //IE
    }
    else {
        keypressed = e.which; //NON-IE, Standard
    }
    if (keypressed < 48 || keypressed > 57) {
        if (keypressed == 8 || keypressed == 127 || keypressed == 0) { this.blur(); return; }
        return false;
    }
}
