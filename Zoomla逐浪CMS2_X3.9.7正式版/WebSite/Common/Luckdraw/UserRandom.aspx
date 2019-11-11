<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRandom.aspx.cs" Inherits="ZoomLaCMS.Common.Luckdraw.UserRandom" MasterPageFile="~/Common/Master/Empty2.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>随机抽奖</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="box">
        <div class="jz">
            <p><b>抽奖活动</b></p>
            <span class="name">姓名</span><br />
<%--            <span class="phone">电话</span><br />--%>
            <div class="start stop" id="btntxt" onclick="stop();">停止</div>
            <div class=" btn btn-warning btn-lg" style="margin-top:10px;width:200px;" onclick="enroll();">报名</div>
        </div>
        <div class="zjmd">
            <p class="p1">中奖者名单</p>
            <div class="list"></div>
        </div>
    </div>
<div class="prize_wrap"></div>
<div style="z-index:-1;background: url(images/UserRandom/bg.jpg); background-position: center; left: 0; top: 0; right: 0; bottom: 0; position: absolute; background-repeat: no-repeat; background-size: cover;">

</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
.box{width:80%;max-width:1000px;margin:auto;text-align:center;position: absolute;top:20%;left:0;right:0;}
.jz{float:left;width:420px;height:auto;}
.jz p{line-height:80px;text-align:center;font-size:50px;color:#ffffff;}
.jz span{display: block;width:420px;height:80px;line-height:80px;margin:20px 0;text-align:left;font-size:60px;background: #ffffff;padding-left:20px;border-radius:5px;}
.start,.stop{width:200px;height:80px;line-height:80px;text-align:center;font-size:64px;border-radius:10px;margin:auto;color:#ffffff;cursor: pointer;}
.start{background: #24ADD7;}
.stop{background: #FC6666;}

.zjmd{float:left;width:300px;height: 500px;background: #666;margin-top:30px;margin-left:30px;background: #ffffff;overflow: hidden;border-radius:5px;}
.zjmd .p1{line-height:40px;text-align:center;font-size:20px;padding:0;border-bottom:1px solid #ddd;}
.zjmd .item{padding:5px;text-align:left;padding-left:20px;}
.zjmd .prize{background-color:#24ADD7;text-align:center;display:inline-block;color:#fff;line-height:30px;padding:5px;}
.prize_wrap{}
.prize_item{cursor:pointer;display:inline-block;width:260px;height:50px;padding:10px;text-align:center;
            background-color:#24ADD7;border:1px solid #ccc;border-radius:4px;color:#fff;margin:5px;font-size:1.5em;}
.prize_item.disabled{background-color:#ccc;cursor:default;}
</style>
<script src="/JS/Modal/APIResult.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script>
    //序号,用户序号
    var luck={
        isrun:false,
        curPrize:null,//当前正在抽的奖品
        curItem:null
    };
    var t=0,userIndex=0;
    var api="/api/mod/wx_luckdraw.ashx?id=<%:Mid%>&action=";
    var list = <%=UserList%>;//用户列表
    var prizeList=<%=luckMod.Prize%>;//奖品列表
    function init()
    {
        var tlp='<div class="prize_item">@Name (@Count_Total)名</div>';
        var $items= JsonHelper.FillItem(tlp,prizeList,function($item,mod){
            $item.click(function(){
                if(list.length<2){alert("报名的用户不足,无法抽奖");return;}
                if(luck.isrun){return;}
                luck.isrun=true;
                luck.curPrize=mod;
                luck.curItem=$item;
                startNum();
            });
        });
        $(".prize_wrap").append($items);
    }
    init();
    //循环参加名单
    function startNum() {
        userIndex = Math.floor(Math.random() * list.length);
        $(".name").html(list[userIndex].UserName);
        t = setTimeout(startNum, 0);
    }
    //停止跳动
    function stop() {
        if(luck.isrun==false){return;}
        luck.isrun=false;
        clearInterval(t);
        t = 0;
        luck.curPrize.Count_Total--;
        if(luck.curPrize.Count_Total<=0){luck.curItem.addClass("disabled");        luck.curItem.unbind("click");}
        luck.curItem.html(luck.curPrize.Name+" ("+luck.curPrize.Count_Total+")名");
        //-----------------------
        var user=list[userIndex];
        $(".list").append('<div class="item"><span class="prize">'+luck.curPrize.Name+'</span> '+user.UserName+'</div>');
        list.splice(userIndex,1);
        $.post(api+"draw",{"UserID":user.UserID,"prize":luck.curPrize.Name},function(data){
          
        });
    }
    //报名
    function enroll()
    {
        $.post(api+"enroll",{},function(data){
            var model=APIResult.getModel(data);
            if(APIResult.isok(model)){alert("报名成功");}
            else{alert(model.retmsg);}
        })
    }
</script>
<script>

</script>
</asp:Content>