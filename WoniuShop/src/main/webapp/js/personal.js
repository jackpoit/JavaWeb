$(function () {
    $('#address-btn').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
        let id = $('#id').val();
        if (id == '') {
            return;
        }
        showAllAdd(id);
    })


    $('#setDefault').click(function () {
        let flag = this.checked;
        if (flag) {
            $('#isdefault').val("true")
        } else {
            $('#isdefault').val("false")
        }
    })
    let nameFlag = false;
    let phoneFlag = false;
    let fullAddressFlag = false;
    $('#add_name').blur(function () {
        let name = $(this).val();
        if (name == '') {
            nameFlag = false;
            return;
        }
        let namePattern = /^[a-zA-Z]+$/;
        if (!namePattern.test(name)) {
            alert("请正确输入收货人姓名");
            nameFlag = false;
            $(this).val("");
        } else {
            nameFlag = true;
        }
    })
    $('#add_phone').blur(function () {
        let phone = $(this).val();
        if (phone == '') {
            phoneFlag = false;
            return;
        }
        let phonePattern = /^[1][0-9]{10}$/;
        if (!phonePattern.test(phone)) {
            alert("请正确输入收货人手机号");
            phoneFlag = false;
            $(this).val("");
        } else {
            phoneFlag = true;
        }
    })
    $('#fullAddress').blur(function () {
        let fullAddress = $(this).val();
        if (fullAddress == '') {
            fullAddressFlag = false;
            return;
        }
        fullAddressFlag = true;
        // let fullAddressPattern = /^*$/;
        // if (!fullAddressPattern.test(fullAddress)) {
        //     alert("请正确输入具体地址");
        //     fullAddressFlag = false;
        //     $(this).val("");
        // } else {
        //     fullAddressFlag = true;
        // }
    })
    $('#add_add_btn').click(function () {
        if (!nameFlag || !phoneFlag || !fullAddressFlag) {
            alert("请正确填写所有信息")
            return;
        }
        let $province = $('#province option:selected');
        let $city = $('#city option:selected');
        let $district = $('#district option:selected');
        if ($province.val() == -1 || $city.val() == -1 || $district.val() == -1) {
            alert("请正确选择省市区");
            return;
        }
        $('#districtCode').val($district.val());
        $province.val($province.text());
        $city.val($city.text());
        $district.val($district.text());
        let id = $('#id').val();
        $.ajax({
            url: "address",
            type: "post",
            data: $('#addAddForm').serialize(),
            datatype: "text",
            success: function (text) {
                if ("Y" == text) {
                    alert("添加成功");
                    $('#addAddress').modal('hide');
                    showAllAdd(id);
                } else if ("N" == text) {
                    alert("失败")
                }
            }
        })
    })

})

//展示地址
function showAllAdd(id) {
    $.ajax({
        url: "address",
        type: "get",
        data: {m: "showAll", uid: id},
        dataType: "json",
        success: function (list) {
            let trs = ""
            for (let add of list) {
                trs += "<tr><td>" + add.username + "</td><td>" + add.mobile + "</td><td>" + add.area + "</td><td>" + add.location + "</td><td>" + add.postcode + "</td><td>";
                if (add.isDefault == 1) {
                    trs += "<span class='default-addr'>默认地址</span></td>"
                } else {
                    trs += "<span class='btn btn-success' onclick='setDefault(" + add.id + "," + add.uid + ")'>设置默认</span></td>"
                }
                trs += "<td><button class='btn btn-info' onclick='editAdd(this,"+add.id+")'>修改</button></td><td><button class='btn btn-danger' onclick='deleteById(" + add.id + ")'>删除</button></td></tr>"
            }
            $("#add_content").html(trs);
        }
    })
}

