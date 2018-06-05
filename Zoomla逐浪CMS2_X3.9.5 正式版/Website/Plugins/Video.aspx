<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Video.aspx.cs" Inherits="ZoomLaCMS.Plugins.Video" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>视频浏览</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
   <div class="container" style="margin-top:50px;">
        <div id="video" style="width: 1024px; height: 768px;"></div>
   </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
body{background-color:#ccc;}
</style>
<script src="/Plugins/chplayer/chplayer.min.js"></script>
<script>
        var videoObject = {
            container: '#video', //容器的ID或className
            variable: 'player',
            volume: 0.6, //默认音量
            //poster: 'screenshot/wdm.jpg', //封面图片地址
            autoplay: true, //是否自动播放
            loop: false, //是否循环播放
            live: false, //是否是直播
            loaded: 'loadedHandler', //当播放器加载后执行的函数
            seek: 0, //默认需要跳转的时间
            drag: '', //在flashplayer情况下是否需要支持拖动，拖动的属性是什么
            front: 'frontFun', //前一集按钮动作
            next: 'nextFun', //下一集按钮动作
            //flashplayer: true, //强制使用flashplayer
            //html5m3u8:true,//是否使用hls，默认不选择，如果此属性设置成true，则不能设置flashplayer:true,
            video: [
                ['<%:VPath%>', 'video/mp4', '中文标清', 0],
            ]
            /*video:[
                ['http://cdn.theoplayer.com/video/star_wars_episode_vii-the_force_awakens_official_comic-con_2015_reel_(2015)/index.m3u8','','标清',0],
                ['http://cdn.theoplayer.com/video/star_wars_episode_vii-the_force_awakens_official_comic-con_2015_reel_(2015)/index.m3u8','','高清',10]
            ]*/
        };
    var player = new chplayer(videoObject);

</script>
</asp:Content>