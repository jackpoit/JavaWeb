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
        let uid=$('#uid').val();
        let $num=$(this);
        let num = $num.val();
        let id=$(this).parent().parent().children().eq(0).children().eq(0).val();
        $.ajax({
            url: "order",
            type: "post",
            data: {m: 'updateNum', id: id,num:num},
            dataType: "text",
            success: function (text) {
                if ('Y' == text) { //成功
                    let price = $num.parent().prev().children().text();
                    let count = $num.val();
                    let subTotal = price * count;
                    $num.parent().next().children().text(subTotal); // 更新小计
                    calTotalPrice(); //更新总价
                } else if ('N' == text) {
                    alert("商品数量超过库存");
                    location.href="order?m=showOrderPage&uid="+uid;
                }
            }
        })

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

// // 删除商品
// function delPro(obj) {
//    let flag = confirm("您确认要从购物车中删除这个商品吗？");
//    if(flag){
//        //1. 找到当前行的元素tr
//        let tr = $(obj).parent().parent();
//        //2. 获取到被删除商品的id
//        let id = tr.children().eq(0).children().eq(0).val();
//        // 3. 发送请求到后端，后端在到数据库
//        tr.remove();  // 回显数据（实时更新数据）
//        // 4. 更新商品总数
//        updateTotal();
//        // 5. 更新已选中的商品个数
//        $('#chooseNum').text($('input[name="product"]:checked').length);
//        // 6. 更新总价
//        calTotalPrice();
//    }
// }

function changeNum() {
    $.ajax({
        url: "order",
        type: "post",
        data: {m: 'updateNum', id: 1},
        dataType: "text",
        success: function (text) {
            if ('Y' == text) { //成功

            } else if ('N' == text) {

            }
        }
    })

}

// function commitOrder() {
//     $.ajax({
//         url: "order",
//         type: "post",
//         data: {m: 'commitOrder', id: 1},
//         dataType: "text",
//         success: function (text) {
//             if ('Y' == text) { //成功
//                 alert('提交成功');
//             } else if ('N' == text) {
//                 alert('提交失败');
//             }
//         }
//     })
//
// }

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
            alert(text);
            location.href = "order?m=showCommitedOrder&uid=" + uid;

        }
    })
}

function commitAllOrder() {
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
    let flag = confirm("您确认要提交" + idStr + "号订单吗?");
    if (flag) {
        commitOrderAjax(ids);
    }
}

//删除
function deleteOrderAjax(ids) {
    let uid = $('#uid').val();
    $.ajax({
        url: "order",
        type: "post",
        traditional: "true",//数组选项
        data: {m: "deleteByIds", ids: ids},
        dataType: "text",
        success: function (text) {
            if ("Y" == text) {
                alert("删除成功")
                location.href = "order?m=showOrderPage&uid=" + uid;
            } else if ("N" == text) {
                alert("删除失败")
            }
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

function forwardDetails(id) {

    location.href="product?m=forwardDetails&pid="+id;

}