function editAdd(obj,id) {
    $('#add_id').val(id)

    let trs = $(obj).parent().parent().children();

    $('#e_add_name').val(trs.eq(0).text());
    $('#e_add_phone').val(trs.eq(1).text());

    $('#e_fullAddress').val(trs.eq(3).text());
    let area=trs.eq(2).text();
    let strs=area.split(" ");

    if (strs.length==2){
        // $("#e_province>option[value="+strs[0]+"]").prop("selected",true);
        $('#e_province').prepend("<option value='"+strs[0]+"' selected>"+strs[0]+"</option>")
        $('#e_city').prepend("<option value='"+strs[0]+"' selected>"+strs[0]+"</option>")
        $('#e_district').prepend("<option value='"+strs[1]+"' selected>"+strs[1]+"</option>")

    }else {
        $('#e_province').prepend("<option value='"+strs[0]+"' selected>"+strs[0]+"</option>")
        $('#e_city').prepend("<option value='"+strs[1]+"' selected>"+strs[1]+"</option>")
        $('#e_district').prepend("<option value='"+strs[2]+"' selected>"+strs[2]+"</option>")
    }

    let str=trs.eq(5).children().text();
    if (str[0]=='默'){
        $('#e_setDefault').prop('checked',true)
        $('#e_isdefault').val("true")
    }

    $('#editAddress').modal('show');

}


$(function () {
    $('#e_setDefault').click(function () {
        let flag = this.checked;
        if (flag) {
            $('#e_isdefault').val("true")
        } else {
            $('#e_isdefault').val("false")
        }
    })
    let nameFlag = true;
    let phoneFlag = true;
    let fullAddressFlag = true;
    $('#e_add_name').blur(function () {
        let name = $(this).val();
        if (name == '') {
            nameFlag = false;
            return;
        }
        let namePattern = /^[a-zA-Z]+$/;
        if (!namePattern.test(name)) {
            alert("请正确输入收货人姓名");
            nameFlag = false;
            $(this).val("");
        } else {
            nameFlag = true;
        }
    })
    $('#e_add_phone').blur(function () {
        let phone = $(this).val();
        if (phone == '') {
            phoneFlag = false;
            return;
        }
        let phonePattern = /^[1][0-9]{10}$/;
        if (!phonePattern.test(phone)) {
            alert("请正确输入收货人手机号");
            phoneFlag = false;
            $(this).val("");
        } else {
            phoneFlag = true;
        }
    })
    $('#e_fullAddress').blur(function () {
        let fullAddress = $(this).val();
        if (fullAddress == '') {
            fullAddressFlag = false;
            return;
        }
        fullAddressFlag = true;
        // let fullAddressPattern = /^*$/;
        // if (!fullAddressPattern.test(fullAddress)) {
        //     alert("请正确输入具体地址");
        //     fullAddressFlag = false;
        //     $(this).val("");
        // } else {
        //     fullAddressFlag = true;
        // }
    })
    $('#e_add_add_btn').click(function () {
        if (!nameFlag || !phoneFlag || !fullAddressFlag) {
            alert("请正确填写所有信息")
            return;
        }
        let $province = $('#e_province option:selected');
        let $city = $('#e_city option:selected');
        let $district = $('#e_district option:selected');
        if ($province.val() == -1 || $city.val() == -1 || $district.val() == -1) {
            alert("请正确选择省市区");
            return;
        }

        $('#e_districtCode').val($district.val());
        $province.val($province.text());
        $city.val($city.text());
        $district.val($district.text());
        $.ajax({
            url: "address",
            type: "post",
            data: $('#editAddForm').serialize(),
            datatype: "text",
            success: function (text) {
                if ("Y" == text) {
                    alert("修改成功");
                    $('#e_addAddress').modal('hide');
                    showAllAdd($('#id').val());
                } else if ("N" == text) {
                    alert("修改失败")
                }
                $('#editAddress').modal('hide');
            }
        })
    })
})




function deleteById(id) {
    let flag = confirm("您确认要删除此地址吗?");
    if (flag) {
        $.ajax({
            url: "address",
            type: "get",
            data: {m: "remove", id: id},
            dataType: "text",
            success: function (text) {
                if ("Y" == text) {
                    alert("删除成功");
                    showAllAdd($('#id').val());
                } else if ("N" == text) {
                    alert("删除失败")
                }
            }
        })
    }
}

function setDefault(id, uid) {
    let flag = confirm("您确认将此地址设为默认?");
    if (flag) {
        $.ajax({
            url: "address",
            type: "get",
            data: {m: "setDefault", id: id, uid: uid},
            dataType: "text",
            success: function (text) {
                if ("Y" == text) {
                    alert("设置成功");
                    showAllAdd($('#id').val());
                } else if ("N" == text) {
                    alert("设置失败")
                }
            }
        })
    }
}