$(function () {
    //标签页按键
    $('#address-btn').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
        let id = $('#id').val();
        if (id == '') {
            return;
        }
        showAllAdd(id);
    })

    //设置默认按键
    $('#setDefault').click(function () {
        let flag = this.checked;
        if (flag) {
            $('#isdefault').val("true")
        } else {
            $('#isdefault').val("false")
        }
    })
    let nameFlag = false;
    let phoneFlag = false;
    let fullAddressFlag = false;
    $('#add_name').blur(function () {
        let name = $(this).val();
        if (name == '') {
            nameFlag = false;
            return;
        }
        let namePattern = /^[a-zA-Z]+$/;
        if (!namePattern.test(name)) {
            alert("请正确输入收货人姓名");
            nameFlag = false;
            $(this).val("");
        } else {
            nameFlag = true;
        }
    })
    $('#add_phone').blur(function () {
        let phone = $(this).val();
        if (phone == '') {
            phoneFlag = false;
            return;
        }
        let phonePattern = /^[1][0-9]{10}$/;
        if (!phonePattern.test(phone)) {
            alert("请正确输入收货人手机号");
            phoneFlag = false;
            $(this).val("");
        } else {
            phoneFlag = true;
        }
    })
    $('#fullAddress').blur(function () {
        let fullAddress = $(this).val();
        if (fullAddress == '') {
            fullAddressFlag = false;
            return;
        }
        fullAddressFlag = true;
        // let fullAddressPattern = /^*$/;
        // if (!fullAddressPattern.test(fullAddress)) {
        //     alert("请正确输入具体地址");
        //     fullAddressFlag = false;
        //     $(this).val("");
        // } else {
        //     fullAddressFlag = true;
        // }
    })
    //添加按钮
    $('#add_add_btn').click(function () {
        if (!nameFlag || !phoneFlag || !fullAddressFlag) {
            alert("请正确填写所有信息")
            return;
        }
        let $province = $('#province option:selected');
        let $city = $('#city option:selected');
        let $district = $('#district option:selected');
        if ($province.val() == -1 || $city.val() == -1 || $district.val() == -1) {
            alert("请正确选择省市区");
            return;
        }
        $('#districtCode').val($district.val());
        $province.val($province.text());
        $city.val($city.text());
        $district.val($district.text());
        let id = $('#id').val();
        $.ajax({
            url: "address",
            type: "post",
            data: $('#addAddForm').serialize(),
            datatype: "text",
            success: function (text) {
                if ("Y" == text) {
                    alert("添加成功");
                    $('#addAddress').modal('hide');
                    showAllAdd(id);
                } else if ("N" == text) {
                    alert("失败")
                }
            }
        })
    })

})

//展示地址
function showAllAdd(id) {
    $.ajax({
        url: "address",
        type: "get",
        data: {m: "showAll", uid: id},
        dataType: "json",
        success: function (list) {
            let trs = ""
            for (let add of list) {
                trs += "<tr><td>" + add.username + "</td><td>" + add.mobile + "</td><td>" + add.area + "</td><td>" + add.location + "</td><td>" + add.postcode + "</td><td>";
                if (add.isDefault == 1) {
                    trs += "<span class='default-addr'>默认地址</span></td>"
                } else {
                    trs += "<span class='btn btn-success' onclick='setDefault(" + add.id + "," + add.uid + ")'>设置默认</span></td>"
                }
                trs += "<td><button class='btn btn-info' onclick='editAdd(this," + add.id + ")'>修改</button></td><td><button class='btn btn-danger' onclick='deleteById(" + add.id + ")'>删除</button></td></tr>"
            }
            $("#add_content").html(trs);
        }
    })
}

// 编辑按钮
function editAdd(obj, id) {
    $('#add_id').val(id)

    let trs = $(obj).parent().parent().children();

    $('#e_add_name').val(trs.eq(0).text());
    $('#e_add_phone').val(trs.eq(1).text());

    $('#e_fullAddress').val(trs.eq(3).text());
    let area = trs.eq(2).text();
    $('#origin_address').text(area);
    // let strs = area.split(" ");
    // if (strs.length == 2) {
    //     $('#e_province').prepend("<option class='sr-only' value='" + strs[0] + "' selected>" + strs[0] + "</option>")
    //     $('#e_city').prepend("<option class='sr-only' value='" + strs[0] + "' selected>" + strs[0] + "</option>")
    //     $('#e_district').prepend("<option class='sr-only' value='" + strs[1] + "' selected>" + strs[1] + "</option>")
    //
    // } else {
    //     $('#e_province').prepend("<option class='sr-only' value='" + strs[0] + "' selected>" + strs[0] + "</option>")
    //     $('#e_city').prepend("<option class='sr-only' value='" + strs[1] + "' selected>" + strs[1] + "</option>")
    //     $('#e_district').prepend("<option class='sr-only' value='" + strs[2] + "' selected>" + strs[2] + "</option>")
    // }

    let str = trs.eq(5).children().text();
    if (str[0] == '默') {
        $('#e_setDefault').prop('checked', true)
        $('#e_isdefault').val("true")
    } else {
        $('#e_setDefault').prop('checked', false)
        $('#e_isdefault').val("false")
    }


    $('#editAddress').modal('show');

}

