//用户
//全选全消
$(function () {
    let $users = $('input[name="users"]');
    let total = $('input[name="users"]').length;

    //全选全消
    $('#uall').click(function () {
        let flag = this.checked;
        $users.prop("checked", flag);
    });
    $users.click(function () {
        let count = $('input[name="users"]').filter(":checked").length;
        $('#uall').prop("checked", count === total);
    });
});

//删除
function deleteUser(id) {
    let flag = confirm("您确认要删除" + id + "号用户吗?");
    if (flag) {
        location.href = "page/admin/user?m=deleteByIds&uid=" + id
    }
}

function deleteUsers() {
    let $ids = $('input[name="users"]').filter(":checked")
    if ($ids.length === 0) {
        alert("没有选择的用户")
        return;
    }
    let idStr = "";
    let idRes = "";
    for (let i = 0; i < $ids.length; i++) {
        idRes += "uid=" + $ids.eq(i).val();
        idStr += $ids.eq(i).val();
        if (i !== $ids.length - 1) {
            idStr += ",";
            idRes += "&"
        }
    }
    let flag = confirm("您确认要删除" + idStr + "号用户吗?");
    if (flag) {
        location.href = "page/admin/user?m=deleteByIds&" + idRes;
    }
}

// 添加
function addUser() {
    $('#addUserModal').modal('show');
}

$(function () {
    let r_nameFlag = false;
    let pwdFlag = false;
    let phoneFlag = false;
    let emailFlag = false;
    $('#r_username').blur(function () {
        let checkUserSpan = $('#checkUserSpan');
        let uname = $(this).val(); //获取输入框中的内容
        if ("" == uname) {
            checkUserSpan.html("用户名只能是字母且6-16位");
            checkUserSpan.css({"color": "black"});
            r_nameFlag = false;
            return;
        }
        let unamePattern = /^[a-zA-Z][a-zA-Z0-9]*$/;
        if (!unamePattern.test(uname)) {
            alert("请输入正确的用户名");
            $(this).val("");
            checkUserSpan.html("");
            return;
        }
        $.ajax({
            url: "user",
            type: "get",
            data: {m: "checkName", l_username: uname},
            dataType: "text",
            success: function (text) {
                if ("Y" == text) { //存在
                    checkUserSpan.html("&times;该用户名已存在");
                    checkUserSpan.css({"color": "red"});
                    r_nameFlag = false;

                } else if ("N" == text) {
                    checkUserSpan.html("√ &nbsp;用户名可用")
                    checkUserSpan.css({"color": "green"});
                    r_nameFlag = true;
                }
            }
        })
    })
    $('#r_pwd').blur(function () {
        let pwd = $(this).val();
        let $repwd = $('#r_repwd');
        let $rpwdSpan = $('#rpwdSpan');
        let $rrepwdSpan = $('#rrepwdSpan');
        if (pwd == "") {
            $rpwdSpan.css({"color": "black"});
            $rpwdSpan.html("6-16位字母数字下划线组成");
            pwdFlag = false;
            $rrepwdSpan.html("")
            return;
        }
        let pwdPattern = /^[0-9a-zA-Z_]{6,16}$/;
        if (!pwdPattern.test(pwd)) {
            pwdFlag = false;
            alert("密码格式错误")
            $(this).val("");
            $rpwdSpan.html("6-16位字母数字下划线组成");
            $rpwdSpan.css({"color": "black"});
            $rrepwdSpan.html("")
        } else {
            $rpwdSpan.html("√")
            $rpwdSpan.css({"color": "green"});
            if ($repwd.val() == pwd) {
                $rrepwdSpan.html("√")
                $rrepwdSpan.css({"color": "green"});
                pwdFlag = true;
            } else if ($repwd.val() != "") {
                $rrepwdSpan.html("&times")
                $rrepwdSpan.css({"color": "red"});
                pwdFlag = false;
            } else {
                pwdFlag = false;
            }
        }
    })
    $('#r_repwd').blur(function () {
        let $rrepwdSpan = $('#rrepwdSpan');
        let $r_pwd = $('#r_pwd');
        let repwd = $(this).val();
        if ($r_pwd.val() == "") {
            return;
        }
        if ($r_pwd.val() == repwd) {
            $rrepwdSpan.html("√")
            $rrepwdSpan.css({"color": "green"});
            pwdFlag = true;
        } else {
            $rrepwdSpan.html("&times")
            $rrepwdSpan.css({"color": "red"});
            pwdFlag = false;
        }
    })
    $('#r_phone').blur(function () {
        let phone = $(this).val();
        let $span = $('#rphoneSpan');
        if (phone == "") {
            $span.html("");
            phoneFlag = false;
            return;
        }
        let phonePattern = /^[1][1-9][0-9]{9}$/
        if (!phonePattern.test(phone)) {
            phoneFlag = false;
            alert("手机号格式错误");
            $span.html("");
            $(this).val("");
        } else {
            phoneFlag = true;
            $span.html("√")
            $span.css({"color": "green"});
        }
    })
    $('#r_email').blur(function () {
        let email = $(this).val();
        let $span = $('#remailSpan');
        if (email == "") {
            $span.html("");
            emailFlag = false;
            return;
        }
        let emailPattern = /^[a-z0-9A-Z]+[a-z0-9A-Z._]*@[a-z0-9A-Z]+\.[a-zA-Z]{2,}$/
        if (!emailPattern.test(email)) {
            emailFlag = false;
            alert("邮箱格式错误");
            $span.html("");
            $(this).val("");
        } else {
            emailFlag = true;
            $span.html("√")
            $span.css({"color": "green"});
        }
    })
    $('#r_realName').blur(function () {
        let realName = $(this).val();
        if (realName == "") {
            return;
        }
        let realNamePattern = /^[\u4e00-\u9fa5]+$/;
        if (!realNamePattern.test(realName)) {
            alert("请输入真实中文名");
            $(this).val("");
        }
    });
    $('#r_idCard').blur(function () {
        let idCard = $(this).val();
        if (idCard == "") {
            return;
        }
        let idCardPattern = /^[0-9]{18}$/;
        if (!idCardPattern.test(idCard)) {
            alert("请输入18位身份证号");
            $(this).val("");
        }
    });


    $('#register_btn').click(function () {
        if (r_nameFlag && pwdFlag && phoneFlag && emailFlag) {
            $('#addUserForm').submit();
        } else {
            alert("请正确填写所有信息");
        }
    })
})
$(function () {
    // 1. 头像预览
    $('#r_image').change(function () {
        let file = this.files[0];
        let imgPattern = /image\/\w+/;// 用来匹配以 image/
        if (!imgPattern.test(file.type)) {
            alert("文件必须为图片！");
            imgFlag = false;
            addFlag = false;
            return false;
        }
        let reader = new FileReader(); // 创建文件预览器
        reader.readAsDataURL(file);
        reader.onload = function () {
            $('#h_showImg').html("<img src=" + this.result + " width='160px';height='160px' >");
            $('#h_showImg').slideDown(1000);
        }
    });
});


