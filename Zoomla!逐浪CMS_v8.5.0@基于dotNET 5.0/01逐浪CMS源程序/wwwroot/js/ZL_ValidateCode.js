﻿//disuse，统一使用cshtml
//1,页面上指定codeok,codeno两个样式
//2,$("#TxtValidateCode").ValidateCode();
(function ($) {
    $.fn.extend({
        ValidateCode: function (options, callback) {//callback暂未用
            var refreshCode = function () {
                var url = "/Common/ValidateCode?key=" + objhid.val() + "&t=" + Math.random();
                objimg.attr("src", url);
                //--------------
                //obj.val("");
                obj.keyup();
                obj.focus();
            }
            
            var opts = $.extend({}, $.fn.ValidateCode.defaults, options), CodeCheck = $.fn.ValidateCode.CodeCheck;
            var isok = false;
            var obj = this;
            if (!obj || obj == null || !obj.attr("id")) { return false; }
            var objimg = $("#" + obj[0].id + "_img");
            var objhid = $("#" + obj[0].id + "_hid");
            objhid.val(parseInt(Math.random() * 10000000));//Key
            objimg.attr("src", "/Common/ValidateCode?key=" + objhid.val() + "&t=" + Math.random());
            //----事件
            objimg.click(refreshCode);
            //$(obj).click(refreshCode);
            $(obj).keyup(function () {
                var v = $(obj).val(),k=objhid.val();
                if (v.length < opts.num) { $(obj).removeClass(opts.okcss).removeClass(opts.nocss); return; }
                CodeCheck(v, k, function (data) {
                    if (data == 0) {
                        $(obj).next(".zi").remove();
                        $(obj).after("<i class=\"zi zi_times\" style=\"color:#ed6d6d;\"></i>");
                        $(obj).removeClass(opts.okcss).addClass(opts.nocss);
                        isok = false;
                        //refreshCode();
                    }
                    else if (data == 1) {
                        $(obj).next(".zi").remove();
                        $(obj).after("<i class=\"zi zi_check\" style=\"color:#b9f373;\"></i>");
                        $(obj).removeClass(opts.nocss).addClass(opts.okcss);
                        isok = true;
                    }
                });
            });//keyup end;
            if (opts.submitchk)//提交验证
            {
                $(obj).parent("form").submit(function (e) {
                    //var v = $(obj).val(), k = objhid.val(), flag = true;
                    //CodeCheck(v, k, function (data) {
                    //    if (data == 0) {
                    //        alert("验证码不正确"); flag = false;
                    //    }
                    //});
                    //return flag;
                    var v = $(obj).val();
                    if (v.length < opts.num) { isok = false; }
                    //验证失败也需刷新
                    if (!isok) { alert("验证码不正确");}
                    return isok;
                });
            }
        }
    })//fn end;
    $.fn.ValidateCode.defaults = { okcss: "codeok", nocss: "codeno", num: 4,submitchk:true };//参数赋值
    $.fn.ValidateCode.CodeCheck = function (v, k, callback) {
        a = "checkcode";
        $.ajax({
            type: "Post",
            async: true,
            url: "/Common/ValidateCode",
            data: { action: a, value: v, key: k },
            success: function (data) {
                callback(data);
            }
        });
    };
})(jQuery)