(function ($) {
    var default_setting = {
        cardw: 130,
        cardh: 40,
        cardn: 7,
        margin: 0
    }
    function effect() {
        var target = this;
        target.find('i.left').addClass('zi zi_forLeft');
        target.find('i.right').addClass('zi zi_forRight');
        target.find('.slide-wrap').hover(function () {
        },
            function () {
                target.find('i').removeClass('i-active');
                target.find('.slide').addClass('slide-active-r');
                target.find('.slide').addClass('slide-active-l');
            });
        target.find('.right').hover(
            function () { },
            function () {
                target.find('.slide').removeClass('slide-active-r');
            });
        target.find('.left').hover(
            function () { },
            function () {
                target.find('.slide').removeClass('slide-active-l');
            });
    }
    function init(cus_setting) {
        var init_setting = $.extend({},
            default_setting, cus_setting || {});
        var slidewraph = init_setting.cardh + 3;
        var covered = init_setting.cardw - 33
        var boxw = init_setting.cardw * init_setting.cardn - covered * 2;
        var singlemove = init_setting.cardw * (init_setting.cardn - 2);
        var listn = init_setting.JSON.length;
        var boundary = init_setting.cardw * (listn) - singlemove;
        var target = this;
        var sliderframestring = '<div class =\'slide-wrap\'><div class=\'border\'><div class=\'slide\'><div class=\'shift right\'></div><i class=\'shift right\'></i><div class=\'shift left\'></div><i class =\'shift left\'></i><ul><li style="width:130px;background-color:#f7f7f7;"></li><li style="display:none;"></li></ul></div></div></div>';
        var sliderhtml = $(sliderframestring);
        sliderhtml.appendTo(target);
        $.each(init_setting.JSON,
            function (i, field) {
                target.find('ul>li:first').after('<li class="nav-item"  data-title="' + field.name + '"><div name="label" class=\'title\'>' + (field.name == '' ? "全部标签" : field.name) + '</div></li>');
            });
        target.width(boxw);
        target.find('.slide-wrap').height(slidewraph);

        target.find('ul').css({
            left: -covered
        });

        target.find('.nav-item').width(init_setting.cardw);
        target.find('li').height(init_setting.cardh);
        target.find('.title').width(init_setting.cardw);
        effect.call(target);
        var movement = 0;
        target.find('.right').click(function (event) {
            if (Math.abs(movement) < boundary) movement -= singlemove;
            target.find('ul').hover().css('transform', 'translateX(' + movement + 'px)');
        });
        target.find('.left').click(function (event) {
            if (movement < 0) movement += singlemove;
            target.find('ul').hover().css('transform', 'translateX(' + movement + 'px)');
        });
        if (init_setting.cb && typeof (init_setting.cb) == "function") { init_setting.cb(); }
    }
    $.fn.slider = function (setting) {
        if (setting && typeof setting === 'object') {
            init.call(this, setting);
        } else if (!setting) {
            init.call(this);
        }
    };
})(jQuery)