//编辑
function editUser(obj) {
    $('#e_h_showImg').hide(); // 让图片预览隐藏
    let tds = $(obj).parent().parent().children();
    let id = tds.eq(1).text();
    let name = tds.eq(2).text();
    let phone = tds.eq(3).text();
    let level = tds.eq(5).text();
    let birthday = tds.eq(8).text();
    let realName = tds.eq(9).text();
    let idCard = tds.eq(10).text();
    let email = tds.eq(11).text();

    $('#eid').val(id);
    $('#e_username').val(name);
    $('#e_phone').val(phone);
    $('#e_email').val(email);
    if (birthday != '') {
        $('#e_birthday').val(birthday);
        $('#e_birthday').attr("disabled", true)
    }
    if (realName != '') {
        $('#e_realName').val(realName);
        $('#e_realName').attr("disabled", true)
    }
    if (idCard != '') {
        $('#e_idCard').val(idCard);
        $('#e_idCard').attr("disabled", true)
    }
    if (level == "普通用户") {
        $('#e_level1').attr("checked", true)
    } else if (level == "vip") {
        $('#e_level2').attr("checked", true)
    } else {
        $('#e_level3').attr("checked", true)
    }
    $('#editUserModal').modal('show');
}

$(function () {
    let pwdFlag = true;
    $('#e_pwd').blur(function () {
        let pwd = $(this).val();
        let $repwd = $('#e_repwd');
        let $rpwdSpan = $('#epwdSpan');
        let $rrepwdSpan = $('#erepwdSpan');
        if (pwd == "") {
            $rpwdSpan.css({"color": "black"});
            $rpwdSpan.html("6-16位字母数字下划线组成");
            pwdFlag = false;
            $rrepwdSpan.html("")
            return;
        }
        let pwdPattern = /^[0-9a-zA-Z_]{6,16}$/;
        if (!pwdPattern.test(pwd)) {
            pwdFlag = false;
            alert("密码格式错误")
            $(this).val("");
            $rpwdSpan.html("6-16位字母数字下划线组成");
            $rpwdSpan.css({"color": "black"});
            $rrepwdSpan.html("")
        } else {
            $rpwdSpan.html("√")
            $rpwdSpan.css({"color": "green"});
            if ($repwd.val() == pwd) {
                $rrepwdSpan.html("√")
                $rrepwdSpan.css({"color": "green"});
                pwdFlag = true;
            } else if ($repwd.val() != "") {
                $rrepwdSpan.html("&times")
                $rrepwdSpan.css({"color": "red"});
                pwdFlag = false;
            } else {
                pwdFlag = false;
            }
        }
    })
    $('#e_repwd').blur(function () {
        let $rrepwdSpan = $('#erepwdSpan');
        let $e_pwd = $('#e_pwd');
        let repwd = $(this).val();
        if ($e_pwd.val() == "") {
            return;
        }
        if ($e_pwd.val() == repwd) {
            $rrepwdSpan.html("√")
            $rrepwdSpan.css({"color": "green"});
            pwdFlag = true;
        } else {
            $rrepwdSpan.html("&times")
            $rrepwdSpan.css({"color": "red"});
            pwdFlag = false;
        }
    })
    $('#e_phone').blur(function () {
        let phone = $(this).val();
        let $span = $('#e_rphoneSpan');
        if (phone == "") {
            $span.html("");
            return;
        }
        let phonePattern = /^[1][1-9][0-9]{9}$/
        if (!phonePattern.test(phone)) {
            alert("手机号格式错误");
            $span.html("");
            $(this).val("");
        } else {
            $span.html("√")
            $span.css({"color": "green"});
        }
    })
    $('#e_email').blur(function () {
        let email = $(this).val();
        let $span = $('#e_remailSpan');
        if (email == "") {
            $span.html("");
            return;
        }
        let emailPattern = /^[a-z0-9A-Z]+[a-z0-9A-Z._]*@[a-z0-9A-Z]+\.[a-zA-Z]{2,}$/
        if (!emailPattern.test(email)) {
            alert("邮箱格式错误");
            $span.html("");
            $(this).val("");
        } else {
            $span.html("√")
            $span.css({"color": "green"});
        }
    })
    $('#e_realName').blur(function () {
        let realName = $(this).val();
        if (realName == "") {
            return;
        }
        let realNamePattern = /^[\u4e00-\u9fa5]+$/;
        if (!realNamePattern.test(realName)) {
            alert("请输入真实中文名");
            $(this).val("");
        }
    });
    $('#e_idCard').blur(function () {
        let idCard = $(this).val();
        if (idCard == "") {
            return;
        }
        let idCardPattern = /^[0-9]{18}$/;
        if (!idCardPattern.test(idCard)) {
            alert("请输入18位身份证号");
            $(this).val("");
        }
    });

    $('#e_register_btn').click(function () {
        if (pwdFlag) {
            $('#editUserForm').submit();
        } else {
            alert("请正确填写密码");
        }
    })
})
$(function () {
    // 1. 头像预览
    $('#e_image').change(function () {
        let file = this.files[0];
        let imgPattern = /image\/\w+/;// 用来匹配以 image/
        if (!imgPattern.test(file.type)) {
            alert("文件必须为图片！");
            imgFlag = false;
            addFlag = false;
            return false;
        }
        let reader = new FileReader(); // 创建文件预览器
        reader.readAsDataURL(file);
        reader.onload = function () {
            $('#e_h_showImg').html("<img src=" + this.result + " width='160px';height='160px' >");
            $('#e_h_showImg').slideDown(2000);
        }
    });
});
// 往上是用户





