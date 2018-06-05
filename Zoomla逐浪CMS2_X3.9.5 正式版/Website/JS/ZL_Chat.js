var curChat;
var ZL_Chat = function () { curChat = this };

ZL_Chat.prototype.ajaxurl = "chat.ashx";
ZL_Chat.prototype.boundary = "------asjdfohponzvnzcvapowtunzafadsfwt";
ZL_Chat.prototype.myinfo = { UserID: "", UserName: "", UserFace: "", CDate: "00:00:00" };
//消息模板
ZL_Chat.prototype.tlp_othermsg = "<div class='otherchat'>"
             + "<div class='otherchat_face'><img src='@UserFace' class='userface otherface' onerror='this.src=\"/Images/userface/noface.png\";' /></div>"
             + "<div class='chat_cont_c'><p class='other_time'><span class='remindgray'>(@CDate)</span></p><div class='chat_content othercontent'>@Content</div><span class='arrow-before arrow'></span><span class='arrow-after arrow'></span></div></div>";//别人的模板
ZL_Chat.prototype.tlp_mymsg = "<div class='mychat'>"
               + "<div class='otherchat_face'><img src='@UserFace' class='userface otherface' onerror='this.src=\"/Images/userface/noface.png\";' /></div>"
               + "<div class='mychat_c'><p class='other_time'><span class='remindgray'>(@CDate)</span></p><div class='chat_content'>@Content</div><span class='arrow-before arrow'></span><span class='arrow-after arrow'></span></div></div>";//我说的话模板
ZL_Chat.prototype.tlp_chatBody= "<div id='chat_body_@uid' class='chat_body'><div class='chat_div'></div></div>";
ZL_Chat.prototype.tlp_online = "<li onclick='ChangeTalker(\"@UserID\",\"@UserName\");' class='list_item' id='list_item_@UserID'>"
                          + "<img src='/Images/userface/noface.png' class='member_face'>"
                          + "<p class='member_nick'>@UserName<br>"
                          + "<span class='isonline remindgray isonline_@UserID'>[在线]</span>"
                          + "<span id='unread_@UserID' class='badge'></span></p>"
                          + "<div style='clear:both;'></div></li>";
