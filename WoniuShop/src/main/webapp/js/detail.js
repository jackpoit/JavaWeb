$(function () {

    // 选择颜色
    $('#color>div').click(function () {
        $(this).addClass("active").siblings().removeClass("active");
    })

    // 选择版本
    $('#version>div').click(function () {
        $(this).addClass("active").siblings().removeClass("active");
    })

})