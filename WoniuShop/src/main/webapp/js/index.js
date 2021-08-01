$(function () {
    Load();
});

function Load() {
    showProduct(1,'primeProduct');
    showSaleProduct('saleProduct');
    showProduct(3,'phoneProduct');
}

//查询当前页码的核心ajax逻辑
function showProduct(num,id) {
    $.ajax({
        url: "product",
        type: "get",
        data: {m: "showPage", currentPage: num},
        dataType: "json",
        //text类型 ajax直接接收字符串类型
        success: function (list) {
            let divs = "";
            for (let product of list) {
                divs += "<div class='col-xs-6 col-sm-4 col-md-3'>"+
                    "<div class='thumbnail pro-item'><img src='images/"+product.image+
                    "' alt=''><div class='caption'><h4 class='title'>"+product.pName+
                    "</h4><p class='info'>"+product.pInfo+"</p><p class='price'>"+product.price+"元起</p></div></div></div>"
            }
            $("#"+id).html(divs);
        }
    });
}

function showSaleProduct(id) {
    $.ajax({
        url: "product",
        type: "get",
        data: {m: "showSalePage"},
        dataType: "json",
        //text类型 ajax直接接收字符串类型
        success: function (list) {
            let divs = "";
            for (let product of list) {
                divs += "<div class='col-xs-6 col-sm-4 col-md-3'>"+
                    "<div class='thumbnail pro-item'><img src='images/"+product.image+
                    "' alt=''><div class='caption'><h4 class='title'>"+product.pName+
                    "</h4><p class='info'>"+product.pInfo+"</p><p class='price'>"+product.price+"元起</p></div></div></div>"
            }
            $("#"+id).html(divs);
        }
    });
}