$(function () {

    $('#myTabs a:first' ).tab('show');
})

function delTr(obj){
    if (confirm("确认删除吗?")){
        $(obj).parent().parent().remove();

    }
}