// $(function () {
//     $('.modal').modal({
//         backdrop: "static",
//         keyboard : true,
//         show : false
//     });
// });
//登录按钮 ajax
$(function () {
    $('#login_btn').click(function () {
        let uname = $('#l_username').val();
        let pwd = $('#l_pwd').val();
        if (pwd == "" || uname == "") {
            alert("请填写完整的用户名,密码!");
            return;
        }
        let info = $('#info');
        $.ajax({
            url: "user",
            type: "post",
            data: {m: "login", l_username: uname, l_pwd: pwd},
            dataType: "text",
            success: function (text) {
                let name = '';
                if ("Y" == text) { //成功
                    info.html("登录成功")
                    name = uname;
                } else if ("N" == text) {
                    info.html("密码错误")
                }
                loginRes(name);
            }
        })
    })
})

//注册界面ajax
$(function () {
    let r_nameFlag = false;
    let pwdFlag = false;
    let phoneFlag = false;
    let emailFlag = false;
    let ragreeFlag = false;
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
    $('#ragree').click(function () {
        ragreeFlag = this.checked;
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
       let realName=$(this).val();
        if (realName==""){
            return;
        }
       let realNamePattern=/^[\u4e00-\u9fa5]+$/;
       if (!realNamePattern.test(realName)){
           alert("请输入真实中文名");
           $(this).val("");
       }
    });
    $('#r_idCard').blur(function () {
        let idCard=$(this).val();
        if (idCard==""){
            return;
        }
        let idCardPattern=/^[0-9]{18}$/;
        if (!idCardPattern.test(idCard)){
            alert("请输入18位身份证号");
            $(this).val("");
        }
    });


    $('#register_btn').click(function () {
        if (!ragreeFlag) {
            alert("请同意用户协议")
            return;
        }
        if (r_nameFlag && pwdFlag && phoneFlag && emailFlag) {
            $.ajax({
                url: "user",
                type: "post",
                data: new FormData($('#register_form')[0]),
                contentType: false,
                processData: false,
                dataType: "text",
                success: function (text) {
                    if ("Y" == text) {
                        registerSuccess();
                    } else if ("N" == text) {
                        registerFailed();
                        $('#info').html("注册失败");
                    }
                }
            })
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
            $('#h_showImg').slideDown(2000);
        }
    });
});


function registerSuccess() {
    $('#registerModal').modal('hide');
    $('#registerSuccessModal').modal('show');
    setTimeout(function () {
        $('#registerSuccessModal').modal('hide');
        $('#loginModal').modal('show')
    }, 3000)
}

function registerFailed() {
    $('#registerModal').modal('hide');
    $('#infoModal').modal('show');
    setTimeout(function () {
        $('#infoModal').modal('hide')
    }, 3000)
}

function loginRes(name) {
    $('#loginModal').modal('hide');
    $('#infoModal').modal('show');
    setTimeout(function () {
        $('#infoModal').modal('hide')
    }, 3000)
    if (name != "") {
        $('#user-name-label').text(name)
    }
}
