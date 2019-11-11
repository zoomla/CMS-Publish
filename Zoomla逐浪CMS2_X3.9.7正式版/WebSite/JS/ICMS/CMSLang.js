var CMSLang = {
    set: function (lang) {
        cookieUtils.set("cms_lang", lang);
        location = location;
    }

};
var cookieUtils = {
    get: function (name) {
        var cookieName = encodeURIComponent(name) + "=";
        //只取得最匹配的name，value
        var cookieStart = document.cookie.indexOf(cookieName);
        var cookieValue = null;

        if (cookieStart > -1) {
            // 从cookieStart算起
            var cookieEnd = document.cookie.indexOf(';', cookieStart);
            //从=后面开始
            if (cookieEnd > -1) {
                cookieValue = decodeURIComponent(document.cookie.substring(cookieStart + cookieName.length, cookieEnd));
            } else {
                cookieValue = decodeURIComponent(document.cookie.substring(cookieStart + cookieName.length, document.cookie.length));
            }
        }

        return cookieValue;
    },
    set: function (name, val, options) {
        if (!name) {
            throw new Error("cookie must have name");
        }
        var enc = encodeURIComponent;
        var parts = [];
        val = (val !== null && val !== undefined) ? val.toString() : "";
        options = options || {};
        if (!options.path) { options.path = "/"; }
        if (!options.expires) {
            var today = new Date()
            var expires = new Date()
            expires.setTime(today.getTime() + 1000 * 60 * 60 * 24 * 365)
            options.expires = expires;
            options.maxAge = 5 * 365 * 24 * 60 * 60;
        }
        //----------------------------------------
        parts.push(enc(name) + "=" + enc(val));
        // domain中必须包含两个点号
        if (options.domain) {
            parts.push("domain=" + options.domain);
        }
        if (options.path) {
            parts.push("path=" + options.path);
        }
        // 如果不设置expires和max-age浏览器会在页面关闭时清空cookie
        if (options.expires) {
            parts.push("expires=" + options.expires.toGMTString());
        }
        if (options.maxAge && typeof options.maxAge === "number") {
            parts.push("max-age=" + options.maxAge);
        }
        if (options.httpOnly) {
            parts.push("HTTPOnly");
        }
        if (options.secure) {
            parts.push("secure");
        }

        document.cookie = parts.join(";");
    },
    del: function (name, options) {
        options.expires = new Date(0);// 设置为过去日期
        this.set(name, null, options);
    }
}