$(function () {


});


function registerSuccess() {
    $('#registerModal').modal('hide');
    $('#registerSuccessModal').modal('show');
    setTimeout(function () {
        $('#registerSuccessModal').modal('hide');
        $('#loginModal').modal('show')
    }, 3000)
}

function loginRes(name) {
    $('#loginModal').modal('hide');
    $('#loginSuccessModal').modal('show');
    setTimeout(function () {
        $('#loginSuccessModal').modal('hide')
    }, 3000)
    if (name!=""){
        $('#user-name-label').text(name)
    }
}
