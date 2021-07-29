let total = 0;

$(function () {
    let $products = $('input[name="product"]');

    calSubTotal();
    updateTotal();

    //全选全消
    $('#all').click(function () {
        let flag = this.checked;
        $products.prop("checked", flag);
        $('#chooseNum').text(flag ? total : 0);
        calTotalPrice();
    });
    $products.click(function () {
        let count = $('input[name="product"]').filter(":checked").length;
        $('#all').prop("checked", count === total);
        $('#chooseNum').text(count);
        calTotalPrice();
    });

    $('input[name="count"]').change(function () {
        let price = $(this).parent().prev().children().text();
        let count = $(this).val();
        let subTotal = price * count;
        $(this).parent().next().children().text(subTotal);
        calTotalPrice();
    })


});

function calTotalPrice() {
    let checks = $('input[name="product"]:checked');
    let totalPrice = 0;
    for (let check of checks) {
        let tr = $(check).parent().parent();
        let subTotal = calSingleSubTotal(tr);
        totalPrice += subTotal;
    }
    $('#totalPrice').text("¥" + totalPrice);
}

//小计
function calSubTotal() {
    let trs = $('.shopcart .item');
    for (let tr of trs) {
        let tds = $(tr).children();
        let subTotal = calSingleSubTotal(tr);
        tds.eq(6).find("span").text(subTotal)
    }
}

//一行内的小计

function calSingleSubTotal(tr) {
    let tds = $(tr).children();
    let price = tds.eq(4).find("span").eq(0).text();
    let num = tds.eq(5).find("input").val();
    return price * num;

}


//全部商品
function updateTotal() {
    total = $('input[name="product"]').length;
    $('#s_total').text(total);
}


function delPro(obj) {
    let flag = confirm("确定删除吗?")
    if (flag) {
        let $tr = $(obj).parent().parent();
        let id = $tr.children().eq(0).children().eq(0).val();
        //发送请求到后端 后端在到数据库
        $tr.remove(); //回显数据
        updateTotal();
        calTotalPrice();
        $('#chooseNum').text($('input[name="product"]:checked').length);
        let count = $('input[name="product"]').filter(":checked").length;
        $('#all').prop("checked", count === total);
    }
}