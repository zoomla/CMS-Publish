<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Plugins.Third.Logo.Default" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>LOGO在线设计</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="container" style="margin-top:30px;margin-bottom:60px; width:1200px;">
        <table class="table table-bordered">
            <tr><td class="td_m">公司简称：</td><td><asp:TextBox runat="server" ID="CompName_T" class="form-control text_300 info" Text="公司名称" MaxLength="8"/></td></tr>
            <tr><td>副标：</td><td><asp:TextBox runat="server" ID="SubTitle_T" class="form-control text_300 info" MaxLength="10" Text="副标题文字"/></td></tr>
            <tr><td>所属行业：</td><td>
                <select class="form-control text_300" name="trade_dp">
                    <option value="">-----行业-----</option>
                    <option value="房产/建筑">房产/建筑</option>
                    <option value="体育/运动">体育/运动</option>
                    <option value="贸易/出口">贸易/出口</option>
                    <option value="计算机/互联网">计算机/互联网</option>
                    <option value="批发/零售">批发/零售</option>
                    <option value="教育/培训">教育/培训</option>
                    <option value="汽车/零配件">汽车/零配件</option>
                    <option value="制造/机械">制造/机械</option>
                    <option value="通信/电子">通信/电子</option>
                    <option value="咨询/调查">咨询/调查</option>
                    <option value="物流/运输">物流/运输</option>
                    <option value="服装/纺织">服装/纺织</option>
                    <option value="制药/医疗">制药/医疗</option>
                    <option value="数码/家电">数码/家电</option>
                    <option value="商务/租赁">商务/租赁</option>
                    <option value="服务/消费">服务/消费</option>
                    <option value="公关/会展">公关/会展</option>
                    <option value="广告/媒体">广告/媒体</option>
                    <option value="会计/保险">会计/保险</option>
                    <option value="生活/旅游">生活/旅游</option>
                    <option value="能源/矿产">能源/矿产</option>
                    <option value="游戏/娱乐">游戏/娱乐</option>
                    <option value="金融/银行">金融/银行</option>
                    <option value="非盈利性机构">非盈利性机构</option>
                    <option value="自然/农业">自然/农业</option>
                    <option value="艺术/时尚">艺术/时尚</option>
                    <option value="自动/机动">自动/机动</option>
                    <option value="家庭/儿童">家庭/儿童</option>
                    <option value="科学/研究">科学/研究</option>
                    <option value="商业/设计">商业/设计</option>
                    <option value="酒店/餐饮">酒店/餐饮</option>
                </select>
                <input type="button" class="btn btn-info" value="重新生成" onclick="recreate();"/>
            </td></tr>
        </table>
        <div class="logosBody">
            <asp:Repeater runat="server" ID="RPT" EnableViewState="false">
                <ItemTemplate>
                    <div class="item" data-id="<%#Eval("ID") %>">
                        <img/>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="clearfix"></div>
</div>
<div class="spvsBody margin_t10">
    <div class="item" style="background-image:url(<%=baseDir%>assets/spv/g01.jpg);">
        <img class="spv_logo" style="width: 45px; left: 80px; top: 240px; transform: rotate(-128deg);" src="#" />
        <img class="spv_logo" style="width: 45px; left: 215px; top: 125px; transform: rotate(-40deg);" src="#" />
        <img class="spv_logo" style="width: 45px; left: 458px; top: 35px; transform: rotate(90deg);" src="#" />
    </div>
    <div class="item" style="background-image:url(<%=baseDir%>assets/spv/n01.jpg);">
        <img class="spv_logo" style="width: 120px; left: 135px; top: 50px; transform: rotate(-20deg);" src="#" />
        <img class="spv_logo" style="width: 60px; left: 405px; top: 125px; transform: rotate(-25deg);" src="#" />
    </div>
    <div class="item" style="background-image:url(<%=baseDir%>assets/spv/v01.jpg);">
        <img class="spv_logo" style="width: 45px; left: 95px; top: 45px; transform: rotate(0deg);" src="#" />
        <img class="spv_logo" style="width: 55px; left: 330px; top: 60px; transform: rotate(0deg);" src="#" />
        <img class="spv_logo" style="width: 50px; left: 310px; top: 120px; transform: rotate(0deg);" src="#" />
    </div>
    <div class="item" style="background-image:url(<%=baseDir%>assets/spv/z01.jpg);">
        <img class="spv_logo" style="width: 50px; left: 400px; top: 60px; transform: rotate(0deg);" src="#" />
    </div>
    <div class="clearfix"></div>
</div>
</div>
<div class="Conent_fix">
    <asp:HiddenField runat="server" ID="LogoID_Hid" />
    <asp:Button runat="server" ID="Save_Btn" Text="下一步" OnClick="Save_Btn_Click" OnClientClick="return checkSub();" class="btn btn-primary"/>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <style type="text/css">
        .logosBody .item{width: 155px; height: 155px; text-align: center; line-height: 151px; position: relative; border: solid 1px #ddd;
              float:left;margin-right:10px;margin-bottom:10px;cursor:pointer;
        }
        .logosBody .item img{width:137px;height:137px;}
        .logosBody .item.active{border:1px solid #0094ff;}
        .spvsBody .item{width:570px;height:323px;position:relative;background-repeat:no-repeat;background-size:cover;float:left;margin-right:10px;margin-bottom:10px;}
        .spv_logo{z-index:10;border:none;position:absolute;}
        .Conent_fix { width: 100%; position:fixed; padding:10px 0 15px; bottom:0px; z-index:1000; background:#fff; border:1px solid #ddd; text-align:center;background:rgba(255,255,255,0.7); }
    </style>
    <script src="/JS/ZL_Regex.js"></script>
    <script>
        var imgUrl = "";
        $(function () {
            $(".logosBody .item").click(chkItem);
        })
        function chkItem() {
            var $item = $(this);
            $(".logosBody .item").removeClass("active");
            $item.addClass("active");
            $(".spv_logo").attr("src", imgUrl + "&LogoID=" + $item.data("id"));
            $("#LogoID_Hid").val($item.data("id"));
        }
        function checkSub() {
            if (ZL_Regex.isEmpty($("#CompName_T").val())) { alert("公司名称不能为空"); return false; }
            if ($(".logosBody .item.active").length < 1) { alert("未选择Logo"); return false; }
            return true;
        }
        function recreate() {
            var compName = $("#CompName_T").val();
            var subTitle = $("#SubTitle_T").val();
            if (ZL_Regex.isEmpty(compName)) { alert("公司名称不能为空"); return false; }
            imgUrl = "<%=baseDir%>CreateImg.aspx?cname=" + encodeURI(compName) + "&stitle=" + encodeURI(subTitle);
            $(".logosBody .item").each(function () {
                $(this).find("img").attr("src", imgUrl + "&LogoID=" + $(this).data("id"));
            });
            //触发单击事件,完成预览
            var $item = $(".logosBody .item.active");
            if ($item.length < 1) {
                $item =$(".logosBody .item:first");
            }
            setTimeout(function () { $item.click();},100);
        }
        recreate();
    </script>
</asp:Content>