//仅刷新游客列表,加上新登录的游客,10秒检测一次
ZL_Chat.prototype.GetOnlineList = function () {
    var ref = curChat;
    ref.post("getonlinelist",{}, function (data) {
        if (data != "" && data != "[]") {
            data = JSON.parse(data);//所有在线游客json
            for (var i = 0; i < data.length; i++) {
                if ($("#list_item_" + data[i].UserID).length < 1) {
                    var tlp = ref.tlp_online.replace(/@UserID/g, data[i].UserID.replace(/ /g, "")).replace(/@UserName/g, data[i].UserName);
                    $("#visitorlist").append(tlp);
                }//for end;
            }
        }//callback end;
    });
}
//更新在线用户信息
ZL_Chat.prototype.UpdateOnline = function (ids) {
    $(".isonline").text("[不在线]");
    var onlinearr = ids.split(',');
    for (var i = 0; i < onlinearr.length; i++) {
        var uid = onlinearr[i];
        if (!uid || uid == "") { continue; }
        $(".isonline_" + uid).text("[在线]");
    }
    $("#onlineids_text").val(ids);
}
//获取在线用户信息,并更新自己的在线时间
ZL_Chat.prototype.GetOnline = function () {
    var ref = curChat;
    ref.post("getonline", {}, function (data) { ref.UpdateOnline(data); });
}
//获取某用户的消息
ZL_Chat.prototype.GetMsg = function () {
    var ref = curChat;
    ref.post("getmsg", { uid: ref.myinfo.UserID, rece: $("#ReceUser_Hid").val() }, function (data) {
        ref.GetMsgCallBack(data);
    });
}
//获取历史聊天记录
ZL_Chat.prototype.GetHistoryMsg = function (uid) {
    var ref = curChat;
    ref.post("gethistorymsg", { uid: ref.myinfo.UserID, rece: $("#ReceUser_Hid").val() }, function (data) {
        if (data != "" && data != "[]") {
            var $curbody = ref.GetCurBody();
            var arr = data.split(ref.boundary);
            var json = JSON.parse(arr[0]);
            var msg = "";
            for (var i = 0; i < json.length; i++) {
                if (json[i].Type == "other") { msg += ref.TlpReplace(ref.tlp_othermsg, json[i], arr[(i + 1)]); }
                else { msg += ref.TlpReplace(ref.tlp_mymsg, json[i], arr[(i + 1)]); }
            }
            $curbody.append(msg);
            ref.setScrollBottom();
        }
    });
}
//获取当前内容域
ZL_Chat.prototype.GetCurBody = function () {
    var uid = $("#ReceUser_Hid").val();
    return $("#chat_body_" + uid).find(".chat_div");
}
ZL_Chat.prototype.setScrollBottom = function () {
    var $curbody = curChat.GetCurBody();
    var uid = $("#ReceUser_Hid").val();
    $("#chat_body_" + uid).scrollTop($curbody.height() + 30);
}
//更新是否收到新的消息
ZL_Chat.prototype.UpdateUnread = function (ids) {
    var hasmsg = false;
    var arr = ids.split(",");
    for (var i = 0; i < arr.length; i++) {
        if (arr[i] == "" || arr[i] == $("#ReceUser_Hid").val()) continue;//有信息,并且不是当前聊天人
        else {
            if ($("#unread_" + arr[i]).text() == "") {
                $("#unread_" + arr[i]).text("未读");
                hasmsg = true;
            }
        }
    }//for end;
    if (hasmsg) { document.getElementById("msg_ad").play(); }//提示
}
//获取消息的回调函数
ZL_Chat.prototype.GetMsgCallBack = function (data) {
    if (data != "" && data != "[]") {
        var $curbody = this.GetCurBody();
        var arr = data.split(this.boundary);
        var json = JSON.parse(arr[0]);
        for (var i = 0; i < json.length; i++) {
            var msg = this.TlpReplace(this.tlp_othermsg, json[i], arr[(i + 3)]);
            $curbody.append(msg);
            setTimeout(this.setScrollBottom, 1);
        }
        this.UpdateOnline(arr[1]);
        this.UpdateUnread(arr[2]);
    }
}
//发送消息
ZL_Chat.prototype.SendMsg = function () {
    var ref = curChat;
    var msg = chatue.getContent();
    var $curbody = this.GetCurBody();
    if (msg == "" || $("#ReceUser_Hid").val() == "") { return; }
    curChat.post("sendmsg", { content: msg, rece: $("#ReceUser_Hid").val(), uid: this.myinfo.UserID }, function (data) { });
    var date = new Date();
    this.myinfo.CDate = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
    $curbody.append(this.TlpReplace(this.tlp_mymsg, this.myinfo, msg));
    $("#content").val("");//必须要清下,否则有换行等Bug
    chatue.setContent("");
    setTimeout(this.setScrollBottom, 1);
}
//用户登录
ZL_Chat.prototype.AddOnline = function (uname, uid) {
    var ref = curChat;
    ref.post("userlogin",{ name: uname, userid: uid }, function (data) {
        $('#modeldiv').modal('hide');//这里之后再getmsg等
        ref.myinfo = JSON.parse(data);
        ref.myinfo.CDate = "00:00:00";
        ref.BeginInit();
        $("#myfaceimg").attr("src", ref.myinfo.UserFace);
        $("#myid_t").val(ref.myinfo.UserID);
        $("#myname_t").val(ref.myinfo.UserName);
        $("#UserName_L").val(ref.myinfo.UserName);
        $("#UserID_Hid").val(ref.myinfo.UserID);
    });
}
//获取指定ID的聊天窗体,如果无则新建
ZL_Chat.prototype.GetBodyByID = function (uid) {
    $chatbody = $("#chat_body_" + uid);
    if ($chatbody.length < 1)//不存在,新建
    {
        $("#chat_body_list").append(this.tlp_chatBody.replace("@uid", uid));
        $chatbody = $("#chat_body_" + uid);
        this.GetHistoryMsg(uid);
    }
    return $chatbody;
}
//改变交谈对象
ZL_Chat.prototype.ChangeTalker = function (uid, uname) {
    if (uid == "" || uid == $("#ReceUser_Hid").val()) return;
    $("#sendbtn")[0].disabled = "";
    $("#uinfo_name").text(uname);
    $("#ReceUser_Hid").val(uid);
    $("#unread_" + uid).text("");
    $(".chat_body").hide();
    $chatbody = this.GetBodyByID(uid);
    $chatbody.show();
    this.setScrollBottom();
    this.GetMsg();
    //if (interval == null) {
    //    interval = setInterval(GetMsg, 2000);
    //}
    return false;
}
//读取用户的未读消息
ZL_Chat.prototype.GetUnreadMsg = function () {
    var ref = curChat;
    ref.post("getunreadmsg", { uid: ref.myinfo.UserID }, function (data) {
        ref.ReadMsg(data);
    });
}
ZL_Chat.prototype.ReadMsg = function (data) {
    if (data != "" && data != "[]") {
        var list = [];
        var arr = data.split(this.boundary);
        var json = JSON.parse(arr[0]);
        for (var i = 0; i < json.length; i++) {
            json[i].Content = arr[(i + 1)];
        }
        console.log(json);
        return json;
    }
    console.log("data",data);
}
//----------------------------------------------------
ZL_Chat.prototype.BeginInit = function () {
    this.GetOnline();
    //$("#list_item_" + myinfo.UserID).hide(); //隐掉自己
    interval = setInterval(this.GetMsg, 2000);
    onlineInterval = setInterval(this.GetOnlineList, 10000);
}
//----------------------------------------------------Tools
ZL_Chat.prototype.post = function (action,json, callback) {
    $.ajax({
        type: "POST",
        url: curChat.ajaxurl + "?action=" + action,
        data: json,
        success: function (data) { if (callback) { callback(data); } },
        error: function (data) { console.log("[" + json.action + "] error:" + data); }
    });
}
ZL_Chat.prototype.isEmpty = function (result) {
    if (!result || result == "" || result == "[]" || result == "{}") { return true; }
    else { return false; }
}
ZL_Chat.prototype.tlp_fill = function (tlp, mod) {
    if (!tlp || !mod) { console.log("模板或数据为空"); return ""; }
    function Replace(str, str1, str2) {
        var rs = str.replace(new RegExp(str1, "gm"), str2);
        return rs;
    }
    //------------------------------
    var keyArr = [];
    for (var key in mod) { keyArr.push(key); }
    //将key字符长度最大的放前面
    keyArr.sort(function (a, b) { return a.length > b.length ? -1 : 1; });
    for (var i = 0; i < keyArr.length; i++) {
        var key = keyArr[i];
        tlp = Replace(tlp, "@" + key, mod[key]);
    }
    return tlp;
}
//内容替换
ZL_Chat.prototype.TlpReplace = function (tlp, json, content) {
    return tlp.replace("@UserFace", json.UserFace).replace("@UserName", json.UserName)
                           .replace("@CDate", json.CDate).replace("@Content", content);
}
