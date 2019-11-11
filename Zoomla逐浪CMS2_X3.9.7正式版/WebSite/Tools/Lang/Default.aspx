<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Tools.Lang.Default" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>国际化控制台</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<style type="text/css">
#EGV td>input{width:100%;}
#EGV thead th{border-bottom:none;}
.chk_wrap{display:block;margin-bottom:0px;}
.chk_wrap input{margin-left:5px;}
</style>
<div id="app" style="margin-top:20px;margin-left:300px;">
<div style="position:fixed;left:0px;top:20px;">
    <table class="table table-bordered">
        <tr><td style="width:80px;">引用键</td><td><input type="text" v-model="current.key"/></td></tr>
        <tr><td>中文</td><td><input type="text" v-model="current.cn"/></td></tr>
        <tr><td>英文</td><td><input type="text" v-model="current.en"/></td></tr>
        <tr>
            <td></td>
            <td>
                <button type="button" class="btn btn-info btn-sm" v-on:click="addToList()"><i class="zi zi_plus"></i> 新建资源</button>
            </td>
        </tr>
        <tr><td colspan="2" class="text-center">
            <div><asp:Button runat="server" class="btn btn-primary btn-sm" Text="生成并覆盖现有语言资源" ID="SaveToXML" OnClientClick="return confirm('确定要更新语言XML吗');" OnClick="SaveToXML_Click"/></div>
            </td></tr>
    </table>
    <div class="card card-default">
        <div class="card-header">操作提示</div>
        <div class="card-body">
            <div style="color:green;margin-bottom:5px;" v-for="tip in tips">{{tip}}</div>
        </div>
    </div>
</div>
<div class="input-group" style="margin-bottom:5px;">
    <span class="input-group-prepend">
       <span class="input-group-text">引用键</span></span>
    <input type="text" class="form-control" placeholder="请输入引用键名" v-model="skey"/>
