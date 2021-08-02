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
                        trs += "<span class='btn btn-success'>设置默认</span></td>"
                    }
                    trs += "<td><button class='btn btn-info'>修改</button></td><td><button class='btn btn-danger'>删除</button></td></tr>"
                }
                $("#add_content").html(trs);
            }
        })
    }

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
        alert($('#districtCode').val())
        $province.val($province.text());
        $city.val($city.text());
        $district.val($district.text());

        $.ajax({
            url: "address",
            type: "post",
            data: $('#addAddForm').serialize(),
            datatype: "text",
            success: function (text) {
                if ("Y" == text) {
                    alert("成功")
                } else if ("N" == text) {
                    alert("失败")
                }
            }
        })
    })

})