//商品
//展示商品
let totalPage = 0;
let keyword = -1;
let fromPrice = -1;
let toPrice = -1;

function currentPage(num, kw, fp, tp) {
    keyword = kw;
    fromPrice = fp;
    toPrice = tp;

    $.ajax({
        url: "product",
        type: "post",
        data: {m: "showByKeyword", currentPage: num, keyword: keyword, fromPrice: fp, toPrice: tp},
        dataType: "json",
        success: function (info) {
            totalPage = info.pages;
            let trs = "";
            for (let pro of info.list) {
                let type = "刀";
                if (pro.ptype == 1) {
                    type = "枪"
                } else if (pro.ptype == 2) {
                    type = "手套"
                } else if (pro.ptype == 3) {
                    type = "杂项"
                } else if (pro.ptype == 4) {
                    type = "印花"
                }

                let status = "上架";
                if (pro.status == 1) {
                    status = "下架";
                }
                trs += " <tr>\n" +
                    "        <td><input type='checkbox' name='products' value='"+pro.id+"'></td>\n" +
                    "        <td>" + pro.id + "</td>\n" +
                    "        <td>" + pro.pname + "</td>\n" +
                    "        <td><img src='" + pro.image + "' width='60px' alt=''>\n</td>\n" +
                    "     <td>" + pro.price + "元</td>\n" +
                    "     <td>" + pro.stock + "</td>\n" +
                    "     <td>" + pro.sale + "</td>\n" +
                    "     <td>" + type + "</td>\n" +
                    "     <td>" + status + "</td>\n" +
                    "     <td><button class='btn btn-danger' onclick='deletePros("+pro.id+")'>" +
                    "         <span class='glyphicon glyphicon-remove'></span>删除</button></td>" +
                    "    <td><button class='btn btn-primary' onclick='showeEdit(this)'><span" +
                    "             class='glyphicon glyphicon-pencil'></span>修改</button></td>" +
                    "<td style='display: none'>"+pro.pinfo+"</td>"
                    " </tr>"
            }
            $('#pro_content').html(trs);
            let lis = "<li><a href='javascript:;' onclick='prePage(" + info.pageNum + ")'>上一页</a></li>";
            for (let i = 1; i <= info.pages; i++) {
                if (i == info.pageNum) {
                    lis += "<li class='active'><a href='javascript:;'>" + i + "</a></li>"
                } else {
                    lis += "<li><a href='javascript:;' onclick='currentPage(" + i + "," + keyword + "," + fromPrice + "," + toPrice + ")'>" + i + "</a></li>"
                }
            }
            lis += "<li><a href='javascript:;' onclick='nextPage(" + info.pageNum + ")'>下一页</a></li>";
            $('#proPageNav').html(lis);
            checkBoxClick();
        }
    });
}

