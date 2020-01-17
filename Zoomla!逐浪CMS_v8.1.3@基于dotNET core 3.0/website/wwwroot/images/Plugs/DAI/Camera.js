
var Camera = {
    res: { stream: null, video: null, canvas: null },
    //初始化
    init: function (videoID) {
        if (videoID) { Camera.res.video = document.getElementById(videoID); }
        Camera.res.canvas = document.createElement("canvas");
        Camera.res.canvas.width = this.res.video.width;
        Camera.res.canvas.height = this.res.video.height;
    },
    //打开摄像头
    open: function () {
        navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
        if (navigator.getUserMedia) {
            navigator.getUserMedia({ video: true }, Camera.open_succed, Camera.open_fail);
        }
        else { console.log("浏览器不支持"); return false; }
    },
    open_succed: function (stream) {
        window.URL = window.URL || window.webkitURL || window.msURL || window.oURL;
        Camera.res.stream = stream;
        //chrome 升级后不再支持
        //Camera.res.video.src = (window.URL && window.URL.createObjectURL) ? window.URL.createObjectURL(Camera.res.stream) : Camera.res.stream;
        Camera.res.video.srcObject = Camera.res.stream;
        console.log("打开成功", Camera.res.video.src);
    },
    open_fail: function (error_details) { console.log("打开失败", error_details); alert("打开摄像头失败,站点必须为https,并在浏览器中授权许可"); },
    //关闭摄像头
    stop: function () {
        if (Camera.res.stream) {
            Camera.res.stream.stop(); Camera.res.stream = null;
        }
        Camera.res.video.src = "";
        console.log("已停止");
    },
    //拍照,并返回字符串
    shot: function () {
        var ctx = Camera.res.canvas.getContext("2d");
        ctx.drawImage(Camera.res.video, 0, 0);
        var base64Data = Camera.res.canvas.toDataURL();
        //var base64Data = base64Data.substr(22);
        //Camera.save(base64Data, function (url) { $("#test_img").attr("src", url); });
        return base64Data;
    },
    //传往服务器
    save: function (base64, cb) {
        SFileUP.AjaxUpBase64(base64, function (url) { cb(url); });
    }
    , saveBlob: function (base64, cb) {
        var ref = this;
        var blob = ref.dataURItoBlob(base64);
        var form = new FormData();
        form.append("file", blob,"blob.png");
        $.ajax({
            type: 'POST',
            url: '/User/Com/SaveFile',
            data: form,
            processData: false,
            contentType: false,
            success: function (data) {
                if (cb) { cb(data);}
            },
            error: function (a, b, c) { console.error("err", c); }
        });
    }
    //base64转换为blob用于服务端 存储  Code:/IO/SaveFile
    , dataURItoBlob: function (base64Data) {
        var byteString;
        if (base64Data.split(',')[0].indexOf('base64') >= 0)
            byteString = atob(base64Data.split(',')[1]);
        else
            byteString = unescape(base64Data.split(',')[1]);
        var mimeString = base64Data.split(',')[0].split(':')[1].split(';')[0];
        var ia = new Uint8Array(byteString.length);
        for (var i = 0; i < byteString.length; i++) {
            ia[i] = byteString.charCodeAt(i);
        }
        return new Blob([ia], { type: mimeString });
    }

};
//Camera.init("cam_vdo");
//Camera.open();