</div>
<table class="table table-bordered" id="EGV">
    <thead><tr><th style="width:150px;"><label class="chk_wrap">引用键<input type="radio" name="empty_rad" value=""/></label></th>
        <th><label class="chk_wrap">中文<input type="radio" name="empty_rad" value="cn" />(仅显示空数据)</label></th>
        <th><label class="chk_wrap">英文<input type="radio" name="empty_rad" value="en"/></label></th>
        <!-- <th><label class="chk_wrap">法语<input type="radio" name="empty_rad" value="fr"/></label></th>
        <th><label class="chk_wrap">中国-藏语<input type="radio" name="empty_rad" value="bo_cn"/></label></th>
        <th><label class="chk_wrap">中国-维语<input type="radio" name="empty_rad" value="ug_cn"/></label></th> 
        <th><label class="chk_wrap">中国-壮语<input type="radio" name="empty_rad" value="za_cn"/></label></th>
        <th><label class="chk_wrap">中国-彝文<input type="radio" name="empty_rad" value="ii_cn"/></label></th>
        <th><label class="chk_wrap">中国-朝鲜文<input type="radio" name="empty_rad" value="ko_cn" /></label></th>
        <th><label class="chk_wrap">中国-哈萨克文<input type="radio" name="empty_rad" value="kk_cn" /></label></th>
        <th><label class="chk_wrap">中国-蒙古文<input type="radio" name="empty_rad" value="mn_cn"/></label></th>
        <th><label class="chk_wrap">俄语<input type="radio" name="empty_rad" value="ru" /></label></th>
        <th><label class="chk_wrap">德语<input type="radio" name="empty_rad" value="de" /></label></th>
        <th><label class="chk_wrap">日语<input type="radio" name="empty_rad" value="ja" /></label></th>
	    <th><label class="chk_wrap">西班牙语<input type="radio" name="empty_rad" value="es" /></label></th>
		<th><label class="chk_wrap">葡萄牙语<input type="radio" name="empty_rad" value="pt" /></label></th>
		<th><label class="chk_wrap">阿拉伯语<input type="radio" name="empty_rad" value="ar" /></label></th>
        <th><label class="chk_wrap">老挝语<input type="radio" name="empty_rad" value="lo" /></label></th>
        <th><label class="chk_wrap">缅语<input type="radio" name="empty_rad" value="my" /></label></th>-->
        <th><label class="chk_wrap">柬语<input type="radio" name="empty_rad" value="khm" /></label></th>
        <th><label class="chk_wrap">孟加拉语<input type="radio" name="empty_rad" value="bn" /></label></th>
        <th></th></tr></thead>
    <tbody>
        <tr v-for="item in getList()">
            <td><input type="text" v-model="item.key"/></td>
            <td><input type="text" v-model="item.cn"/></td>
            <td><input type="text" v-model="item.en"/></td>
            <!-- <td><input type="text" v-model="item.fr"/></td>
            <td><input type="text" v-model="item.bo_cn"/></td>
            <td><input type="text" v-model="item.ug_cn"/></td> 
            <td><input type="text" v-model="item.za_cn"/></td>
            <td><input type="text" v-model="item.ii_cn"/></td>
            <td><input type="text" v-model="item.ko_cn"/></td>
            <td><input type="text" v-model="item.kk_cn"/></td>
            <td><input type="text" v-model="item.mn_cn"/></td>
            <td><input type="text" v-model="item.ru"/></td>
            <td><input type="text" v-model="item.de"/></td>
            <td><input type="text" v-model="item.ja"/></td>
			<td><input type="text" v-model="item.es"/></td>
			<td><input type="text" v-model="item.pt"/></td>
			<td><input type="text" v-model="item.ar"/></td>
            <td><input type="text" v-model="item.lo"/>
            <td><input type="text" v-model="item.my"/>-->
            <td><input type="text" v-model="item.khm"/>
            <td><input type="text" v-model="item.bn"/>
            <td style="width:90px;">
                <button type="button" v-on:click="save(item)"><i class="zi zi_save"></i></button>
                <button type="button" v-on:click="del(item)"><i class="zi zi_trash"></i></button>
            </td>
        </tr>
        <tr><td colspan="10" style="text-align:center;">共&nbsp;<span id="LblRowsCount" style="font-weight: bold;">{{page.itemCount}}</span>&nbsp;条记录&nbsp;&nbsp;
            <a href="javascript:;" style="margin-right: 5px;" v-on:click="page_change('first')">首页</a>
            <a href="javascript:;" style="margin-right: 5px;" v-on:click="page_change('pre');">上一页</a>
            <a href="javascript:;" style="margin-right: 5px;" v-on:click="page_change('next');">下一页</a>
            <a href="javascript:;" style="margin-right: 5px;" v-on:click="page_change('last')">尾页</a>
            页次：
        <span style="color: Red; font-weight: bold;">{{page.cpage}}</span>/<span style="font-weight: bold;">{{page.pcount}}</span>页&nbsp;&nbsp;
            <input type="text" v-model="page.psize" maxlength="3" style="width: 35px; text-align: center;">条记录/页&nbsp;&nbsp;转到第<input type="text" v-model="page.cpage" style="width:60px;"/>页 





        </td></tr>
    </tbody>
</table>
<%--<div style="position:fixed;bottom:0px;width:100%;left:0px; padding:15px;background-color:rgba(0, 0, 0, 0.50);text-align:center;">
    <asp:Button runat="server" ID="XmlToDT" Text="导入数据库" OnClick="XmlToDT_Click"/>
    <asp:Button runat="server" class="btn btn-primary btn-sm" ID="RemoveDup" Text="检测并去除重复" OnClick="RemoveDup_Click"/>
</div>--%>

   
</div>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-6">工作日志</h1>
    <p class="lead">
	190514完成：中文简体、英文、法语、中国-藏语、中国-维语，隐去[法语、中国-藏语、中国-维语、中国-壮语、中国-彝文]设计列方便工作。<br/>
	190514增加：中国-彝文，于190517完成。<br/>
	190518增加：中国-蒙古文<br/>
	190520增加：中国-朝鲜文、中国-哈萨克文<br/>
	190523增加：俄语、德语、日语<br/>
	190531增加：西班牙语、葡萄牙语、阿拉伯语<br/>
    190617增加：老挝语 缅语<br/>
    190620增加：柬语 孟加拉语 剩余印地语、泰语、波斯语
	</p>
  </div>
</div>


