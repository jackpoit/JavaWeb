$(function () {
    Load();
});

function Load() {
    showProductByRule('primeProduct','price','true','');
    showProductByRule('saleProduct','sale','true','');
    showProductByRule('gunProduct','price','true','1');
    showProductByRule('itemProduct','price','true','3');
}

//查询当前页码的核心ajax逻辑

function showProductByRule(id,keyword,isDesc,type) {
    $.ajax({
        url: "product",
        type: "get",
        data: {m: "showPageByRule",keyword:keyword,isDesc:isDesc,type:type},
        dataType: "json",
        //text类型 ajax直接接收字符串类型
        success: function (list) {
            let divs = "";
            for (let product of list) {
                divs += "<div class='col-xs-6 col-sm-4 col-md-3'>"+
                    "<div class='thumbnail pro-item'><img src='"+product.image+
                    "' alt=''><div class='caption'><h4 class='title'>"+product.pname+
                    "</h4><p class='info'>"+product.pinfo+"</p><p class='price'>"+product.price+"元起</p></div></div></div>"
            }
            $("#"+id).html(divs);
        }
    });
}