//修改地址表单
$(function () {
    $('#e_setDefault').click(function () {
        let flag = this.checked;
        if (flag) {
            $('#e_isdefault').val("true")
        } else {
            $('#e_isdefault').val("false")
        }
    })

    $('#e_add_name').blur(function () {
        let name = $(this).val();
        if (name == '') {
            return;
        }
        let namePattern = /^[a-zA-Z]+$/;
        if (!namePattern.test(name)) {
            alert("请正确输入收货人姓名");
            $(this).val("");
        }
    })
    $('#e_add_phone').blur(function () {
        let phone = $(this).val();
        if (phone == '') {
            return;
        }
        let phonePattern = /^[1][0-9]{10}$/;
        if (!phonePattern.test(phone)) {
            alert("请正确输入收货人手机号");
            $(this).val("");
        }
    })
    $('#e_fullAddress').blur(function () {
        let fullAddress = $(this).val();
        if (fullAddress == '') {
            return;
        }
        // let fullAddressPattern = /^*$/;
        // if (!fullAddressPattern.test(fullAddress)) {
        //     alert("请正确输入具体地址");
        //     fullAddressFlag = false;
        //     $(this).val("");
        // } else {
        //     fullAddressFlag = true;
        // }
    })
    $('#e_add_add_btn').click(function () {

        let $province = $('#e_province option:selected');
        let $city = $('#e_city option:selected');
        let $district = $('#e_district option:selected');
        if ($province.val() == -1 && $city.val() == -1 && $district.val() == -1) {
            $('#e_districtCode').val(-1);
        } else if ($province.val() == -1 || $city.val() == -1 || $district.val() == -1) {
            alert("请正确选择省市区");
            return;
        } else {
            $('#e_districtCode').val($district.val());
            $province.val($province.text());
            $city.val($city.text());
            $district.val($district.text());
        }

        $.ajax({
            url: "address",
            type: "post",
            data: $('#editAddForm').serialize(),
            datatype: "text",
            success: function (text) {
                if ("Y" == text) {
                    alert("修改成功");
                    $('#e_addAddress').modal('hide');
                    showAllAdd($('#id').val());
                } else if ("N" == text) {
                    alert("修改失败")
                }
                $('#editAddress').modal('hide');
            }
        })
    })
})


function deleteById(id) {
    let flag = confirm("您确认要删除此地址吗?");
    if (flag) {
        $.ajax({
            url: "address",
            type: "get",
            data: {m: "remove", id: id},
            dataType: "text",
            success: function (text) {
                if ("Y" == text) {
                    alert("删除成功");
                    showAllAdd($('#id').val());
                } else if ("N" == text) {
                    alert("删除失败")
                }
            }
        })
    }
}

function setDefault(id, uid) {
    let flag = confirm("您确认将此地址设为默认?");
    if (flag) {
        $.ajax({
            url: "address",
            type: "get",
            data: {m: "setDefault", id: id, uid: uid},
            dataType: "text",
            success: function (text) {
                if ("Y" == text) {
                    alert("设置成功");
                    showAllAdd($('#id').val());
                } else if ("N" == text) {
                    alert("设置失败")
                }
            }
        })
    }
}

$(function () {
    let oriName = $('#user').val();
    let oriPhone = $('#mobile').val();
    let imgFlag = true;

    $('#user').blur(function () {
        let username = $(this).val();
        let namePattern = /^[a-zA-Z][a-zA-Z0-9]*$/;
        if (!namePattern.test(username)) {
            alert("请正确输入正确用户名");
            $(this).val(oriName);
        }
    })

    $('#pwd').blur(function () {

        let pwd = $(this).val();
        if (pwd == '') {
            return;
        }
        let pwdPattern = /^[0-9a-zA-Z]{6,16}$/;
        if (!pwdPattern.test(pwd)) {
            alert("请正确输入正确密码:6-16位字母数字");
            $(this).val("");
        }
    })
    $('#mobile').blur(function () {
        let phone = $(this).val();
        let phonePattern = /^[1][0-9]{10}$/;
        if (!phonePattern.test(phone)) {
            alert("请正确输入手机号");
            $(this).val(oriPhone);
        }
    })

    // 1. 头像预览
    $('#myImg').change(function () {
        let file = this.files[0];
        let imgPattern = /image\/\w+/;// 用来匹配以 image/
        if (!imgPattern.test(file.type)) {
            alert("文件必须为图片！");
            imgFlag = false;
            return false;
        }
        let reader = new FileReader(); // 创建文件预览器
        reader.readAsDataURL(file);
        reader.onload = function () {
            $('#myTitleImg').attr('src', this.result);
            imgFlag = true;
        }
    });

    $('#userConfirmBtn').click(function () {
        if (!imgFlag) {
            alert("请正确上传头像")
            return;
        }
        $('#userEditForm').submit();

    })
})


