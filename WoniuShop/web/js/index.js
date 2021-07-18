$(function () {


    //  $('#registerSuccessModal').modal('show');   //让模态框显示
    //  $('#registerModal').modal('hide');   //让模态框隐藏


});
function changeName(name) {
    $('#user-name-label').text(name)
}

function openAdmin() {
    location.href = "user.jsp";
}

function startLogin() {
    let toLogin = setTimeout(function () {
        $('#registerSuccessModal').modal('hide');
        $('#loginModal').modal('show')
    }, 3000)
}

function registerSuccess() {
    //  window.location.href ='index.jsp';
    $('#registerSuccessModal').modal('show');
    startLogin();
}
function loginRes(name) {
    $('#loginSuccessModal').modal('show');
    setTimeout(function () {
        $('#loginSuccessModal').modal('hide')
    }, 2000)
    if (name!=""){
        changeName(name);
    }
    window.location.href="index.jsp";
}
