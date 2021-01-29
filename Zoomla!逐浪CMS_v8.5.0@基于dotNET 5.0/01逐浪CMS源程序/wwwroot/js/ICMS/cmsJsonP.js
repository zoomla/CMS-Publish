var cmsJsonP = {
    apiUrl: "http://localhost:86/API/Content?action=",
    post: function (action, packet, callback) {
        var ref = this;
        $.ajax({
            url: ref.apiUrl + action,
            type: "POST", dataType: 'jsonp', jsonp: 'callback',
            data: packet,
            timeout: 10000,
            success: function (data) {
                var ret = APIResult.getModel(data);
                if (ret.retcode != 1) { console.error(action + "|fail2", ret.retmsg); }
                if (callback && typeof (callback) == "function") { callback(ret); }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.error(action + "|fail", XMLHttpRequest, textStatus, errorThrown);
                callback({ retcode: 0, retmsg: "调用失败" });
            }
        });
    },
    node_list: function (packet) {
        var ref = this;
        return new Promise((resolve) => {
            ref.post("node_list", packet, function (ret) { resolve(ret); });
        });
    },
    node_get: function (packet,cb) {
        this.post("node_get", packet, cb);
    },
    //{nid:0,nids:"",elite:0,ids:""}
    content_list: function (packet, cb) {
        this.post("content_list", packet, cb);

    },
    content_get: function (packet, cb) {
        var ref = this;
        ref.post("content_get", packet, cb);
    }
};