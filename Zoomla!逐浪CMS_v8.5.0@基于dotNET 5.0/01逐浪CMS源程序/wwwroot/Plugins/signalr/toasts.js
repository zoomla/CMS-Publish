var Toast = {
    connectionId: null,
    items: [],
    // 添加通知
    add: function (item) {
        let $ref = this;
        let index = Math.max.apply(Math, this.items.map(function (o) { return o.index; }));
        item.index = Math.max(index, 0) + 1;
        this.items.push(item);
        
        let html = this.buildHtml(item);
        $("#toasts_list").append(html);
        $("#toasts_list .toast[data-index=" + item.index + "] button").click(function(){
            $ref.remove(item.index);
        });
        if(item.timeout){
            setTimeout(function(){
                $ref.remove(item.index);
            }, item.timeout * 1000);
        }
        sessionStorage.setItem("toasts", JSON.stringify(this.items));

        // 在这里可以设置不同通知对应的音效
        // var audio = new Audio("/***.mp3");
        // audio.play();
    },
    // 感觉index移除通知
    remove: function (index) {
        var $ref = this;
        let $ele = $("#toasts_list .toast[data-index=" + index + "]");
        // 通知移除效果，淡出持续600ms
        $ele.fadeOut(600, function(){ $ele.remove(); });
        for (let i = 0; i < $ref.items.length; i++) {
            const item = $ref.items[i];
            if (index == item.index) {
                $ref.items.splice(i, 1);
                sessionStorage.setItem("toasts", JSON.stringify(this.items || []));
                break;
            }
        }
    },
    // 清除所有通知
    clear: function(){
        $("#toasts_list").empty();
        this.items = [];
        sessionStorage.setItem("toasts", JSON.stringify([]));
    },
    // 构建通知样式
    buildHtml: function(item){
        let seconds = (new Date() - new Date(item.time)) / 1000;
        let timeSpan = "";
        if(seconds / 3600 >= 1){
            timeSpan = Math.round(seconds / 3600, 0) + "小时前";
        }
        else if(seconds / 60 >= 1){
            timeSpan = Math.round(seconds / 60, 0) + "分钟前";
        }
        else{
            timeSpan = Math.round(seconds, 0) + "秒前";
        }
        // 通知颜色，可以改成不同图标，结合下面的通知样式
        let color = '';
        switch (item.type) {
            case "Succeed":
                color = "#0d6efd";
            break;  
            case "Warning":
                color = "#ffc107";
                break; 
            case "Error":
                color = "#dc3545";
                break;
            case "Help":
                color = "#17a2b8";
                break;             
            case "Prompted":
            default:
                color = "007aff";
                break;
        }
        // 通知样式
        let html = 
        '<div class="toast fade show" data-index="' + item.index + '" role="alert" aria-live="assertive" aria-atomic="true">' + 
            '<div class="toast-header">' + 
                '<svg class="bd-placeholder-img rounded me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" role="img" focusable="false">' +
                    '<rect width="100%" height="100%" fill="' + color + '"></rect>' +
                '</svg>' +
                '<strong class="me-auto">' + item.title + '</strong>' +
                '<small class="text-muted">' + timeSpan + '</small>' +
                '<button type="button" data-dismiss="toast" aria-label="Close">' +
                    '<i class="zi zi_times zi_1x"></i>' +
                '</button>' +
            '</div>' +
            '<div class="toast-body">' + item.content + '</div>' +
        '</div>';
        return html;
    },
    // 初始化方法
    init: function(){
        let $ref = this;
        let toastItems = JSON.parse(sessionStorage.getItem("toasts")) || [];
        $ref.clear();
        let index = Math.max.apply(Math, this.items.map(function (o) { return o.index; }));
        index = Math.max(index, 0) + 1;
        if(toastItems && toastItems.length){
            toastItems.forEach(function (item) {
                item.index = index;
                $ref.items.push(item);
                $("#toasts_list").append($ref.buildHtml(item));
                index++;
            });
        };
        $("#toasts_list .toast[data-index]").each(function(){
            let $el = $(this);
            let i = $el.attr("data-index");
            $el.find("button").click(function(){
                $ref.remove(i);
                $("#toasts_list .toast[data-index=" + i + "]").remove();
            });
        });
        sessionStorage.setItem("toasts", JSON.stringify($ref.items));
    }
}

var connection;
$(function () {
    let toastEl = '<div class="toasts_container" aria-live="polite" aria-atomic="true"><div id="toasts_list"></div></div>';
    $("body").append(toastEl);
    // 初始化消息通知，从sessionStorage中载入用户未关闭的通知
    window.top.Toast.init();
    // 设置通知60秒刷新一次
    setInterval(function(){
        window.top.Toast.init();
    }, 60 * 1000);

    connection = new signalR.HubConnectionBuilder().withUrl("/Notification").build();

    let relativeUrl = window.self.location.href.replace(/^(?:\/\/|[^/]+)*\//, '/').toLowerCase();
    let relativeShortUrl = relativeUrl.split("?")[0];
    // 消息推送只显示在主窗口中
    if(window.self === window.top){
        connection.on("Notify", function (noti) {
            if(noti){
                noti.timeout = 0;
                Toast.add(noti);
            }
        });
        connection.on("HelpInfo", function (msgs, url) {
            let isShown = Boolean(sessionStorage.getItem(relativeShortUrl)) || false;
            if(!isShown && relativeShortUrl === url.toLowerCase()){
                for (let i = 0; i < msgs.length; i++) {
                    msgs[i].timeout = 24;
                    Toast.add(msgs[i]);
                }
                sessionStorage.setItem(relativeUrl, true);
            }
        });
    }

    // 跳转白名单
    let excludeUrl = ["/admin/helper", "/admin/login", "/user/login"]
    connection.start()
    .then(function () {
        if(excludeUrl.indexOf(relativeUrl) === -1){
            let pageStatus = Boolean(localStorage.getItem('db' + relativeUrl)) || false;
            if(!pageStatus){
                window.location.href = "/admin/helper/index?returnUrl=" + relativeUrl;
                localStorage.setItem('db' + relativeUrl, true);
            }
            else{
                $.get("/admin/helper/helpinfo?url=" + relativeShortUrl, function(data){
                    if(data.succeed){
                        console.log(data.msg);
                    }
                    else{
                        console.error(data.error);
                    }
                });
            }
        }
    })
    .catch(function (err) {
        console.error(err.toString());
    });
});

// 发送通知给当前窗口
function notifyCurrent(title, message){
    if(connection){
        connection.invoke("AddNotification", title, message).catch(function (err) {
            return console.error(err.toString());
        });
    }
    else
        console.log("当前不存在连接，请刷新页面后重试");
}

// 发送通知给组
function notifyGroup(group, title, message){
    if(connection){
        connection.invoke("SendToGroup", group, title, message).catch(function (err) {
            return console.error(err.toString());
        });
    }
    else
        console.log("当前不存在连接，请刷新页面后重试");
}

// 初始化进度
function initialProgress(callback) {
    let progressConnection = new signalR.HubConnectionBuilder().withUrl("/Notification").build();
    progressConnection.on("ProgressChange", function (ratio, message) {
        callback(ratio, message);
    });
    progressConnection.start()
        .then(function () {
        })
        .catch(function (err) {
            alert(err);
            return console.error(err.toString());
        });
}