</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script src="/dist/vue/vue.min.js"></script>
    <script src="/JS/Modal/APIResult.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script src="/JS/ZL_Regex.js"></script>
    <script>
        var app = new Vue({
            el: "#app",
            mounted:function(){
                var ref=this;
                this.current=this.newMod();
                $(function(){
                    $("input[name=empty_rad]").click(function(){
                        comdiag.ShowMask("正在加载....");
                        //重新加载
                        $.post("?action=list",{"empty":this.value},function(data){
                            var model=APIResult.getModel(data);
                            comdiag.CloseModal();
                            if(APIResult.isok(model)){
                                ref.list=model.result;
                            }
                            else{alert("加载失败:"+model.retmsg);}
                        })
                    });
                })
            },
            data: {
                current:{id:0},
                skey:"",
                tips:[],//操作提示
                page:{cpage:1,psize:20,pcount:1,itemCount:1},
                list:<%=Newtonsoft.Json.JsonConvert.SerializeObject(langDT)%>
            },
            methods: {
                page_get:function(list){
                    var ref=this;
                    var result=[];
                    var cpage=(ref.page.cpage-1);if(cpage<0){cpage=0;}
                    var psize=ref.page.psize;
                    for (var i = cpage*psize; i <((cpage+1)*psize)&&i<list.length; i++) {
                        result.push(list[i]);
                    }
                    var pcount=1;
                    if (psize > 0 && result.length > 0){pcount = parseInt(list.length / psize) + ((list.length % psize > 0) ? 1 : 0);} 
                    ref.page.pcount=pcount;
                    ref.page.itemCount=list.length;
                    console.log(ref.page.pcount,ref.page.psize,list.length);
                    return result;
                },
                page_change:function(type){
                    var ref=this;
                    switch(type)
                    {
                        case "pre":
                            ref.page.cpage--;
                            break;
                        case "next":
                            ref.page.cpage++;
                            break;
                        case "last":
                            ref.page.cpage=ref.page.pcount;
                            break;
                        case "first":
                            ref.page.cpage=1;
                            break;
                        default:
                            ref.page.cpage=parseInt(type);
                            break;
                    }
                    if(ref.page.cpage<1){ref.page.cpage=1;}
                    if(ref.page.cpage>ref.page.pcount){ref.page.cpage=ref.page.pcount;}
                    return;
                },
                //------------------------------
                addTip:function(msg){
                    var ref=this;
                    if(ref.tips.length>=10){ref.tips.pop();}
                    ref.tips.unshift(msg);
                },
                //改为不即时更新,避免修改文字后即消逝
                getList:function(){
                    var ref=this;
                    var result=ref.list;
                    if(ref.skey){
                        result= result.filter(function (item) {
                            return item.key.indexOf(ref.skey)>-1;
                        })
                    }
                    //if(ref.empty_rad){
                    //    result= result.filter(function (item) {
                    //        return (!item[ref.empty_rad]);
                    //    })
                    //}
                    return ref.page_get(result);
                },
                addToList:function(){
                    var ref=this;
                    ref.saveTo(ref.current,function(model){
                        ref.list.unshift(ref.current);
                            ref.current=ref.newMod();
                    })
                },
                del: function (item) {
                    if(!confirm("确定要删除吗?")){return false;}
                    var ref = this;
                    for (var i = 0; i < ref.list.length; i++) {
                        if (ref.list[i] == item) { ref.list.splice(i, 1); break;}
                    }
                    $.post("?action=del", { "id": item.id }, function () { })
                },
                newMod:function(){
                    return { id: 0, key: "", cn: "", en: "" };
                },
                save: function (item) {
                    var ref=this;
                    if(ref.saveTo(item)){ ref.addTip("["+item.key+"]保存成功");}
                   
                },
                saveTo:function(item,cb){
                    if(ZL_Regex.isEmpty(item.key)){alert("引用键不能为空");return false;}
                    //if(ZL_Regex.isEmpty(item.cn)){alert("中文不能为空");return false;}
                    //if(ZL_Regex.isEmpty(item.en)){alert("英文不能为空");return false;}
                    item.key=item.key.replace(/ /ig,"");
                    var packet={"model":JSON.stringify(item)};
                    if(packet.model.indexOf("&")>-1){alert("不能包含特殊符号");return false;}
                    $.post("?action=add",packet,function(data){
                        var model=APIResult.getModel(data);
                        if (APIResult.isok(model)) {if(model.result){item.id = model.result;}  if(cb){cb(model)};}
                        else{alert("保存失败:"+model.retmsg);}

                    })
                    return true;
                }
            }
        });
    </script>
</asp:Content>