let total = 0;

$(function () {
    let products = $('input[name="product"]');
    total = products.length; // 购物车商品的总数
    // 初始化操作
    calSubTotal();

    // 更新商品的总数
    updateTotal();

    //1. 实现全选全消功能
    $('#all').click(function () {
        let flag = this.checked;
        products.prop("checked", flag);
        $('#delAll').prop("checked", flag);
        $('#chooseNum').text(flag ? total : "0");  // 更新已经选择的商品数量
        calTotalPrice(); // 更新总价
    });
    $('#delAll').click(function () {
        let flag = this.checked;
        products.prop("checked", flag);
        $('#All').prop("checked", flag);
        $('#chooseNum').text(flag ? total : "0");  // 更新已经选择的商品数量
        calTotalPrice(); // 更新总价
    });

    //2. 全选全消的优化
    products.click(function () {
        //2.1 判断复选框是否是全部选中
        let chooseCount = $('input[name="product"]:checked').length;
        $('#all').prop("checked", chooseCount == total);
        $('#delAll').prop("checked", chooseCount == total);
        //2.2 更新总价及已选择的商品的个数
        $('#chooseNum').text(chooseCount);  // 更新已选择的数量
        calTotalPrice(); // 计算总价
    });

    //3. 当商品数量改变时需要更新小计
    $('input[name="count"]').change(function () {
        let price = $(this).parent().prev().children().text();
        let count = $(this).val();
        let subTotal = price * count;
        $(this).parent().next().children().text(subTotal); // 更新小计
        calTotalPrice(); //更新总价
    });

});

// 计算每个商品的小计
function calSubTotal() {
    let trs = $('.shopcart .item');  // 获取到每个tr
    for (let tr of trs) {
        let tds = $(tr).children();
        // 获取商品的单价
        tds.eq(6).find("span").text(calSingleSubTotal(tr)); // 更新小计
    }
}

/**
 * 计算机一行内的小计
 * @param tr
 * @returns {number}
 */
function calSingleSubTotal(tr) {
    let tds = $(tr).children();
    let price = tds.eq(4).find("span").text();  // 获取单价
    let num = tds.eq(5).find("input").val(); //  获取个数
    let subTotal = price * num; // 计算小计
    return subTotal;
}

// 计算总价
function calTotalPrice() {
    let checks = $('input[name="product"]:checked'); // 获取到所有被选中的复选框
    let totalPrice = 0;
    for (let check of checks) {
        let tr = $(check).parent().parent();
        let subTotal = calSingleSubTotal(tr);
        totalPrice += subTotal; // 将每个被选中的商品的小计全部相加
    }
    $('#totalPrice').text("¥" + totalPrice); // 更新总价
}

// 更新购物车商品的总数/已经选择的商品个数
function updateTotal() {
    total = $('input[name="product"]').length; //购物车商品的总数
    $('#s_total').text(total);
}




//删除
function deleteOrderAjax(ids) {
    let uid = $('#uid').val();
    $.ajax({
        url: "order",
        type: "post",
        traditional: "true",//数组选项
        data: {m: "deleteCommitedOrders", ids: ids},
        dataType: "text",
        success: function (text) {
            alert(text);
            location.href = "order?m=showCommitedOrder&uid=" + uid;
        }
    })
}

function deleteOrder(id) {
    let flag = confirm("您确认要删除" + id + "号订单吗?");
    if (flag) {
        deleteOrderAjax(id);
    }
}

function deleteAllOrder() {
    let $ids = $('input[name="product"]').filter(":checked")
    if ($ids.length === 0) {
        alert("没有选择的订单")
        return;
    }
    let ids = [];
    let idStr = "";
    for (let i = 0; i < $ids.length; i++) {
        ids[i] = $ids.eq(i).val();
        idStr += ids[i];
        if (i != $ids.length - 1) {
            idStr += ",";
        }
    }
    let flag = confirm("您确认要删除" + idStr + "号订单吗?");
    if (flag) {
        deleteOrderAjax(ids);
    }
}

$(function () {
showAllAdd();

})

function showAllAdd() {
    let uid = $('#uid').val();
    $.ajax({
        url: "address",
        type: "get",
        data: {m: "showAll", uid: uid},
        dataType: "json",
        success: function (list) {
            let trs = ""
            for (let add of list) {
                trs += " <div class='col-md-4 addBox'>\n" +
                    "                <div class='addr'>\n" +
                    "                    <div class='logo col-md-2' style='padding: 0'>\n" +
                    "                        <span class='glyphicon glyphicon-map-marker'></span>\n" +
                    "                    </div>\n" +
                    "                     <div class='add_id_class' style='display: none'>"+add.id+"</div>"+
                    "                    <div class='info col-md-10'>\n" +
                    "                        <p>\n" +
                    "                            <span class='name'>"+add.username+"</span>\n" +
                    "                            <span class='mobile'>"+add.mobile+"</span>\n" +
                    "                        </p>\n" +
                    "                        <p>"+add.area+"</p>\n" +
                    "                        <p>"+add.location+"</p>\n" +
                    "                    </div>\n" +
                    "                </div>\n" +
                    "            </div>"
            }
            $("#add_content").html(trs);
            addr_css();
        }
    })
}

function addr_css() {

    $('#add_content .addBox').eq(0).addClass("add_active");

    // 选择颜色
    $('#add_content .addBox').click(function () {
        $(this).addClass("add_active").siblings().removeClass("add_active");
    })

}
function forwardDetails(id) {

    location.href="product?m=forwardDetails&pid="+id;

}