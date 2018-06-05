<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="ZoomLaCMS.Plugins.Monitor.View" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>监控浏览</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="divPlugin" class="plugin"></div>
            <div style="text-align: center; margin-top: 5px;">
                <input type="button" value="截取图片" onclick="clickCapturePic();" />
                <input type="button" value="开始录像" onclick="clickStartRecord();" />
                <input type="button" value="停止录像" onclick="clickStopRecord();" />
            </div>
        </div>
    </form>
</body>
</html>
<script src="/JS/jquery.min.js"></script>
<script src="codebase/webVideoCtrl.js?v=5"></script>
<script>
    //其在js中重写了console.log,在未开F12调试器的情况下,会导致监控无法运行
    var oLiveView = {
        iProtocol: 1,			// protocol 1：http, 2:https
        szIP: "<%=monMod.Domain%>",	// 可以为域名或IP
            szPort: "<%=monMod.M_Port%>",			// protocol port 180
                szUsername: "<%=monMod.M_User%>",	// device username
                szPassword: "<%=monMod.M_Pwd%>",	// device password
                iStreamType: 1,			// stream 1：main stream  2：sub-stream  3：third stream  4：transcode stream
                iChannelID: <%=monMod.M_Channel%>,			// channel no
            bZeroChannel: false		// zero channel
            };
    $(function () {
        // 检查插件是否已经安装过
        var iRet = WebVideoCtrl.I_CheckPluginInstall();
        if (-2 == iRet) {
            alert("您的Chrome浏览器版本过高，不支持NPAPI插件！");
            return;
        } else if (-1 == iRet) {
            alert("您还未安装过插件，双击开发包目录里的WebComponentsKit.exe安装！");
            return;
        }

        var oPlugin = {
            iWidth: $(window).width(),			// plugin width
            iHeight: $(window).height()-150			// plugin height
        };

        // 初始化插件参数及插入插件
        WebVideoCtrl.I_InitPlugin(oPlugin.iWidth, oPlugin.iHeight, {
            bWndFull: true,//是否支持单窗口双击全屏，默认支持 true:支持 false:不支持
            iWndowType: 1,
            cbSelWnd: function (xmlDoc) {

            }
        });
        WebVideoCtrl.I_InsertOBJECTPlugin("divPlugin");

        //// 检查插件是否最新
        if (-1 == WebVideoCtrl.I_CheckPluginVersion()) {
            alert("检测到新的插件版本，双击开发包目录里的WebComponentsKit.exe升级！");
            return;
        }
        // 登录设备
        WebVideoCtrl.I_Login(oLiveView.szIP, oLiveView.iProtocol, oLiveView.szPort, oLiveView.szUsername, oLiveView.szPassword, {
            success: function (xmlDoc) {
                // 开始预览
                WebVideoCtrl.I_StartRealPlay(oLiveView.szIP, {
                    iStreamType: oLiveView.iStreamType,
                    iChannelID: oLiveView.iChannelID,
                    bZeroChannel: oLiveView.bZeroChannel
                });
            }
        });

        // 关闭浏览器
        $(window).unload(function () {
            WebVideoCtrl.I_Stop();
        });
    });
    // 抓图
    function clickCapturePic() {
        var oWndInfo = oLiveView,
            szInfo = "";

        if (oWndInfo != null) {
            var szChannelID =oLiveView.iChannelID,
                szPicName = oWndInfo.szIP + "_" + szChannelID + "_" + new Date().getTime(),
                iRet = WebVideoCtrl.I_CapturePic(szPicName);
            if (0 == iRet) {
                szInfo = "抓图成功！";
            } else {
                szInfo = "抓图失败！";
            }
        }
    }
    // 开始录像
    function clickStartRecord() {
        var oWndInfo = oLiveView,
            szInfo = "";

        if (oWndInfo != null) {
            var szChannelID = oLiveView.iChannelID,
                szFileName = oWndInfo.szIP + "_" + szChannelID + "_" + new Date().getTime(),
                iRet = WebVideoCtrl.I_StartRecord(szFileName);
            if (0 == iRet) {
                szInfo = "开始录像成功！";
            } else {
                szInfo = "开始录像失败！";
            }
        }
    }

    // 停止录像
    function clickStopRecord() {
        var oWndInfo = oLiveView,
            szInfo = "";

        if (oWndInfo != null) {
            var iRet = WebVideoCtrl.I_StopRecord();
            if (0 == iRet) {
                szInfo = "停止录像成功！";
            } else {
                szInfo = "停止录像失败！";
            }
        }
    }
</script>
