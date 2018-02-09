<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shake.aspx.cs" Inherits="ZoomLaCMS.Common.Luckdraw.Shake" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0">   
<script src="/JS/jquery.min.js"></script>
<script src="/Design/mbh5/js/fastclick.js"></script>
<script src="images/Shake/howler.min.js"></script>
<%--<script src="/JS/Mobile/vconsole.min.js"></script>--%>
<%--<script src="/dist/js/weui.js"></script>--%>
<link href="/dist/css/weui.min.css" rel="stylesheet" />
<link href="/dist/css/font-awesome.min.css" rel="stylesheet" />
<link href="/Design/h5/css/animate.css?v=1" rel="stylesheet" />
<style type="text/css">
#shake_wrap {
  -webkit-animation-duration: 2s;
  -webkit-animation-delay: 2s;
  -webkit-animation-iteration-count: infinite;
}
</style>
<title>摇一摇抽奖</title>
</head>
<body>
<form id="form1" runat="server">
<div id="homeBody" style="overflow:hidden;">
    <div class="homeBG">
        <img src="images/shake/bg.jpg" style="width: 100%; height: auto;" />
    </div>
    <div style="position:absolute;top:3%;width:70%;left:15%;">
        <img src="images/Shake/title.png" style="width:100%;" />
    </div>
    <div style="position:absolute;top:30%;width:50%;left:25%;" id="shake_wrap" class="tada">
        <img src="images/Shake/shake.png" style="width:100%;" />
    </div>
    <div style="position:absolute;top:75%;width:70%;left:15%;text-align:center;">
        <img src="images/Shake/flag.png" style="width:100%;" />
        <div style="color: rgb(254, 215, 1); font-size: 14px; position: relative; top: 0px;margin-top:-23%;">
            已有<span style="color: #fff;"><%:UserCount %></span>人参与
        </div>
    </div>
    <div style="font-size:16px;color:#fff;position:absolute;top:85%;text-align:center;width:100%;">
        您今天还有<span style="color:#fe8208;" id="draw_count"></span>次抽奖机会
    </div>
    <div id="draw_wait" class="weui-mask" style="color:#ddd;">
        <i class="fa fa-circle-o-notch fa-spin fa-5x fa-fw" style="color:#ddd;margin-top:90%;"></i>
        <div>Loading....</div>
    </div>
    <div id="draw_failed" class="weui-mask">
        <img src="images/Shake/faiImg.png" style="max-width:100%;margin-top:10%;" />
        <button type="button" class="weui-btn weui-btn_primary" style="width:80%;" onclick="zlluck.closeShow();">再来一次</button>
    </div>
    <div id="draw_lucked" class="weui-mask">
        <div class="word" style="margin-top:15%;margin-bottom:5%;">祝贺你获得了</div>
        <img src="images/Shake/gift.png" style="width:50%;"/>
        <div class="word" style="color:#fe8208;margin-top:20px;" id="prize_rank"></div>
        <div class="word" id="prize_name"></div>
     <%--   <button type="button" class="weui-btn weui-btn_primary" style="width:80%;">确定</button>--%>
    </div>
</div>
</form>
<style type="text/css">
.weui-mask{text-align:center;display:none;z-index:100;}
.weui-mask .word{font-size:1.2em;padding:5px;color:#fff;}
.weui-mask .weui-btn{position:fixed;bottom:10%;left:10%;}
</style>
<script src="/JS/Modal/APIResult.js"></script>
<script>
    var baseDir = "/Common/Luckdraw/images/shake/";
    var sound = new Howl({ urls: [baseDir + 'shake_sound.mp3'] }).load();
    var findsound = new Howl({ urls: [baseDir + 'shake_match.mp3'] }).load();
    $(document).ready(function () {
        $("#homeBody").height($(window).height());
        Howler.iOSAutoEnable = false;
        FastClick.attach(document.body);
        zlshake.init();
        zlluck.init();
    });
    var zlshake = {
        SHAKE_THRESHOLD: 1000, isShakeble: true, curTime: 0, last_time: 0, last_update: 0,
        x: 0, y: 0, z: 0, last_x: 0, last_y: 0, last_z: 0
    };
    zlshake.init = function () {
        var ref = zlshake;
        if (window.DeviceMotionEvent) {
            window.addEventListener('devicemotion', ref.deviceMotionHandler, false);
        } else {
            // $("#cantshake").show();
        }
    }
    zlshake.shake = function () {
        var ref = zlshake;
        ref.last_time = ref.curTime;
        zlluck.draw();
        sound.play();
    }
    zlshake.deviceMotionHandler = function (eventData) {
        var ref = zlshake;
        if (zlluck.stop == true) { return; }
        ref.curTime = new Date().getTime();
        var diffTime = ref.curTime - ref.last_update;
        if (diffTime > 100) {
            var acceleration = eventData.accelerationIncludingGravity;
            ref.last_update = ref.curTime;
            ref.x = acceleration.x;
            ref.y = acceleration.y;
            ref.z = acceleration.z;
            var speed = Math.abs(ref.x + ref.y + ref.z - ref.last_x - ref.last_y - ref.last_z) / diffTime * 10000;

            if (speed > ref.SHAKE_THRESHOLD && ref.curTime - ref.last_time > 1100 && ref.isShakeble) {
                ref.shake();
            }
            ref.last_x = ref.x;
            ref.last_y = ref.y;
            ref.last_z = ref.z;
        }
    }
    //----------------
    var zlluck = {
        list: [{ name: "未中奖" }, { name: "面膜", rank: "一等奖" },
            { name: "橄榄油", rank: "二等奖" }, { name: "茶叶", rank: "三等奖" }],
        count_max: 3, count_now: <%:Count_Now%>, stop: false, lucked: []
    };
    zlluck.init = function () 
    {
        var count=zlluck.count_max-zlluck.count_now;
        $("#draw_count").text(count);
        if(count<1){zlluck.stop=true;}
    }
    zlluck.getByName = function (name) {
        for (var i = 0; i < zlluck.list.length; i++) {
            var item = zlluck.list[i];
            if (item.name == name) { return item; }
        }
        return null;
    }
    //抽奖
    zlluck.draw = function () {
        var ref = zlluck;
        //是否还有抽奖次数
        if (ref.count_max <= ref.count_now || ref.stop == true) { console.log("已满次数或正中抽奖中,取消操作"); return; }
        ref.count_now++;
        ref.stop = true;//抽奖其间不允许再点击
        $("#draw_wait").show();
        //-------------------------
        $.post("/api/mod/wx_luckdraw.ashx?action=shake", { id: "1" }, function (data) {
            console.log(data);
            var model = APIResult.getModel(data);
            if (APIResult.isok(model)) {
                var prize = ref.getByName(model.result);
                //-------已中奖不可再抽奖
                if (prize && prize.name != "未中奖") {
                    $("#prize_name").text(prize.name);
                    $("#prize_rank").text(prize.rank);
                    ref.showLucked();
                }
                else {
                    $("#draw_count").text(ref.count_max - ref.count_now);
                    ref.showFailed();
                }
            }
            else {ref.closeShow(); alert("failed:"+model.retmsg); }
        })
    }
    zlluck.showFailed = function () {
        $(".weui-mask").hide();
        $("#draw_failed").show();
    }
    zlluck.showLucked = function () {
        $(".weui-mask").hide();
        $("#draw_lucked").show();
    }
    zlluck.closeShow = function () {
        $(".weui-mask").hide();
        zlluck.stop = false;
    }
</script>
</body>
</html>
