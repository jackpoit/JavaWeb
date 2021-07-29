

function addUser() {
    $('#showAddImg').hide(); // 让图片预览隐藏

    $('#addUserModal').modal('show');
}

function editUser(obj) {
    $('#showImg').hide(); // 让图片预览隐藏
    let tds = $(obj).parent().parent().children();

    let id = tds.eq(1).text();
    let name = tds.eq(2).text();
    let phone = tds.eq(3).text();
    let level = tds.eq(5).text();

    $('#eid').val(id);
    $('#ename').val(name);
    $('#ephone').val(phone);

    if ($('#elevel1').val() === level) {
        $('#elevel1').attr("checked", true)
    } else if ($('#elevel2').val() === level) {
        $('#elevel2').attr("checked", true)
    } else {
        $('#elevel3').attr("checked", true)
    }

    $('#editUserModal').modal('show');
}


$(function () {
    let imgFlag = false;
    let addFlag = true;
    // 1. 头像预览
    $('#eImg').change(function () {
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
            $('#showImg').html("<img src=" + this.result + " width='150px';height='150px' class='img-circle'>");
            $('#showImg').slideDown(1000);
            imgFlag = true;
            addFlag = true;
        }
    });

    //2. 手动提交文件上传的表单
    $('#user_upload').click(function () {
        if ($('#eid').val() !== '' && imgFlag) {
            $('#editUserForm').submit(); // 让文件上传的表单提交
        } else {
            alert("请选择正确的头像图片");
        }
    });


    $('#r_img').change(function () {
        let file = this.files[0];
        let imgPattern = /image\/\w+/;// 用来匹配以 image/
        if (!imgPattern.test(file.type)) {
            alert("文件必须为图片！");
            addFlag = false;
            return false;
        }
        let reader = new FileReader(); // 创建文件预览器
        reader.readAsDataURL(file);
        reader.onload = function () {
            $('#showAddImg').html("<img src=" + this.result + " width='150px';height='150px' class='img-circle'>");
            $('#showAddImg').slideDown(1000);
            addFlag = true;
        }
    });
    $('#user_add').click(function () {
        if (addFlag) {
            $('#addUserForm').submit(); // 让文件上传的表单提交
        } else {
            alert("请选择正确的头像图片");
        }
    })
})


//全选全消

$(function () {
    let $users = $('input[name="users"]');
    let total =  $('input[name="users"]').length;

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




















