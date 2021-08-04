$(function () {
    $('#style>div').eq(0).addClass("active");
    $('#edition>div').eq(0).addClass("active");
    // 选择颜色
    $('#style>div').click(function () {
        $(this).addClass("active").siblings().removeClass("active");
    })

    // 选择版本
    $('#edition>div').click(function () {
        $(this).addClass("active").siblings().removeClass("active");
    })


    $('#num').blur(function () {
        let num = $(this).val();
        if (num == '') {
            $('#num').val("1")
        }
        let numPattern = /^[1-9][0-9]*$/;
        if (!numPattern.test(num)) {
            alert("请输入正确的数字")
            $('#num').val("1")
        }
        if (num > $('#stock').text()) {
            alert("抱歉,没库存")
            $('#num').val("1")
        }
    })


    $('#addShopCart').click(function () {
        shopCartAjax();
    })


})

function shopCartAjax() {
    let uid=$('#uid').val();
    let pid=$('#pid').val();
    let detail=$('#style .active').text()+","+$('#edition .active').text();
    let num=$('#num').val();
    alert(detail)
    $.ajax({
        url: "order",
        type: "post",
        data: {m:'addOrder',o_uid:uid,o_pid:pid,o_detail:detail,o_num:num},
        dataType: "text",
        success: function (text) {
            if ('Y' == text) { //成功
                alert('添加成功');
                forwardDetails(pid)
            } else if ('N' == text) {
                alert('添加失败');
            }
        }
    })
}

function forwardDetails(id) {

    location.href="product?m=forwardDetails&pid="+id;

}