function checkBoxClick() {
    let $products = $('input[name="products"]');
    let total = $('input[name="products"]').length;

    //全选全消
    $('#pall').click(function () {
        let flag = this.checked;
        $products.prop("checked", flag);
    });
    $products.click(function () {
        let count = $('input[name="products"]').filter(":checked").length;
        $('#pall').prop("checked", count === total);
    });
}

//删除
function deleteAjax(ids) {
    $.ajax({
        url: "product",
        type: "post",
        traditional: "true",//数组选项
        data: {m: "deleteByIds", ids: ids},
        dataType: "text",
        success: function (text) {
            if ("Y" == text) {
                alert("删除成功")
                currentPage(1, keyword,fromPrice,toPrice);
            } else if ("N" == text) {
                alert("删除失败")
            }
        }
    })
}
function deletePros(id) {
    let flag = confirm("您确认要删除" + id + "号商品吗?");
    if (flag) {
        deleteAjax(id);
    }
}

function deleteAll() {
    let $ids = $('input[name="products"]').filter(":checked")
    if ($ids.length === 0) {
        alert("没有选择的商品")
        return;
    }
    let ids=[];
    let idStr = "";
    for (let i = 0; i < $ids.length; i++) {
        ids[i]=$ids.eq(i).val();
        idStr += ids[i];
        if (i != $ids.length-1) {
            idStr += ",";
        }
    }
    let flag = confirm("您确认要删除" + idStr + "号商品吗?");
    if (flag) {
        deleteAjax(ids);
    }
}

