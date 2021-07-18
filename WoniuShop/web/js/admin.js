let curPage = 1;
$(function () {

    $('#myTabs a:first').tab('show');
    if ($('#user table tr').length === 1) {
        // window.location.href = "admin.jsp/userPage?page=1&len=3";
        window.location.href = "userPage?page=1&len=3";
    }
})
function getUserPage(userPage) {
    curPage= userPage;
}
function delTr(obj) {
    if (confirm("确认删除吗?")) {
        $(obj).parent().parent().remove();
    }
}

function getPagePath(obj) {
    if ($(obj).text() === '«') {
        if (curPage > 1) {
            curPage -= 1;
        }
        console.log(curPage);
    } else if ($(obj).text() === '»') {
        curPage += 1;
        console.log(curPage);
    } else {
        curPage = $(obj).text();
    }
    // window.location.href = "admin.jsp/userPage?page=" + curPage + "&len=3";
    window.location.href = "userPage?page=" + curPage + "&len=3";
}