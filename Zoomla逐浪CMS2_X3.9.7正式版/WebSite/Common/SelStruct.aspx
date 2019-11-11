<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelStruct.aspx.cs" Inherits="ZoomLaCMS.Common.SelStruct" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>选择部门</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<style type="text/css">
#app i{color:#999;}
ul {padding-left:0px;list-style-type:none;}
.list_ul{}
.list_ul .item{padding:3px 5px;cursor:pointer;position:relative;}
.list_ul .item:hover{background-color:#eee;}
.list_ul .item_l{position:absolute;}
.list_ul .item_l i:hover{color:#0094ff;}
.list_ul .item_r{margin-left:18px;}
#choosed_ul{}
#choosed_ul li{padding:3px 5px;cursor:pointer;}
#choosed_ul li:hover{background-color:#eee;}
</style>
<div id="app" style="width:700px;height:500px; margin:0 auto;border:1px solid #ddd;overflow:hidden;padding-left:10px;padding-right:10px;">
    <div class="row" style="margin-top:5px;">
        <div class="col-8" style="border-right:1px solid #ddd;height:500px;overflow-y:auto;">
            <div style="position:relative;">
                <i class="zi zi_search" style="position:absolute;left:8px;top:8px;"></i>
                <input type="text" class="form-control" placeholder="搜索部门" style="padding-left:28px;" v-model="skey" v-on:keyup="filterSkey()"/>
            </div>
            <ul class="list_ul" v-if="skey==''">
                <table-component v-for="item in list" v-bind:list="item"></table-component>
            </ul>
            <ul class="list_ul" v-if="skey!=''">
               <li v-for="item in searched">
                   <div class="item" v-on:click="choose(item);">
                       <div class="item_l">
                           <i class="zi zi_file"></i>
                       </div>
                       <div class="item_r">
                           <span>{{item.name}}</span>
                           <i class="zi zi_check" style="color: green;" v-if="item.ischeck"></i>
                       </div>
                   </div>
                </li>
            </ul>
        
        </div>
        <div class="col-4" style="overflow-y:auto;">
            <div>已选择的部门</div>
            <ul id="choosed_ul">
                <li v-for="item in choosed" v-on:click="remove(item)" title="点击移除">
                    <i class="zi zi_file"></i>
                    <span>{{item.name}}</span>
                    <i class="zi zi_times" style="float:right;"></i>
                </li>
            </ul>
        </div>
    </div>
</div>



</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/dist/vue/vue.min.js"></script>
<script type="text/x-template" id="table-component-template">
<li>
   <div class="item" v-on:click="choose(list);">
         <div class="item_l" @click.stop="toggle($event,list)" v-if="list.child.length>0">
             <i class="zi zi_folders" v-if="!list.isopen"></i>
             <i class="zi zi_folderOpen" v-if="list.isopen"></i>
         </div>
         <div class="item_l" v-if="list.child.length==0">
             <i class="zi zi_file"></i>
         </div>
         <div class="item_r" >
             <span>{{list.name}}</span>
             <i class="zi zi_check" style="color: green;" v-if="list.ischeck"></i>
         </div>
     </div>
   <ul style="display:none;" v-bind:style="showDepth(list)">
        <table-component v-for="itemc in list.child" :list="itemc"></table-component>
    </ul>
</li>
          
</script>
<script>
    var parent=<%=Newtonsoft.Json.JsonConvert.SerializeObject(parent)%>;
    Vue.component("table-component",{
        template:"#table-component-template",
        props:['list'],//传递数据
        methods:{
            choose:function(item){
                app.choose(item);
            },
            showDepth:function(item){
                return{"padding-left":(item.depth*20)+"px"}
            },
            /* 展开折叠操作 */
            toggle:function(event,item){
                var _this = $(event.currentTarget);//点击的对象
                var $ul=$(_this).closest("li").find("ul:first");
                if(item.isopen)//$ul.is(":visible")
                {
                    item.isopen=false;
                    $ul.slideUp();
                }
                else
                {
                    item.isopen=true;
                    $ul.slideDown();
                }
            },
            //是否被搜索
            //isSkey:function(item){
            //    console.log(app.skey);
            //    if(!app.skey){return true;}
            //    if(item.name.indexOf(app.skey)>-1){return true;}
            //    else{return false;}
            //}
        },
    })
    var app = new Vue({
        el: "#app",
        data: {
            //全部数据
            list:parent.child,
            //被选中的数据
            choosed:[],
            //被搜索命中的数据
            searched:[],
            skey:"",
        },
        methods: {
            //选择部门
            choose:function(item){
                item.ischeck=!item.ischeck;
                if(item.ischeck)
                {
                    app.choosed.push(item);
                }
                else{
                    app.remove(item);
                } 
            },
            //移除已选择的部门
            remove: function (item) {
                item.ischeck=false;
                for (var i = 0; i <app.choosed.length; i++) {
                    if(app.choosed[i]==item){app.choosed.splice(i,1);return;}
                }
            },
            filterSkey:function(){
                var ref=this;
                ref.searched=[];
                if(!ref.skey){return;}
                //------------
                var searchList=function(list){
                    for (var i = 0; i < list.length; i++) {
                        if(list[i].name.indexOf(ref.skey)>-1){ref.searched.push(list[i]);}
                        if(list[i].child.length>0){searchList(list[i].child);}
                    }
                }
                searchList(ref.list);
            },
            init:function(){
                var ref=this;
                var chooseIds=",1,100,101,84,99,";
                //------递归检测
                var checkList=function(list){
                    for (var i = 0; i < list.length; i++) {
                        if(chooseIds.indexOf(","+list[i].id+",")>-1)
                        {
                            app.choose(list[i]);
                            if(list[i].child.length>0){checkList(list[i].child);}
                        }
                    }
                }
                checkList(ref.list);
            },
        },
        computed:{
            //filterSkey:function(){
            //    var ref=this;
            //    return this.list.filter(function (item) {
            //        if(!ref.skey){return true;}
            //        else{
            //            return (item.NodeName.indexOf(ref.skey)!=-1);
            //        }
            //    });
            //},
        },
    });
    app.init();
</script>
</asp:Content>