//订单
let or_totalPage = 0;

function or_currentPage(num) {
    let id = $('#uid').val();
    $.ajax({
        url: "order",
        type: "post",
        data: {m: "showByUid", currentPage: num, uid: id},
        dataType: "json",
        success: function (info) {

            or_totalPage = info.pages;
            let trs = "";
            for (let map of info.list) {
                let endStr = "暂无";
                if (map.order.hasOwnProperty("endTime")) {
                    endStr = map.order.endTime;
                }
                let statusStr = '未付款'; //1 未付款
                let sd = map.order.status
                if (sd == '2') {
                    statusStr = '已付款';
                } else if (sd == '3') {
                    statusStr = '已发货';
                } else if (sd == '4') {
                    statusStr = '已完成';
                }
                trs += "<tr>\n" +
                    "                            <td>" + map.order.ono + "</td>\n" +
                    "                            <td>\n" +
                    "                                <img src='" + map.product.image + "' width='60px' alt=''>\n" +
                    "                            </td>\n" +
                    "                            <td>" + map.product.price + "元</td>\n" +
                    "                            <td>" + map.order.num + "</td>\n" +
                    "                            <td>" + (map.order.num * map.product.price) + "元</td>\n" +
                    "                            <td>" + map.order.startTime + "</td>\n" +
                    "                            <td>" + endStr + "</td>\n" +
                    "                            <td>" + statusStr + "</td>\n" +
                    "                            <td><button type='button' class='btn btn-info' onclick='editOrder(" + map.order.status + "," + map.order.id + ")'>修改</button></td>" +
                    "                            <td><button type='button' class='btn btn-danger' onclick='o_deletePros(" + map.order.status + "," + map.order.id + ")'>删除</button></td>\n" +
                    "                            </tr>"
            }
            $('#ori_content').html(trs);
            let lis = "<li><a href='javascript:;' onclick='o_prePage(" + info.pageNum + ")'>上一页</a></li>";
            for (let i = 1; i <= info.pages; i++) {
                if (i == info.pageNum) {
                    lis += "<li class='active'><a href='javascript:;'>" + i + "</a></li>"
                } else {
                    lis += "<li><a href='javascript:;' onclick='or_currentPage(" + i + ")'>" + i + "</a></li>"
                }
            }
            lis += "<li><a href='javascript:;' onclick='o_nextPage(" + info.pageNum + ")'>下一页</a></li>";
            $('#oriPageNav').html(lis);
        }
    });
}

//修改
function editOrder(status, id) {
    let uid = $("#uid").val()
    if ('1' == status) {
        let flag = confirm("确定要跳转支付页面吗?");
        if (flag) {
            location.href = "order?m=showCommitedOrder&uid=" + uid;
        } else {
            return;
        }
    } else if ('2' == status) {
        alert("等待发货 无需操作");
    } else if ('3' == status) {
        let flag = confirm("要确定收货吗");
        if (flag) {
            location.href = "order?m=confirmOrder&id=" + id;

        } else {
            return;
        }
    } else if ('4' == status) {
        let flag = confirm("要去评论吗?");
        if (flag) {
            location.href = "order?m=showCommitedOrder&uid=" + uid;
        } else {
            return;
        }
    }
}

function confirmOrder(id) {

    $.ajax({
        url: "order",
        type: "post",
        data: {m: "confirmOrder", currentPage: num, uid: id},
        dataType: "json",
        success: function (info) {
        }
    })

}


//删除
function o_deleteAjax(ids) {
    $.ajax({
        url: "order",
        type: "post",
        traditional: "true",//数组选项
        data: {m: "deleteByIds", ids: ids},
        dataType: "text",
        success: function (text) {
            if ("Y" == text) {
                alert("删除成功")
                or_currentPage(1);
            } else if ("N" == text) {
                alert("删除失败")
            }
        }
    })
}

function o_deletePros(status, id) {
    if ("2" == status) {
        alert("已付款 无法删除")
        return;
    } else if ('3' == status) {
        alert("已发货 无法删除")
        return;
    }


    let flag = confirm("您确认要删除" + id + "号商品吗?");
    if (flag) {
        o_deleteAjax(id);
    }
}

//ajax查询上一页
function o_prePage(num) {
    if (num == 1) {
        or_currentPage(or_totalPage)
    } else {
        or_currentPage(num - 1)
    }
}

//ajax查询下一页
function o_nextPage(num) {
    if (num == or_totalPage) {
        or_currentPage(1)
    } else {
        or_currentPage(num + 1)
    }
}

//添加
$(function () {

    //标签页按钮
    $('#ori-btn').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
        or_currentPage(1)
    })


})


