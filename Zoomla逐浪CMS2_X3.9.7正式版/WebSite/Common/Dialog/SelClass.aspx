<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelClass.aspx.cs" Inherits="ZoomLaCMS.Common.Dialog.SelClass" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>多級复制选择</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<style type="text/css">
.btn-light{border:1px solid #ddd;margin-right:5px;min-width:135px;text-align:left;position:relative;}
.btn-light .form-control{width:400px;}
.item{border-top:1px solid #ddd;padding-top:5px;}
.footerBtns{position:fixed;width:100%;bottom:0px;
            padding:5px;background-color:rgba(0, 0, 0, 0.40);text-align:center;}
</style>
<div id="app" style="min-height:700px;">
       <div>
           <label class="btn btn-light" v-for="item in list" @click.stop="showChild(item,'radio')"><input type="radio" value="{{item.v}}" name="s0"/>{{item.n}}</label>
       </div>
       <div class="item" v-for="parent in choosed.s1" v-show="choosed.s1.length>0">
           <h4>{{parent.n}}</h4>
            <label class="btn btn-light" v-for="item in parent.list" @click.prevent="showChild(item,parent.type)">
               <span v-if="parent.type=='radio'"><input type="radio" value="{{item.v}}" v-bind:checked="radioChecked(item)"/>{{item.n}}</span>
               <span v-if="parent.type=='checkbox'"><input type="checkbox" value="{{item.v}}"  v-bind:checked="item.checked"/>{{item.n}}</span>
                <span v-if="item.n=='其他'">
                    <input type="text" class="form-control" v-model="item.v"/>
                </span>
           </label>
       </div>
       <div class="item" v-for="parent in choosed.s2" v-show="isShowChild(choosed.s2)">
            <h4>{{parent.n}}</h4>
            <label class="btn btn-light" v-for="item in parent.list" @click.prevent="showChild(item,parent.type)">
               <span v-if="parent.type=='radio'"><input type="radio" value="{{item.v}}"  v-bind:checked="radioChecked(item)"/>{{item.n}}</span>
               <span v-if="parent.type=='checkbox'"><input type="checkbox" value="{{item.v}}" v-bind:checked="item.checked"/>{{item.n}}</span>
               <span v-if="item.n=='其他'">
                   <input type="text" class="form-control" v-model="item.v"/>
               </span>
           </label>
       </div>
       <!--该层使用name的方法实现多选,后台使用name,而不是s4获取-->
       <div class="item" v-for="parent in choosed.s3"  v-show="isShowChild(choosed.s3)">
           <div v-if="parent.n!='其他'">
               <h4>{{parent.n}}</h4>
               <label class="btn btn-light" v-for="item in parent.list" @click.prevent="showChild(item,parent.type)">
                   <span><input type="radio" value="{{item.v}}"  v-bind:checked="radioChecked(item)"/>{{item.n}}</span>
               </label>
           </div>
       </div>
<div style="height:50px;"></div>
<div class="footerBtns">
    <button type="button" class="btn btn-info" v-on:click="save()">确定选择</button>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/dist/vue/vue.min.js"></script>
<script>
    //未完成：其他如何保存
    //已完成：多选,其他,多checkbox层下级(同类) ,需要支持radio多选功能,如何存储
    var cfg = { id: "<%:Request["id"]%>", value: "" };
    var CMSOptions = {
        instance: {},
        get: function (tree) {
            var ref = this;
            if (!tree) { return ref.instance; }
            var getByValue = function (list, v) {
                for (var i = 0; i < list.length; i++) {
                    if (list[i].v == v) { return list[i]; }
                }
                return null;
            }
            var parent = ref.instance;
            var treeArr = tree.split('-');
            for (var i = 0; i < treeArr.length; i++) {
                if (!treeArr[i]) { continue; }
                parent = getByValue(parent.list,treeArr[i]);
            }
            return parent;
        },
        //批量添加
        addRange: function (tree, opArr) {
            var ref = this;
            var parent = ref.get(tree);
            if (!parent || parent == null) { console.error("addRange", "[" + tree + "]未定位"); return false; }
            for (var i = 0; i < opArr.length; i++) {
                var model = ref.newModel();
                model.level = parent.level + 1;
                model.tree = tree;
                model.v = model.n = opArr[i];
                parent.list.push(model);
            }
            return true;
        },
        newModel: function () {
            /*
              type :下级菜单的选择方式 radio|checkbox|radio_mult(子类的父层是多选,所该子类需要支持单选多选择)
              level:当前所处层级
              tree :层级数
            
            */
            return { "n": "", "v": "", "level": 0, "list": [], "type": "radio", "checked": false, "tree": "" };
        },
        init: function () {
            var ref = this;
            ref.instance = ref.newModel();
        }
    };
    CMSOptions.init();
    var s1 = "勘探测绘|设计|图审|项目管理|招标代理|监理|造价|施工总包|专业分包|房地产开发|建材检测|建材销售|机械设备销售|材料租赁|机械设备租赁|大中专院校|其他单位";
    CMSOptions.addRange("", s1.split('|'));
    CMSOptions.addRange("勘探测绘", "甲级|乙级|丙级".split('|'))
    //其下的所有选项均增加甲乙丙,需要扩展
    CMSOptions.addRange("设计", "综合、建筑、装饰、市政、园林、安装、其他".split('、'))//多选
    {
        var list = CMSOptions.get("设计").list;
        for (var i = 0; i < list.length; i++) {
            if (list[i].n == "其他") { continue; }
            list[i].type = "checkbox";
            CMSOptions.addRange("设计-" + list[i].n, (list[i].n + "甲级、" + list[i].n + "乙级、" + list[i].n + "丙级").split('、'));
        }
    }

    CMSOptions.addRange("图审", "其他".split('、'))
    CMSOptions.addRange("项目管理", "甲级、乙级、丙级".split('、'))
    CMSOptions.addRange("招标代理", "其他".split('、'))
    CMSOptions.addRange("监理", "综合资质、专业甲级、专业乙级、专业丙级、事务所".split('、'))
    CMSOptions.addRange("造价", "甲级、乙级、司法鉴定".split('、'))//多选
   

    CMSOptions.addRange("施工总包", "总承包、专业承包".split('、'))
    CMSOptions.addRange("施工总包-总承包", "房建、公路、铁路、水利、电力、矿山、市政公用、机电安装、其他".split('、'))
    CMSOptions.addRange("施工总包-专业承包", "地基与基础、土石方、装修装饰、幕墙、园林古建、钢结构、消防、机电安装、爆破与拆除、智能化、公路、水利、体育场地设施、城市及道路照明、送变电、堤防、桥梁、预应力".split('、'))
    {
        var list = CMSOptions.get("施工总包-专业承包").list;
        for (var i = 0; i < list.length; i++) {
            if (list[i].n == "其他") { continue; }
            list[i].type = "radio_multi";
            var ops = [];
            ops.push(list[i].n + "一级");
            ops.push(list[i].n + "二级");
            ops.push(list[i].n + "三级");
            CMSOptions.addRange("施工总包-专业承包-" + list[i].n, ops);
        }
    }
    {
        var list = CMSOptions.get("施工总包-总承包").list;
        for (var i = 0; i < list.length; i++) {
            if (list[i].n == "其他") { continue; }
            list[i].type = "radio_multi";
            var ops = [];
            ops.push(list[i].n + "特级");
            ops.push(list[i].n + "一级");
            ops.push(list[i].n + "二级");
            ops.push(list[i].n + "三级");
            CMSOptions.addRange("施工总包-总承包-" + list[i].n, ops);
        }
    }

    //多选
    CMSOptions.addRange("专业分包", "土石方、桩基、边坡支护、地基加固、爆破、结构加固、钢构、防水、保温、外墙涂料、耐磨地坪、门窗、栏杆、玻璃幕墙、石材干挂、铝板幕墙、玻璃雨蓬、地板、橱柜、背景墙、沥青道路、顶管、箱涵、绿化、古建、防腐木、给排水、电气、消防、空调、弱电、电梯、其他".split('、'))
    CMSOptions.addRange("房地产开发", "一级、二级、三级".split('、'))
    CMSOptions.addRange("建材检测", "其他".split('、'))//类别
    CMSOptions.addRange("建材销售", "建筑、装饰、市政、园林、安装、其他".split('、'))//多选
    CMSOptions.addRange("机械设备销售", "建筑、装饰、市政、园林、安装、其他".split('、'))//多选
    CMSOptions.addRange("材料租赁", "钢管、钢板、钢板桩、模板、彩板房、其他".split('、'))
    CMSOptions.addRange("机械设备租赁", "打桩、土方、起重、水平运输、混凝土及砂浆、动力设备".split('、'))
    CMSOptions.addRange("大中专院校", "一本、二本、大专、中专、职校".split('、'))

    CMSOptions.addRange("其他单位", "培训、税务、会计、房地产评估、律师、保险、翻译、软件".split('、'))
    CMSOptions.addRange("其他单位-培训", "岗前、BIM技术、执业资格、专升本、职称考试、其他".split('、'))
    CMSOptions.addRange("其他单位-房地产评估", "一级、二级、三级".split('、'))
    CMSOptions.addRange("其他单位-翻译", "其他".split('、'))
    CMSOptions.addRange("其他单位-软件", "综合、BIM、算量、计价、资料、财务、其他".split('、'))
    //---------设置不同的控件展示
    CMSOptions.get("设计").type = "checkbox";
    CMSOptions.get("造价").type = "checkbox";
    CMSOptions.get("施工总包-总承包").type = "checkbox";
    CMSOptions.get("施工总包-专业承包").type = "checkbox";
    CMSOptions.get("专业分包").type = "checkbox";
    CMSOptions.get("建材销售").type = "checkbox";
    CMSOptions.get("机械设备销售").type = "checkbox";
    CMSOptions.get("材料租赁").type = "checkbox";
    CMSOptions.get("机械设备租赁").type = "checkbox";
    //支持多选
    var emptyStr = JSON.stringify([{ n: "", list: [], empty: true }]);
    var app = new Vue({
        el: "#app",
        data: {
            list: CMSOptions.instance.list,
            //保存该项,0为基元,其余从1开始
            choosed: { s1:[], s2: [], s3: [], s4: [] }
        },
        created: function () {
            var ref = this;
            ref.choosed.s1 = JSON.parse(emptyStr);
            ref.choosed.s2 = JSON.parse(emptyStr);
            ref.choosed.s3 = JSON.parse(emptyStr);
            ref.choosed.s4 = JSON.parse(emptyStr);
        },
        methods: {
            save: function () {
                //所有层级树或json
                var ref = this;
                if (ref.choosed.s1[0].n == "") { alert("尚未选择分类"); return false; }
                var choosed = JSON.parse(JSON.stringify(ref.choosed));
                var text = "";//需返回的文本
                for (var key in choosed) {
                    var arr = choosed[key];
                    //移除默认空项
                    if (arr.length > 0 && arr[0].n == "") { arr.splice(0, 1); }
                    //移除list,减小保存体积
                    for (var i = 0; i < arr.length; i++) {
                        delete arr[i].list;
                        text += arr[i].v + "|";
                    }
                    text = text.substr(0, text.length - 1);
                    if (!text.endsWith("--")) { text += "--"; }
                    //拼接为保存用的text  S1-->S2|S2|S2--S3-S4
                }
                text = text.substr(0, text.length - 2);
                var result_json = JSON.stringify(choosed);
                var $parent = $(parent.document);
                $parent.find("#txt_" + cfg.id).val(text);
                $parent.find("#label_" + cfg.id).text(text);
                parent.CloseComDiag();
            },
            //当前单击的元素,上一级的type选项
            showChild: function (item, type) {
                var ref = this;
                var level = parseInt(item.level);
                var s = ref.choosed["s" + level];
                if (s[0] && s[0].n == '') { s.splice(0, 1); }
                //------------------------------------------------
                //根据type,决定radio或checkbox
                if (type == "radio") {
                    //ref.choosed.s1[0] = item;  //不会触发刷新
                    Vue.set(s, 0, item);
                }
                else if (type == "radio_multi") {
                    //检测parent,同类更新,否则新增
                    var existIndex = -1;
                    for (var i = 0; i < s.length; i++) {
                        if (s[i].tree == item.tree) { existIndex = i; break; }
                    }
                    if (existIndex < 0) { s.push(item); }
                    else { Vue.set(s, existIndex, item); }
                }
                else {//checkbox
                    //检测是否存在,存在则移除
                    if (item.checked) {
                        for (var i = 0; i < s.length; i++) {
                            if (s[i].v == item.v) { s.splice(i, 1); break; }
                        }
                    }
                    else {
                        var exist = false;
                        for (var i = 0; i < s.length; i++) { if (s[i].v == item.v) { exist = true; break; } }
                        if (exist == false) { s.push(item); }
                    }
                }
                item.checked = !item.checked;
                //清空下级选项
                for (var i = (level + 1) ; i <= 4; i++) {
                    ref.choosed["s" + i] = JSON.parse(emptyStr);
                }
            }
            //该单选框是否被选中
            , radioChecked: function (item) {
                var ref = this;
                var s = ref.choosed["s" + item.level];
                for (var i = 0; i < s.length; i++) {
                    if (s[i].v == item.v) { return true; }
                }
                return false;
            }
            , isShowChild: function (s) {
                if (!s) { return false; }
                else { return s[0].list.length > 0; }
            }
        }
    });
</script>
</asp:Content>