//ajax查询上一页
function prePage(num) {
    if (num == 1) {
        currentPage(totalPage, keyword, fromPrice, toPrice)
    } else {
        currentPage(num - 1, keyword, fromPrice, toPrice)
    }
}

//ajax查询下一页
function nextPage(num) {
    if (num == totalPage) {
        currentPage(1, keyword, fromPrice, toPrice)
    } else {
        currentPage(num + 1, keyword, fromPrice, toPrice)
    }
}

//添加
$(function () {

    //搜索按钮
    $('#pro_search').click(function () {
        let kw = $('#pname').val()
        let fp = $('#start').val()
        let tp = $('#end').val()
        keyword = kw == '' ? -1 : kw
        fromPrice = fp == '' ? -1 : fp
        toPrice = tp == '' ? -1 : tp
        currentPage(1, keyword, fromPrice, toPrice);
    })

    //标签页按钮
    $('#pro-btn').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
        keyword = -1;
        fromPrice = -1;
        toPrice = -1;
        currentPage(1, keyword, fromPrice, toPrice)
    })

    // 1. 头像预览
    let imgFlag = false;
    $('#add_image').change(function () {
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
            $('#add_showImg').html("<img src=" + this.result + " width='160px';height='160px' >");
            $('#add_showImg').slideDown(1000);
            imgFlag = true;
        }
    });

    let priceFlag = false;
    $('#add_price').blur(function () {
        let price = $(this).val();
        if (price == '') {
            priceFlag = false;
            return;
        }
        let pricePattern = /^([1-9][0-9]*)|([1-9][0-9]*\.[0-9]+)$/;
        if (!pricePattern.test(price)) {
            alert("请输入正确价格")
            priceFlag = false;
            $('#add_price').val("");
        } else {
            priceFlag = true;
        }
    })
    let stockFlag = false;
    $('#add_stock').blur(function () {
        let stock = $(this).val();
        if (stock == '') {
            stockFlag = false;
            return;
        }
        let stockPattern = /^[0-9]+$/;
        if (!stockPattern.test(stock)) {
            alert("请输入正确价格")
            stockFlag = false;
            $('#add_stock').val("");
        } else {
            stockFlag = true;
        }
    })
    let saleFlag = false;
    $('#add_sale').blur(function () {
        let sale = $(this).val();
        if (sale == '') {
            saleFlag = false;
            return;
        }
        let salePattern = /^[0-9]+$/;
        if (!salePattern.test(sale)) {
            alert("请输入正确价格")
            saleFlag = false;
            $('#add_sale').val("");
        } else {
            saleFlag = true;
        }
    })
    let pInfoFlag = false;
    $('#add_pinfo_area').blur(function () {
        let pInfo = $(this).val();
        if (pInfo == '') {
            pInfoFlag = false;
            alert("请输入商品描述信息")
            return;
        }
        pInfoFlag = true;
    })


    $('#add_proBtn').click(function () {
        if (!priceFlag || !imgFlag || !saleFlag || !stockFlag || !pInfoFlag) {
            alert("请输入正确商品信息")
            return;
        }
        $('#add_pinfo').val($('#add_pinfo_area').val());
        $.ajax({
            url: "product",
            type: "post",
            data: new FormData($('#pro_addForm')[0]),
            contentType: false,
            processData: false,
            dataType: "text",
            success: function (text) {
                if ("Y" == text) {
                    alert("添加成功")
                    currentPage(1, keyword,fromPrice,toPrice);
                } else if ("N" == text) {
                    alert("添加失败")
                }

                $('#addProModal').modal('hide')
            }
        })
    })

    
});


