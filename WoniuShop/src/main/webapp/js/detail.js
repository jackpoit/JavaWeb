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
        if (parseInt(num) > parseInt($('#stock').text())) {
            alert("抱歉,没库存")
            $('#num').val("1")
        }
    })

    $('#addShopCart').click(function () {
        shopCartAjax();
    })
    $('#buyNow').click(function () {
        buyNow();
    })


})
//提交
function commitOrderAjax(ids) {
    let uid = $('#uid').val();
    $.ajax({
        url: "order",
        type: "post",
        traditional: "true",//数组选项
        data: {m: "commitOrder", ids: ids},
        dataType: "text",
        success: function (text) {
            if ("提交成功"==text){
                alert("马上进入订单页面")
                location.href = "order?m=showCommitedOrder&uid=" + uid;
            }else {
                alert("对不起订单添加失败")
            }

        }
    })
}
function buyNow() {
    let uid=$('#uid').val();
    let pid=$('#pid').val();
    let detail=$('#style .active').text()+","+$('#edition .active').text();
    let num=$('#num').val();
    $.ajax({
        url: "order",
        type: "post",
        data: {m:'addOrder',o_uid:uid,o_pid:pid,o_detail:detail,o_num:num},
        dataType: "text",
        success: function (text) {
            if ('N' == text) {
                alert('对不起订单添加失败,已帮您添加至购物车');
            }else{ //成功
                commitOrderAjax(text);
            }
        }
    })
}
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
            if ('N' == text) {
                alert('添加购物车失败');
            }else{ //成功
                alert('添加购物车成功');
            }
        }
    })
}

function forwardDetails(id) {

    location.href="product?m=forwardDetails&pid="+id;

}