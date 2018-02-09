<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTouTiaoVideo.aspx.cs" Inherits="ZoomLaCMS.Manage.TouTiao.AddTouTiaoVideo" MasterPageFile="~/Manage/I/Default.master" %>

<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>发表视频</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="content_div">
        <table class="table table-bordered table-striped">
            <tr>
                <td>视频</td>
                <td>
                    <span id="upload_span">
                        <button id="upload_btn" type="button" class="btn btn-info" onclick='$("#upload_file").click();'>上传视频</button>
                        <input type="file" id="upload_file" class="hidden" />
                    </span>
                    <span id="success_span" style="display: none;">视频上传成功：<span class="video_name"></span>
                        <a href="javascript:;" onclick="refupload();">重新上传</a>
                    </span>
                </td>
            </tr>
            <tr>
                <td>标题</td>
                <td>
                    <asp:TextBox ID="Title_T" runat="server" Style="background: url(/Images/bg1.gif) repeat-x;" CssClass="form-control m715-50"></asp:TextBox></td>
                <asp:RequiredFieldValidator ID="Title_Req_V" runat="server" ControlToValidate="Title_T" ForeColor="red" Display="Dynamic" ErrorMessage="文章标题不能为空" />
                <asp:RegularExpressionValidator ID="Title_Reg_V" ControlToValidate="Title_T" ValidationExpression="\S{5,30}" Display="Dynamic" runat="server" ForeColor="red" ErrorMessage="标题长度要在5-30之间"></asp:RegularExpressionValidator>
            </tr>
            <tr>
                <td>视频简介</td>
                <td>
                    <asp:TextBox ID="Abstract" runat="server" TextMode="MultiLine" CssClass="form-control m715-50" Height="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>分类</td>
                <td>
                    <asp:DropDownList ID="Types_DP" runat="server" CssClass="form-control text_300"></asp:DropDownList>
                    <span class="green">视频会出现在视频频道</span>
                </td>
            </tr>
            <%--            <tr>
                <td>视频标签</td>
                <td class="manage_content">
                    <div id="OAkeyword"></div>
                    <asp:TextBox ID="Keywords" runat="server" CssClass="form-control" />
                    <asp:HiddenField runat="server" ID="IgnoreKey_Hid" />
                </td>
            </tr>--%>
            <%--            <tr>
                <td>视频封面</td>
                <td>
                    <ZL:SFileUp runat="server" ID="PreView_UP" FType="Img" />
                </td>
            </tr>--%>
        </table>
        <div class="text-center">
            <asp:Button ID="AddVideo_B" runat="server" CssClass="btn btn-info" OnClick="Add_B_Click" Text="发表" />
            <asp:HiddenField ID="UploadID_H" runat="server" />
            <asp:HiddenField ID="VideoName_H" runat="server" />
        </div>
    </div>
    <div class="clearbox" style="height: 20px;"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/OAKeyWord.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ZL_Content.js"></script>
    <script src="/JS/Modal/APIResult.js"></script>
    <script>
        //file控件选中文件则触发上传
        $("#upload_file").change(function () {
            $("#upload_btn").html($("#upload_btn").html() + " <i class='fa fa-spinner fa-spin'></i>").attr('disabled', 'false');
            uploadVideo.upload();
        });
        //需要先获取视频上传地址,再使用该地址提交视频,id仅用于获取状态与发内容时引用
        var uploadVideo = { fup: document.getElementById("upload_file"), upmod: { id: "", url: "http://win100:86/tools/Example.aspx" } };
        //根据文件大小自动选择并上传
        uploadVideo.upload = function () {
            var ref = this;
            var filesize = ref.fup.files[0].size;        //文件大小
            var action = filesize > 10 * 1024 * 1024 ? "getchunkurl" : "geturl";   //视频大于10M则分片上传
            action = "geturl"; //当前仅支持整体上传
            //获取upload_id,upload_url
            $.post("", { action: action }, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) {
                    console.log("获取上传id、url-Success", model.result);
                    //视频id和上传url
                    uploadVideo.upmod.id = model.result.id;
                    uploadVideo.upmod.url = model.result.url;
                    $("#UploadID_H").val(uploadVideo.upmod.id);
                    switch (action) {
                        case "getchunkurl":
                            uploadVideo.chunkUpload();
                            break;
                        case "geturl":
                            uploadVideo.singleUpload();
                            break;
                    }
                }
                else {
                    console.log("获取上传id、url-Error", model.retmsg);
                }
            });
        }

        //小视频上传
        uploadVideo.singleUpload = function () {
            var ref = this;
            $("#video_name").html(ref.fup.files[0].name);
            $("#VideoName_H").val(ref.fup.files[0].name);
            var formdata = new FormData();
            formdata.append("video_file", ref.fup.files[0]);
            $.ajax({
                url: "Transfer.aspx?url=" + ref.upmod.url,
                type: 'POST',
                data: formdata,
                processData: false,// 不处理发送的数据，因为data值是Formdata对象，不需要对数据做处理
                contentType: false,//不设置Content-Type请求头,根据Formdata自动生成
                success: function (data) {
                    console.log("整体上传：", data);
                    ref.getVideoStatus();
                }
            });
        }
        //大视频分片上传
        uploadVideo.chunkUpload = function () {
            var ref = this;
            var file = ref.fup;
            var files = ref.chunkFile(file.files[0], { size: 5 });
            ref.chunkPost(files, 0);
        }
        //文件分片
        uploadVideo.chunkFile = function (file, opts) {
            if (!opts) { opts = {}; }
            if (!opts.size) { opts.size = 5; }//默认5M一分片
            //分片,文件大小,文件名称
            var result = { chunks: [], size: file.size, name: file.name };
            //---------------------------------------
            var chunkSize = opts.size * 1024 * 1024;
            var count = Math.ceil(file.size / chunkSize);//分片数
            for (var i = 0; i < count; i++) {
                var model = { chunk: null, start: 0, end: 0 }
                var start = i * chunkSize, end = Math.min(file.size, start + chunkSize);
                model.chunk = file.slice(start, end);
                model.start = start;
                model.end = end;
                result.chunks.push(model);
                console.log(i + 1, model);
            }
            return result;
        }
        //分片上传
        uploadVideo.chunkPost = function (files, index) {
            var ref = this;
            var formdata = new FormData();
            var model = files.chunks[index];
            //必须指定,否则名称默认为blob
            formdata.append("video_file", model.chunk, files.name);
            $.ajax({
                url: "Transfer.aspx?url=" + ref.upmod.url,
                type: 'POST',
                data: formdata,
                processData: false,
                contentType: false,
                headers: { "Content-Range": "bytes " + model.start + "-" + (model.end - 1) + "/" + files.size },
                success: function (data) {
                    console.log(data);
                    index++;
                    if (files.chunks.length > index) {
                        uploadVideo.chunkPost(files, index++);
                    } else {
                        console.log("分片上传成功");
                    }
                }
            })
        }
        //获取上传视频状态
        uploadVideo.getVideoStatus = function () {
            var ref = this;
            //根据视频ID获取视频当前状态
            $.post("", { action: "status", upload_id: ref.upmod.id }, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) {
                    console.log("获取上传状态Success", model.result);
                    if (model.result.data && model.result.data.status == 10) {
                        $("#upload_span").hide();
                        $("#success_span").show();
                    } else if (model.result.data.status == 30) {
                        ref.getVideoStatus();
                    }
                }
                else {
                    console.log("获取上传状态Error", model);
                }
            })
        }
        function refupload() {
            if (!confirm("重新上传时，当前视频信息会被丢弃，确认？")) return;
            $("#upload_btn").html("上传视频").attr('disabled', 'true');
            $("#success_span").hide();
            $("#upload_span").show();
            $("#upload_file").click();
        }
    </script>
</asp:Content>
