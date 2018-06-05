<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Plugins.CSSEditor.Default" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>CSS编辑器</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="app">
        <ul class="nav nav-tabs">
            <li class="nav-item"><a class="nav-link active" href="#background" data-toggle="tab">背景</a></li>
            <li class="nav-item"><a class="nav-link" href="#font" data-toggle="tab">字体</a></li>
            <li class="nav-item"><a class="nav-link" href="#whole" data-toggle="tab">宽高</a></li>
            <li class="nav-item"><a class="nav-link" href="#border" data-toggle="tab">边框</a></li>
            <li class="nav-item"><a class="nav-link" href="#position" data-toggle="tab">定位</a></li>
            <li class="nav-item"><a class="nav-link" href="#custom" data-toggle="tab">自定义</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="background">
                <ul class="fast_ul">
                    <li v-for="item in background.fast" class="btn btn-light" v-on:click="background.setFast(item)">{{item}}</li>
                </ul>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">背景颜色</span>
                    </div>
                    <input type="text" class="form-control text_x color_text" v-model="background.value.background_color" data-for="background" />
                </div>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">背景拉升</span>
                    </div>
                    <select class="form-control text_x" v-model="background.value.background_repeat">
                        <option value="">默认</option>
                        <option value="repeat">repeat</option>
                        <option value="repeat-x">repeat-x</option>
                        <option value="repeat-y">repeat-y</option>
                        <option value="no-repeat">no-repeat</option>
                    </select>
                </div>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">附加属性</span>
                    </div>
                    <select class="form-control text_x" v-model="background.value.background_attachment">
                        <option value="">默认</option>
                        <option value="fixed">fixed</option>
                        <option value="scroll" selected="selected">scroll</option>
                    </select>
                </div>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">背景尺寸</span>
                    </div>
                    <input type="text" class="form-control text_x" v-model="background.value.background_size"/>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">背景图片</span>
                    </div>
                    <input type="text" class="form-control" v-model="background.value.background_image"/>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">背景定位</span>
                    </div>
                    <input type="text" class="form-control" v-model="background.value.background_position"/>
                </div>
                <div class="clearfix"></div>
            </div>
            
            <div class="tab-pane" id="font">
                <div class="dropdown cssItem">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:100%;">
                        选择字体
                    </button>
                    <ul class="dropdown-menu" style="width:100%; max-height: 200px; overflow: auto;" role="menu">
                        <li v-for="item in font.famils" class="dropdown-item" v-bind:class="{active:item.v==font.value.font_family}" v-on:click="font.setFamily(item)"><a href="javascript:;">{{item.n}}</a></li>
                    </ul>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-prepend"><span class="input-group-text">文字大小</span></span>
                    <input type="number" class="form-control" v-model="font.value.font_size"/>
                    <select class="form-control" v-model="font.value.font_size_unit">
                        <option v-for="unit in common.units">{{unit}}</option>
                    </select>
                </div>
                <div class="input-group">
                    <span class="input-group-prepend"><span class="input-group-text">文字粗细</span></span>
                    <input type="number" class="form-control text_x" v-model="font.value.font_weight"/>
                </div>
                <div class="clearfix"></div>
                <div class="input-group">
                    <span class="input-group-prepend"><span class="input-group-text">字体颜色</span></span>
                    <input type="text" class="form-control text_x color_text" v-model="font.value.color" data-for="font"/>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-prepend"><span class="input-group-text">字体行高</span></span>
                    <input type="number" class="form-control" v-model="font.value.line_height" />
                    <select class="form-control" v-model="font.value.line_height_unit">
                        <option v-for="unit in common.units">{{unit}}</option>
                    </select>
                </div>
               <%-- <div class="input-group">
                    <%=Get_TextWithUnit("字体行高","line-height") %>
                </div>--%>
            </div>

            <div class="tab-pane" id="whole">
                <%=Get_TextWithUnit("元素宽度","wh.value.width") %>
                <%=Get_TextWithUnit("元素高度","wh.value.height") %>
                <%=Get_TextWithUnit("边距(padding)","wh.value.padding") %>
                <%=Get_TextWithUnit("边距(margin)","wh.value.margin") %>
                <div class="input-group">
                    <span class="input-group-prepend"><span class="input-group-text">显示属性</span></span>
                    <select class="form-control text_x" v-model="wh.value.display">
                        <option value="">默认</option>
                        <option value="none">none</option>
                        <option value="block">block</option>
                        <option value="inline">inline</option>
                        <option value="inline-block">inline-block</option>
                        <option value="flex">flex</option>
                    </select>
                </div>
     <%--        
                <div class="input-group">
                    <span class="input-group-prepend"><span class="input-group-text">鼠标指针</span></span>
                    <input type="text" class="form-control text_x" data-style="cursor" />
                </div>--%>
            </div>

            <div class="tab-pane" id="border">
                <%=Get_TextWithUnit("边框宽度","border.value.border_width") %>
                <div class="input-group">
                    <span class="input-group-prepend"><span class="input-group-text">边框颜色</span></span>
                    <input type="text" class="form-control text_x color_text" v-model="border.value.border_color" data-for="border"/>
                </div>
                <div class="input-group">
                    <span class="input-group-prepend"><span class="input-group-text">边框样式</span></span>
                    <select class="form-control text_x" v-model="border.value.border_style">
                        <option value="none">none</option>
                        <option value="solid">solid</option>
                        <option value="double">double</option>
                        <option value="groove">groove</option>
                        <option value="ridge">ridge</option>
                        <option value="inset">inset</option>
                        <option value="outset">outset</option>
                        <option value="dashed">dashed</option>
                        <option value="dotted">dotted</option>
                    </select>
                </div>
            </div>
            <div class="tab-pane" id="position">
                <div class="input-group">
                    <span class="input-group-prepend"><span class="input-group-text">元素定位</span></span>
                    <select class="form-control text_x" v-model="position.value.position">
                        <option value="">默认</option>
                        <option value="relative">relative</option>
                        <option value="absolute">absolute</option>
                        <option value="fixed">fixed</option>
                    </select>
                </div> 
                <%=Get_Text("优先等级","position.value.z_index") %>
                <%=Get_TextWithUnit("顶部(top)","position.value.top") %>
                <div class="clearfix"></div>
                <%=Get_TextWithUnit("右边(right)","position.value.right") %>
                <%=Get_TextWithUnit("底部(bottom)","position.value.bottom") %>
                <%=Get_TextWithUnit("左边(left)","position.value.left") %>
            </div>
            <div class="tab-pane" id="custom">
                <div>
                    <button type="button" class="btn btn-info" v-on:click="custom.add();"><i class="zi zi_plus"></i> 新增一行</button>
                </div>
                <div id="custom_body">
                    <div class="item input-group" v-for="item in custom.value">
                        <input type="text" class="form-control" v-model="item.css"/>
                        <span class="input-group-append">
                            <button type="button" class="btn btn-danger" v-on:click="custom.del(item);"><i class="zi zi_trashalt"></i></button>
                        </span>
                    </div>
                </div>
                <div class="alert alert-info" style="margin-top:3px;">示例:box-shadow: 10px 10px 5px #888888</div>
            </div>
        </div>
        <div style="clear: both;"></div>
        <div id="preview_wrap" style="border: 1px solid #ddd;">
            <div style="background-image: url(/images/grid.gif); position: relative; min-height: 330px; overflow: hidden; background-color: #ece9d8;">
                <div id="example">预览区<br />即时更新</div>
            </div>
        </div>
        <div class="card">
            <div class="card-header">最终代码(仅供浏览不支持修改-上方自定义支持自由编辑):</div>
            <div class="card-body" style="padding:0px;">
                <textarea id="css_text" style="height: 120px; width: 100%;  resize: none; padding-left: 10px;" placeholder="未指定css内容" v-model="showcss()"></textarea>
            </div>
        </div>
    </div>
    <div runat="server" visible="false">
        <div runat="server" id="Tlp_Text" visible="false">
            <div class="input-group">
                <span class="input-group-prepend"><span class="input-group-text">@text</span></span>
                <input type="text" class="form-control text_x" v-model="@model" />
            </div>
        </div>
        <div runat="server" id="TextWithUnit" visible="false">
            <div class="input-group mb-3">
                <span class="input-group-prepend"><span class="input-group-text">@text</span></span>
                <input type="number" class="form-control" v-model="@model" />
                <select class="form-control" v-model="@model_unit">
                    <option v-for="unit in common.units">{{unit}}</option>
                </select>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
        #navHolder { display: none; }
        .fast_ul{ margin:0;padding:0;}
        .fast_ul li { margin-right: 5px; margin-bottom: 5px; }
        .fast_ul .btn-light { border-color: #ddd; }
        .tab-pane { padding-top: 10px; }
        .tab-pane>.input-group { float: left; width: 363px; padding-right: 5px; margin-bottom: 5px; }
        .cssItem { float: left; width: 363px; padding-right: 5px; margin-bottom: 5px; }
        .dropdown-item a { text-decoration: none; }
        .dropdown-item.active a { color: #fff; }
                .text_75 { max-width: 75px; width: 75px; }
        .text_x { width: auto; max-width: 1000px; }
        #custom #custom_body{max-height:130px;overflow-y:auto;}
        #custom .item { margin-top: 5px; }
    </style>
    <link rel="stylesheet" href="/Plugins/CodeMirror/lib/codemirror.css">
    <link rel="stylesheet" href="/Plugins/CodeMirror/theme/eclipse.css">
    <link rel="stylesheet" type="text/css" href="/Design/JS/Plugs/color/bootstrap.colorpickersliders.min.css" />
    <script src="/JS/ZL_Regex.js"></script>
    <script src="/Design/JS/Plugs/color/tinycolor-min.js"></script>
    <script src="/Design/JS/Plugs/color/bootstrap.colorpickersliders.min.js?v=1"></script>
    <script src="/Design/JS/Plugs/Helper/StyleHelper.js"></script>
    <script src="/dist/vue/vue.js"></script>
    <script src="/Plugins/CodeMirror/lib/codemirror.js"></script>
    <script src="/Plugins/CodeMirror/mode/css.js"></script>
    <script src="assets/editor.js"></script>
</asp:Content>