//修改
function showeEdit(obj){
    $('#e_add_showImg').hide(); // 让图片预览隐藏
    let tds = $(obj).parent().parent().children();
    let id=tds.eq(1).text();
    let name = tds.eq(2).text();
    let priceStr = tds.eq(4).text();
    let price=priceStr.substr(0,priceStr.indexOf('元'))
    let stock = tds.eq(5).text();
    let sale = tds.eq(6).text();
    let type = tds.eq(7).text();
    let status = tds.eq(8).text();
    let info = tds.eq(11).text();


    $('#pid').val(id);
    $('#e_add_pname').val(name);
    $('#e_add_pinfo_area').val(info);
    $('#e_add_price').val(price);
    $('#e_add_stock').val(stock);
    $('#e_add_sale').val(sale);
    if (type == '刀') {
        $("#e_add_ptype>option[value='0']").prop("selected", true);
    }else if (type == '枪') {
        $("#e_add_ptype option[value='1']").prop("selected", true)
    }else if (type == "手套") {
        $("#e_add_ptype option[value='2']").prop("selected", true)
    }else if (type == "杂项") {
        $("#e_add_ptype option[value='3']").prop("selected", true)
    }else if (type == "印花") {
        $("#e_add_ptype option[value='4']").prop("selected", true)
    }

    if (status == '上架') {
        $("#e_add_status>option[value='0']").prop("selected", true);
    }else if (status == '下架') {
        $("#e_add_status option[value='1']").prop("selected", true)
    }


    $('#editProModal').modal('show');
}

$(function () {

    // 1. 头像预览
    let imgFlag = true;
    $('#e_add_image').change(function () {
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
            $('#e_add_showImg').html("<img src=" + this.result + " width='160px';height='160px' >");
            $('#e_add_showImg').slideDown(1000);
            imgFlag = true;
        }
    });


    $('#e_add_price').blur(function () {
        let price = $(this).val();
        if (price == '') {
            return;
        }
        let pricePattern = /^([1-9][0-9]*)|([1-9][0-9]*\.[0-9]+)$/;
        if (!pricePattern.test(price)) {
            alert("请输入正确价格")
            $('#e_add_price').val("");
        }
    })

    $('#e_add_stock').blur(function () {
        let stock = $(this).val();
        if (stock == '') {
            return;
        }
        let stockPattern = /^[0-9]+$/;
        if (!stockPattern.test(stock)) {
            alert("请输入正确价格")
            $('#e_add_stock').val("");
        }
    })

    $('#e_add_sale').blur(function () {
        let sale = $(this).val();
        if (sale == '') {
            return;
        }
        let salePattern = /^[0-9]+$/;
        if (!salePattern.test(sale)) {
            alert("请输入正确价格")
            $('#e_add_sale').val("");
        }
    })

    // $('#e_add_pinfo_area').blur(function () {
    //     let pInfo = $(this).val();
    //     if (pInfo == '') {
    //         alert("请输入商品描述信息")
    //         return;
    //     }
    // })


    $('#e_add_proBtn').click(function () {
        if ( !imgFlag) {
            alert("请添加商品图片")
            return;
        }
        $('#e_add_pinfo').val($('#e_add_pinfo_area').val());
        $.ajax({
            url: "product",
            type: "post",
            data: new FormData($('#pro_editForm')[0]),
            contentType: false,
            processData: false,
            dataType: "text",
            success: function (text) {
                if ("Y" == text) {
                    alert("修改成功")
                    currentPage(1, keyword,fromPrice,toPrice);
                } else if ("N" == text) {
                    alert("修改失败")
                }
                $('#editProModal').modal('hide')
            }
        })
    })
})

//向上是商品

//商品
//展示商品
let or_totalPage = 0;

