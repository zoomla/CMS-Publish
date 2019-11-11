<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MobileUP.ascx.cs" Inherits="Extend_Common_MobileUP" %>
<div>
    <div class="weui-cells weui-cells_form" id="uploader_<%:Field %>" style="margin-top: 0;">
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <div class="weui-uploader">
                    <div class="weui-uploader__hd">
                        <p class="weui-uploader__title"><%:Text %></p>
                        <div class="weui-uploader__info"><span id="uploadCount_<%:Field %>">0</span>/<%:MaxCount %></div>
                    </div>
                    <div class="weui-uploader__bd">
                        <ul class="weui-uploader__files" id="uploaderFiles_<%:Field %>"></ul>
                        <div class="weui-uploader__input-box">
                            <input id="uploaderInput_<%:Field %>" class="weui-uploader__input" type="file" accept="image/*" multiple="">
            <%--                image/gif,image/jpeg,image/png,image/jpg,image/bmp--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="txt_<%:Field %>" name="txt_<%:Field %>" value="<%:Value %>" />
</div>
<script>
    var a = function () {
        var mbup = { files: [], uploadCount: 0, field: "<%:Field%>", $hid: $("#txt_<%:Field%>"), maxcount: <%:MaxCount%> };
                mbup.uploadCountDom = document.getElementById("uploadCount_<%:Field%>");
                mbup.uploaderFiles = $("#uploaderFiles_<%:Field%>");
                mbup.init = function () {
                    var data = [];
                    if (mbup.$hid.val() == "") { return; }
                    data = JSON.parse(mbup.$hid.val());
                    for (var i = 0; i < data.length; i++) {
                        data[i].url=mbup.getImgUrl(data[i].url);
                    }
                    for (var i = 0; i < data.length; i++) {
                        mbup.files.push({ id: (i + 1), name: "" + i, url: data[i].url, imgurl: data[i].url });
                        var $item = $('<li class="weui-uploader__file" data-id="' + (i + 1) + '" style="background-image: url(' + data[i].url + ');"></li>');
                        mbup.uploaderFiles.append($item);
                        //----------------------------------
                    }
                    mbup.uploadCount = data.length;
                    mbup.uploadCountDom.innerHTML = mbup.uploadCount;
                    mbup.updateUPBox();
                }
                mbup.del = function (id) {
                    for (var i = 0; i < mbup.files.length; i++) {
                        if (mbup.files[i].id == id) { mbup.files.splice(i, 1); }
                    }
                    mbup.updateFileJson();
                }
                mbup.updateFileJson = function () {
                    var list = [];
                    var $hid = mbup.$hid;
                    if (mbup.files.length < 1) { $hid.val(""); }
                    for (var i = 0; i < mbup.files.length; i++) {
                        var file = mbup.files[i];
                        var model = { url: file.imgurl, desc: "" };
                        list.push(model);
                    }
                    $hid.val(JSON.stringify(list));
                    mbup.updateUPBox();
                    //页面上存在回调方法
                    if(window.mbup_callback){window.mbup_callback(list);}
                }
                mbup.updateUPBox=function(){
                    //检测现有图片数量,超则隐藏上传按钮,否则显示
                    var $upBox=$("#uploader_"+mbup.field).find(".weui-uploader__input-box");
                    if(mbup.files.length>=mbup.maxcount){  $upBox.hide();}
                    else{ $upBox.show();}
                }
                weui.uploader('#uploader_<%:Field%>', {
                    url: '/Plugins/Uploadify/UploadFileHandler.ashx',
                    auto: true,
                    type: 'file',
                    fileVal: 'file',
                    compress: {
                        width: 1600,
                        height: 1600,
                        quality: .8
                    },
                    onBeforeQueued: function onBeforeQueued(files) {
                        if (["image/jpg", "image/jpeg", "image/png", "image/gif"].indexOf(this.type) < 0) {
                            weui.alert('请上传图片');
                            return false;
                        }
                        if (this.size > 10 * 1024 * 1024) {
                            weui.alert('请上传不超过10M的图片');
                            return false;
                        }
                        if (files.length > mbup.maxcount) {
                            // 防止一下子选中过多文件
                            weui.alert('最多只能上传' + mbup.maxcount + '张图片，请重新选择');
                            return false;
                        }
                        if (mbup.uploadCount + 1 > mbup.maxcount) {
                            weui.alert('最多只能上传' + mbup.maxcount + '张图片');
                            return false;
                        }

                        ++mbup.uploadCount;
                        mbup.uploadCountDom.innerHTML = mbup.uploadCount;
                    },
                    //上传完成后调用
                    onSuccess: function onSuccess(ret) {
                        this.imgurl = ret;
                        mbup.files.push(this);
                        mbup.updateFileJson();
                    },
                    onError: function onError(err) {
                        console.log("failed", err);
                    }
                });
                mbup.uploaderFiles[0].addEventListener('click', function (e) {
                    var target = e.target;

                    while (!target.classList.contains('weui-uploader__file') && target) {
                        target = target.parentNode;
                    }
                    if (!target) return;

                    var url = target.getAttribute('style') || '';
                    if (url) {
                        url = url.match(/url\((.*?)\)/)[1];
                    }
                    //上传完成后将图片转化为对象,并关联事件
                    var gallery = weui.gallery(url, {
                        className: 'custom-name',
                        onDelete: function onDelete() {
                            weui.confirm('确定删除该图片？', function () {
                                --mbup.uploadCount;
                                mbup.uploadCountDom.innerHTML = mbup.uploadCount;
                                target.remove();
                                gallery.hide();
                                mbup.del($(target).data("id"));
                            });
                        }
                    });
                });
                mbup.getImgUrl = function (url)
                {
                    if(!url){return "";}
                    url=url.toLocaleLowerCase();
                    var updir = <%:ZoomLa.Components.SiteConfig.SiteOption.UploadDir.ToLower()%>;
                if (url.indexOf("://") > 0)//不做处理
                {
 
                }
                else if (url.indexOf("uploadfiles/") != 0 && url.indexOf(updir) != 0)
                {
                    url = updir + url;
                }
                //url = "/" + url.TrimStart('/').Replace("//", "/");
                return url;
            }
                mbup.init();
            }();

</script>
