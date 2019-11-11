<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ADManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.ADManage" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>广告管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("ADManage.aspx","广告管理"),
        new Bread() {url="ADManage.aspx", text="广告列表 <a href='Advertisement.aspx?ZoneID='>[添加广告]</a>",addon="" }}
		)
    %>
	<div class="list_choice">
    <ul class="nav nav-tabs">
        <li class="nav-item" id="tab0"><a class="nav-link active" href="#tab0" data-toggle="tab" onclick="location='ADManage.aspx?ZoneId=<%=Request.QueryString["ZoneId"] %>';">所有广告</a></li>
        <li class="nav-item" id="tab1"><a class="nav-link" href="#tab1" data-toggle="tab" onclick="location='ADManage.aspx?ZoneId=<%=Request.QueryString["ZoneId"] %>&type=1';">图片</a></li>
        <li class="nav-item" id="tab2"><a class="nav-link" href="#tab2" data-toggle="tab" onclick="location='ADManage.aspx?ZoneId=<%=Request.QueryString["ZoneId"] %>&type=2';">动画</a></li>
        <li class="nav-item" id="tab3"><a class="nav-link" href="#tab3" data-toggle="tab" onclick="location='ADManage.aspx?ZoneId=<%=Request.QueryString["ZoneId"] %>&type=3';">文本</a></li>
        <li class="nav-item" id="tab4"><a class="nav-link" href="#tab4" data-toggle="tab" onclick="location='ADManage.aspx?ZoneId=<%=Request.QueryString["ZoneId"] %>&type=4';">代码</a></li>
        <li class="nav-item" id="tab5"><a class="nav-link" href="#tab5" data-toggle="tab" onclick="location='ADManage.aspx?ZoneId=<%=Request.QueryString["ZoneId"] %>&type=5';">页面</a></li>
    </ul>
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ADID" PageSize="20" 
        OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无广告信息！！">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="">
                <ItemTemplate>
                    <input name="idchk" type="checkbox" value="<%#Eval("ADID")%>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ADID" HeaderText="序号" ItemStyle-CssClass=""/>
            <asp:TemplateField HeaderText="预览" ItemStyle-CssClass="td_m">
                <ItemTemplate><a class="preview" rel="<%#Eval("imgurl") %>" href="PreviewAD.aspx?ADId=<%#Eval("ADId")%>">预览</a> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="广告名称">
                <ItemTemplate><a href="Advertisement.aspx?ADId=<%#Eval("ADId")%>" title='<%# Eval("ADName")%>'><%# Eval("ADName")%></a> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="类型" ItemStyle-CssClass="td_m">
                <ItemTemplate><a href="ADManage.aspx?type=<%#Eval("ADType","{0}") %>"><%# GetADType(Eval("ADType","{0}")) %></a> </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="priority" HeaderText="权重" ItemStyle-CssClass="td_m" />
            <asp:TemplateField HeaderText="点击数" ItemStyle-CssClass="">
                <ItemTemplate><%#(bool)(Eval("countclick"))?Eval("clicks"):"不统计"%> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="浏览数" ItemStyle-CssClass="">
                <ItemTemplate><%#(bool)(Eval("countview"))?Eval("views"):"不统计"%> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="剩余天数" ItemStyle-CssClass="">
                <ItemTemplate><%#( (DateTime)(Eval("OverdueDate")) - DateTime.Now).Days%> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="已审核" ItemStyle-CssClass="">
                <ItemTemplate><%# (bool)Eval("Passed") == false ? "<span style=\"color: #ff0033\">×</span>" : "√"%> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="">
                <ItemTemplate>
                    <a href="Advertisement.aspx?ADId=<%# Eval("ADID") %>"><i class="zi zi_pencil" title="修改"></i> 编辑广告</a>  
                    <asp:LinkButton runat="server" CommandName="Copy" CommandArgument='<%# Eval("ADID") %>' ><i class="zi zi_copy" title="复制"></i> 复制</asp:LinkButton>
                    <asp:LinkButton runat="server" CommandName="Pass" CommandArgument='<%# Eval("ADID") %>'><i class="zi z01-icon202" title="审核"></i> <%# (bool)Eval("Passed") == false ? "已通过" : "待审核"%></asp:LinkButton>
                    <asp:LinkButton runat="server" CommandName="Del" OnClientClick="return confirm('确定要删除此广告?');" CommandArgument='<%# Eval("ADID") %>' ><i class="zi zi_trash-o" title="删除"></i></asp:LinkButton> 
					</ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
    <asp:Button ID="btndelete" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择广告');return false;}else{return confirm('你确定要删除选中的广告吗？')}" Text="删除广告" OnClick="btndelete_Click" class="btn btn-outline-danger" />
    <asp:Button ID="btnsetpassed" runat="server" Text="审核通过" OnClick="btnsetpassed_Click" class="btn btn-outline-info" />
    <asp:Button ID="btncancelpassed" runat="server" Text="取消审核" OnClick="btncancelpassed_Click" class="btn btn-outline-danger" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/SelectCheckBox.js"></script>
    <script src="/js/Common.js"></script>
    <script>
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=idchk]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
        var tID = 0;
        //添加专题
        function pload() {
            var ID = '<%=Request.QueryString["type"]%>';
            if (ID != '') {
                document.getElementById(arrTabs[ID].toString()).style.display = "";
                document.getElementById(arrTabs[ID].toString()).className = "titlemouseover";
                document.getElementById("Div").className = "tabtitle";

            } else {
                document.getElementById("Div").style.display = "";
                document.getElementById("Div").className = "titlemouseover";
                tID = ID;
            }
        }

        var tipTimer;
        function locateObject(n, d) {
            var p, i, x;

            if (!d) d = document;

            if ((p = n.indexOf('?')) > 0 && parent.frames.length)

            { d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p); }

            if (!(x = d[n]) && d.all) x = d.all[n];

            for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];

            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = locateObject(n, d.layers[i].document); return x;
        }

        function showerrimg(obj) {
            obj.src = '/UploadFiles/nopic.svg';
        }
    </script>
    <script>
        this.imagePreview = function () {
            xOffset = 10;
            yOffset = 30;
            $("a.preview").hover(function (e) {
                //alert(this.rel);
                this.t = this.title;
                this.title = "";
                var c = (this.t != "") ? "<br/>" + this.t : "";
                $("body").append("<div id='preview'><img src='" + this.rel + "' alt='Image preview' onerror='javascript:errpic(this);' />" + c + "</div>");
                $("#preview")
            .css("top", (e.pageY - xOffset) + "px")
            .css("left", (e.pageX + yOffset) + "px")
            .css("z-index", "1000")
            .fadeIn("fast");

                GetImageSize();
                var W = imgWidth > 600 ? "600" : imgWidth;
                var H = imgHeight > 600 ? "600" : imgHeight;
                if (imgWidth <= imgHeight) {
                    W = imgWidth / imgHeight * H;
                } else {
                    H = imgHeight / imgWidth * W;
                }
                $("#preview img").css("height", H);
                $("#preview img").css("width", W);
            },
    function () {
        this.title = this.t;
        $("#preview").remove();
    });
            $("a.preview").mousemove(function (e) {
                $("#preview")
            .css("top", (e.pageY - xOffset) + "px")
            .css("left", (e.pageX + yOffset) + "px");
            });
        };
        $(document).ready(function () {
            imagePreview();
        });
        var OriginImage = new Image();
        var imgWidth;
        var imgHeight;
        function GetImageSize() {
            OriginImage.src = $("#preview img").attr("src");
            imgWidth = OriginImage.width;
            imgHeight = OriginImage.height;
        }
        function errpic(thepic) {
            $("#preview img").attr("src", "/UploadFiles/nopic.svg");
            OriginImage.src = "/UploadFiles/nopic.svg";
            imgWidth = OriginImage.width;
            imgHeight = OriginImage.height;
        }
        $().ready(function () {
            var type = getParam("type");
            if (type) {
                $("#tab0").find("a").removeClass("active");
                $("#tab" + type).find("a").addClass("active");
            }

        });
    </script>
</asp:Content>