function or_currentPage(num, ono, status, pname) {

    $.ajax({
        url: "order",
        type: "post",
        data: {m: "showByKeyword", currentPage: num, ono: ono, status: status, pname: pname},
        dataType: "json",
        success: function (info) {
            or_totalPage = info.pages;
            let trs = "";
            for (let map of info.list) {
                let endStr="暂无";
                if (map.order.endTime!='undefined'){
                    alert(map.order.endTime)
                    endStr=map.order.endTime;
                }
                let status='未付款';
                let sd=map.order.status
                if (sd=='2'){
                    status='已付款';
                }else if (sd='3'){
                    status='已付款';
                }else if (sd=='4'){
                    status='已付款';
                }


                trs += "<tr>\n" +
                    "                            <td><input type='checkbox' name='orders' value=''></td>\n" +
                    "                            <td>"+map.order.ono+"</td>\n" +
                    "                            <td>"+map.product.pname+"</td>\n" +
                    "                            <td>\n" +
                    "                                <img src='"+map.product.image+"' width='60px' alt=''>\n" +
                    "                            </td>\n" +
                    "                            <td>"+map.product.price+"元</td>\n" +
                    "                            <td>"+map.order.num+"</td>\n" +
                    "                            <td>"+(map.order.num*map.product.price)+"元</td>\n" +
                    "                            <td>"+map.order.startTime+"</td>\n" +
                    "                            <td>"+endStr+"</td>\n" +
                    "                            <td>"+status+"</td>\n" +
                    "                            <td><a href='#' class='btn btn-danger'><span\n" +
                    "                                    class='glyphicon glyphicon-remove'></span>删除</a></td>\n" +
                    "                        </tr>"
            }
            $('#ori_content').html(trs);
            // let lis = "<li><a href='javascript:;' onclick='prePage(" + info.pageNum + ")'>上一页</a></li>";
            // for (let i = 1; i <= info.pages; i++) {
            //     if (i == info.pageNum) {
            //         lis += "<li class='active'><a href='javascript:;'>" + i + "</a></li>"
            //     } else {
            //         lis += "<li><a href='javascript:;' onclick='or_currentPage(" + i + "," + keyword + "," + fromPrice + "," + toPrice + ")'>" + i + "</a></li>"
            //     }
            // }
            // lis += "<li><a href='javascript:;' onclick='nextPage(" + info.pageNum + ")'>下一页</a></li>";
            // $('#proPageNav').html(lis);
            // checkBoxClick();
        }
    });
}
//
// function checkBoxClick() {
//     let $products = $('input[name="products"]');
//     let total = $('input[name="products"]').length;
//
//     //全选全消
//     $('#pall').click(function () {
//         let flag = this.checked;
//         $products.prop("checked", flag);
//     });
//     $products.click(function () {
//         let count = $('input[name="products"]').filter(":checked").length;
//         $('#pall').prop("checked", count === total);
//     });
// }
//
// //删除
// function deleteAjax(ids) {
//     $.ajax({
//         url: "product",
//         type: "post",
//         traditional: "true",//数组选项
//         data: {m: "deleteByIds", ids: ids},
//         dataType: "text",
//         success: function (text) {
//             if ("Y" == text) {
//                 alert("删除成功")
//                 or_currentPage(1, keyword,fromPrice,toPrice);
//             } else if ("N" == text) {
//                 alert("删除失败")
//             }
//         }
//     })
// }
// function deletePros(id) {
//     let flag = confirm("您确认要删除" + id + "号商品吗?");
//     if (flag) {
//         deleteAjax(id);
//     }
// }
//
// function deleteAll() {
//     let $ids = $('input[name="products"]').filter(":checked")
//     if ($ids.length === 0) {
//         alert("没有选择的商品")
//         return;
//     }
//     let ids=[];
//     let idStr = "";
//     for (let i = 0; i < $ids.length; i++) {
//         ids[i]=$ids.eq(i).val();
//         idStr += ids[i];
//         if (i != $ids.length-1) {
//             idStr += ",";
//         }
//     }
//     let flag = confirm("您确认要删除" + idStr + "号商品吗?");
//     if (flag) {
//         deleteAjax(ids);
//     }
// }
//
// //ajax查询上一页
// function prePage(num) {
//     if (num == 1) {
//         or_currentPage(or_totalPage, keyword, fromPrice, toPrice)
//     } else {
//         or_currentPage(num - 1, keyword, fromPrice, toPrice)
//     }
// }
//
// //ajax查询下一页
// function nextPage(num) {
//     if (num == or_totalPage) {
//         or_currentPage(1, keyword, fromPrice, toPrice)
//     } else {
//         or_currentPage(num + 1, keyword, fromPrice, toPrice)
//     }
// }

//添加
$(function () {

    // //搜索按钮
    // $('#pro_search').click(function () {
    //     let kw = $('#pname').val()
    //     let fp = $('#start').val()
    //     let tp = $('#end').val()
    //     keyword = kw == '' ? -1 : kw
    //     fromPrice = fp == '' ? -1 : fp
    //     toPrice = tp == '' ? -1 : tp
    //     or_currentPage(1, keyword, fromPrice, toPrice);
    // })

    //标签页按钮
    $('#ori-btn').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
        or_currentPage(1, '-1', '-1', '-1')
    })
    
    
    
    
    
    
    
    
    
    
    
})





