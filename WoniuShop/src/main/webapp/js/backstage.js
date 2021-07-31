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















