exports.install = function(Vue,options){
Vue.prototype.Regex = {
  isMinLen: function (str, len) {//字符长度是否小于len
    str = str.replace(/ /g, "");
    return str.length < len;
  },
  isEmpty: function () {
    for (var i = 0; i < arguments.length; i++) {
      if (!arguments[i] || arguments[i] == undefined || (arguments[i] + "") == "NaN") { return true; }//传入为undefined也为false
      if (this.isInt(arguments[i])){continue;}
      var s = arguments[i].replace(/ /g, "");
      if (s == "") { return true;}
    }
    return false;
  },
  //是否为pop或smtp地址
  isPop: function (s) {
    var patrn = /^(\w+)\.(\w+)\.(\w+)/g;
    return patrn.exec(s) ? true : false;
  },
  //是否包含中文
  isContainChina: function (s) {
    var patrn = /[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/gi;
    if (patrn.exec(s))
      return true;
    else
      return false;
  },
  //是否只有英文与数字
  isEngorNum: function (s) {
    var patrn = /^[A-Za-z0-9]*$/;
    return patrn.exec(s) ? true : false;
  },
  //是否为英文,数字或中文(不允许空格)
  isCharorNum: function (s) {
    var patrn = /^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[\w])*$/;
    return patrn.exec(s) ? true : false;
  },
  //是否为c#格式虚拟路径
  isVirtualPath: function (s) {
    return (s.indexOf("~/") == 0 && s.indexOf(".") > 0);
  },
  //验证http||https格式
  isUrl: function (s) {
    //var patrn = /^((http)|(https)):\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/i;
    //return patrn.exec(s) ? true : false;
	return false;
  },
  //邮箱格式验证
  isEmail: function (s) {
    var patrn = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/gi;
    return patrn.exec(s) ? true : false;
  },
  //是否为身份证
  isIDCard: function (s) {
    var patrn = /(^\d{15}$)|(^\d{17}([0-9]|X)$)/;
    return patrn.exec(s);
  },
  //是否手机号码
  isMobilePhone: function (s) {
    var patrn = /^1(?:3|4|5|6|7|8|9)\d{9}$/;
    var patrn2 = /0\d{2,5}-\d{5,8}/g;//座机
    if (patrn.exec(s) || patrn2.exec(s)) {
      return true;
    }
    else {
      return false;
    }
  },
  //是否邮编
  isZipCode: function (s) {
    return (this.isInt(s) && s.length == 6)
  },
  isIP: function (s) {
    var patrn = /^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g;
    return patrn.exec(s) ? true : false;
  },
  //是否正或负整数
  isInt: function (s) {
    var patrn = /^\d+(\d+)?$/gi;
    if (patrn.exec(s)) {
      return true;
    }
    else {
      return false;
    }
  },
  //是否正浮点数或正整数,0也算,true:是
  isNum: function () {
    for (var i = 0; i < arguments.length; i++) {
      var val = parseFloat(arguments[i]);
      if (!(val >= 0)) { return false; }
    }
    return true;
  },
  //后缀名检测,符合返回true  文件名, mp3,mp4,swf
  extCheck: function (fname, exts) {
    if (!fname || fname == "" || !exts || exts == "") { return false; }
    var ext = this.getExt(fname);
    var extArr = exts.toLowerCase().split(',');
    if (ext == "" || extArr.length < 1) { return false; }
    for (var i = 0; i < extArr.length; i++) {
      if (ext == extArr[i]) { return true; }
    }
    return false;
  },
  domIsEng: function (s) {
    //---域名注册使用
	let i=0;
    //---允许英文,数字,空格，不能有中文，英文中一定要带空格,注:传入的值用trim();,用于单位(英文名)等地方
    var patrn = /[^a-zA-Z0-9\s]+/gi;
    if (!patrn.exec(s)) {
      i = s.toString().indexOf(" ");
      return i > 0;
    }
    else {
      return false;
    }
  },
  
  _isIgnKey: function (e) {
    //方向键,删除,回车和其他特殊按钮忽略
    var ignKey = [37, 38, 39, 40, 13, 20, 16, 17, 18, 8];
    for (var i = 0; i < ignKey.length; i++) {
      if (e.keyCode == ignKey[i]) { return true; }
    }
    return false;
  },
  //----------------------
  getExt:function(fname){
	if (!fname) { return ""; }
	fname = fname.split('?')[0].replace(/" "/g, "").toLowerCase();
	if (fname.indexOf('/') > -1) { fname = fname.substring((fname.lastIndexOf("/") + 1), fname.length); }
	if (fname.indexOf(".") < 0) { return ''; }
	//-------------------------------------
	var s = fname.lastIndexOf(".") + 1;
	var ext = fname.substring(s, fname.length);
	return ext;
  },
}
}