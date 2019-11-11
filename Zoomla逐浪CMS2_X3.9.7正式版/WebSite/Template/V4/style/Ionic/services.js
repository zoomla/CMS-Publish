angular.module('starter.services', [])

.factory('Chats', function() {
  // Might use a resource here that returns a JSON array

  // Some fake testing data
  var chats = [{
    id: 0,
    name: 'Ben Sparrow',
    lastText: 'You on your way?',
    face: 'img/ben.png'
  }, {
    id: 1,
    name: 'Max Lynx',
    lastText: 'Hey, it\'s me',
    face: 'img/max.png'
  }, {
    id: 2,
    name: 'Adam Bradleyson',
    lastText: 'I should buy a boat',
    face: 'img/adam.jpg'
  }, {
    id: 3,
    name: 'Perry Governor',
    lastText: 'Look at my mukluks!',
    face: 'img/perry.png'
  }, {
    id: 4,
    name: 'Mike Harrington',
    lastText: 'This is wicked good ice cream.',
    face: 'img/mike.png'
  }];

  return {
    all: function() {
      return chats;
    },
    remove: function(chat) {
      chats.splice(chats.indexOf(chat), 1);
    },
    get: function(chatId) {
      for (var i = 0; i < chats.length; i++) {
        if (chats[i].id === parseInt(chatId)) {
          return chats[i];
        }
      }
      return null;
    }
  };
})
.factory('NodeInfo', function () {
    return {
        Name: function (nid, callback) {
            var opts = {
                action: 'GetCustom',
                key: '',
                alias: 'nodeinfo',
                psize: 1,
                cpage: 1,
                nodeid: nid
            };
            SmartAjax.spost(appcfg.api, opts, function (data) {

                if (data.retcode == 1) {
                    var node = JSON.parse(data.result);
                    if (node.length > 0)
                        callback(node[0].nodename)
                }
            })
        }
    }
})
.factory('Product', function(User){
	return {
		list:function(psize,cpage,nid,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'shoplist',
				psize:psize,
				cpage:cpage,
				nodeid:nid
			};
			SmartAjax.spost(appcfg.api, opts, function (data) {
				if(data.retcode==1)
				{
					callback(data);
				}
			});
		},
		info:function(proid,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'proinfo',
				psize:'1',
				cpage:'1',
				proid:proid
			};
			SmartAjax.spost(appcfg.api, opts, function (data) {
				if(data.retcode==1)
				{
					callback(JSON.parse(data.result)[0])
				}
			});
		},
		getsearch:function(psize,cpage,proname,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'prosearch',
				psize:psize,
				cpage:cpage,
				proname:proname
			};
			SmartAjax.spost(appcfg.api, opts, function (data) {
				if(data.retcode==1)
				{
					callback(data);
				}
			});
		},
		hot:function(psize,cpage,nodeid,callback)
		{
			var opts={
				action:'GetCustom',
				key:'',
				alias:'hotshop',
				psize:psize,
				cpage:cpage,
				nodeid:nodeid
			};
			SmartAjax.spost(appcfg.api, opts, function (data) {
				if(data.retcode==1)
				{
					callback(data);
				}
			});
		},
		usershoplist:function(psize,cpage,type,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'usershoplist',
				psize:psize,
				cpage:cpage,
				shoptype:''
			};
			if(type=="1")
				opts.shoptype="普通店铺";
			else if(type=="2")
				opts.shoptype="有机农庄";
			SmartAjax.spost(appcfg.api, opts, function (data) {
				if(data.retcode==1)
				{
					callback(data);
				}
			});
		},
		usershopdetail:function(gid,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'usershopdetail',
				psize:1,
				cpage:1,
				generalid:gid
			};
			SmartAjax.spost(appcfg.api, opts, function (data) {
				if(data.retcode==1)
				{
					callback(data);
				}
			});
		},
		userprolist:function(usershopid,psize,cpage,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'userprolist',
				psize:psize,
				cpage:cpage,
				usershopid:usershopid
			};
			SmartAjax.spost(appcfg.api, opts, function (data) {
				var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
			});
		},
		like:function(pubid,id,opts,callback){
			var getlogin = User.getlogin();
			var getOpenID = function () {  return ""; };
			if(getlogin && getlogin != null)
				getOpenID = function () {  return User.getlogin().openid; }
			SmartAjax.spost(appcfg.server+"API/Mod/Pub.ashx?action=add&pubid="+pubid+"&id="+id+"&openid="+getOpenID(),{data:JSON.stringify(opts)}, function (data) {
				var model = APIResult.getModel(data);
				if (APIResult.isok(model)) { callback(model); }
				else { console.log(model.retmsg); }
			});
		},
		isliked:function(pubid,id,pubcontentid,callback){
			var getlogin = User.getlogin();
			var getOpenID = function () {  return ""; };
			if(getlogin && getlogin != null)
				getOpenID = function () {  return User.getlogin().openid; }
			SmartAjax.spost(appcfg.server+"API/Mod/Pub.ashx?action=proliked&pubid="+pubid+"&id="+id+"&pubcontentid="+pubcontentid+"&openid="+getOpenID(),"", function (data) {
				var model = APIResult.getModel(data);
				if (APIResult.isok(model)) { callback(model); }
				else { console.log(model.retmsg); }
			});
		}
	};
})
.factory('User', function ($state) {
    var apiUrl = appcfg.server + "API/Mod/UserAPP.ashx?action=";
    return {
        autoLogin: function (callback) { var ref = this; ref.login("admin", "admin66.cn", function (data) { callback(data); }); },
        reg: function (mu, callback) {
            SmartAjax.spost(apiUrl + "reg", mu, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) {
                    callback(model);
                } else { console.log("login", model.retmsg); }
                callback(model);
            });
        },
        login: function (uname, upwd, callback) {
            var ref = this;
            SmartAjax.spost(apiUrl + "login", { "uname": uname, "upwd": upwd }, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) {
                    ref.setlogin(model.result);
                    callback(model);
                } else { console.log("login", model.retmsg); }
                //不论登录成功或失败均返回
                callback(model);
            });
        },
        getlogin: function () {
            //先检测缓存中是否有数据,缓存有数据且未过期,则取缓存中
            var mu = localStorage.getItem("User");
            if (mu && mu != null)
			{
				mu = JSON.parse(mu);
			}
            return mu;
            //var opts = { action: 'getlogin', openid: openid };
            //SmartAjax.spost("http://x005.2013.hx008.com/API/Mod/UserAPP.ashx", opts, function (data) {
            //    callback(data);
            //});
        },
        //缓存用户信息
        setlogin: function (mu) {
            localStorage.setItem("User", JSON.stringify(mu));
        },
        logout: function () {
            if (localStorage.getItem("User")) { localStorage.removeItem("User"); }
            //$state.go("", {}, {});返回登录或指定页
        },
		list:function(psize,cpage,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'userlist',
				psize:psize,
				cpage:cpage,
			};
			SmartAjax.spost(appcfg.api, opts, function (data) {
				var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
			});
		}
    };
})
.factory("Cart", function (User) {
    var apiUrl = appcfg.server + "API/Mod/shop_cart.ashx?action=";
	var getlogin = User.getlogin();
	var getOpenID = function () {  return ""; };
	if(getlogin && getlogin != null)
		getOpenID = function () {  return getlogin.openid; }
    return {
        add: function (proid, pronum, callback) {
            SmartAjax.spost(apiUrl + "add", { "openid": getOpenID(), "proid": proid, "pronum": pronum }, function (data) {
                if (data.retcode == 1) { callback(data); }
                else { console.log(data.retmsg); }
            });
        },
        //购物车IDS
        del: function (ids, callback) {
            SmartAjax.spost(apiUrl + "del", { "openid": getOpenID(), "ids": ids }, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
            });
        },
        list: function (callback) {
            SmartAjax.spost(apiUrl + "list", { "openid": getOpenID() }, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
            });
        },
        setnum: function () { },
        get: function (id) { }
    }
})
.factory("Order", function (User,Debug) {
    var apiUrl = appcfg.server + "API/Mod/shop_order.ashx?action=";
	var getlogin = User.getlogin();
	var getOpenID = function () {  return ""; };
	if(getlogin && getlogin != null)
		getOpenID = function () {  return getlogin.openid; }
    return {
        carttoorder: function (ids, callback) {
            SmartAjax.spost(apiUrl + "carttoorder", { "openid": getOpenID(), "ids": ids }, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { Debug.pop(model.retmsg); }
            });
        },
        //创建支付单,进入支付流程
        createpayment: function (orderMod, callback) {
            //fareList:按店铺划分的选定的快递方式  [{storeid:expid}]
            var opts = { "openid": getOpenID(), "ids": orderMod.ids, "receID": orderMod.receid, "fareList": JSON.stringify(orderMod.fareList) };
            SmartAjax.spost(apiUrl + "createpayment", opts, function (data) {
                var model = APIResult.getModel(data);
                if (model.retcode == 1) { callback(model); }
                else { console.log("createpayment", model.retmsg); }
            });
        },
        list: function (pageMod, callback) {
            //pageMod={cpage:1,psize:10,skey:""};
            //withpro:true   是否带有商品信息,存在[ProList]中
            pageMod.openid=getOpenID();
            SmartAjax.spost(apiUrl + "list", pageMod, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
            });
        }
    }
})
.factory("Address", function (User) {
    var apiUrl = appcfg.server + "API/Mod/shop_address.ashx?action=";
	var getlogin = User.getlogin();
	var getOpenID = function () {  return ""; };
	if(getlogin && getlogin != null)
		getOpenID = function () {  return getlogin.openid; }
    return {
        list: function (callback) {
            SmartAjax.spost(apiUrl + "list", { "openid": getOpenID() }, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
            });
        },
		add: function(opts,callback){
			SmartAjax.spost(apiUrl + "add", { "openid": getOpenID(),model:JSON.stringify(opts) }, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
            });
		},
		del: function(rid,callback){
			SmartAjax.spost(apiUrl + "del", { "openid": getOpenID(),id:rid }, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
            });
		},
		get: function(rid,callback){
			SmartAjax.spost(apiUrl + "get", { "openid": getOpenID(),id:rid }, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
            });
		},
		edit: function(opts,callback){
			SmartAjax.spost(apiUrl + "edit", { "openid": getOpenID(),model:JSON.stringify(opts) }, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
            });
		}
    };
})
.factory("Pay", function (User, Wechat,Debug) {
    //根据所选支付平台,开始发起支付
    //var alipayUrl = appcfg.server + "API/Pay/alipay_app.aspx";
    var getOpenID = function () { return User.getlogin().openid; }
    return {
        //传入支付方式,支付单号,开始支付
        sendPay: function (mode, payNo, success, failed) {
            var opts = { openid: getOpenID(), "payNo": payNo };
            switch (mode) {
                case "alipay":
                    break;
                case "wxpay":
                default:
                    Debug.L("wxpay start");
                    if (Wechat.isInstalled(function () {
                       Wechat.sendPaymentRequest(opts, success, failed);
                    }), function () {
                        Debug.pop("未安装微信,无法进行微信支付");
                    })
                    break;
            }
        }
    }
})
.factory("Debug", function ($ionicPopup) {
    return {
        L: function (msg) {
            var dom = document.getElementById("err_div");
            if (dom != null) { dom.innerText = msg; }
        },
        pop: function (msg) {
            var alertPopup = $ionicPopup.alert({
                title: 'DEBUG',
                template: msg
            });
            alertPopup.then(function (res) {
                console.log('Thank you for not eating my delicious ice cream cone');
            });
        }
    }
})
.factory("DataCenter", function () {
    //页面间的数据交互
    var myServices = {};
    var myObject = {};
    var _set = function (data) { myObject = data; };
    var _get = function () { return myObject; };
    myServices.set = _set;
    myServices.get = _get;
    return myServices;
})
.factory("Wechat", function (Debug) {
    var callActivityPlugin = function (arr, callback) {
        cordova.exec(callback, function (msg) { }, "Wechat", "call", arr);
    }
    return {
        Scene: {
            SESSION: 0, // 聊天界面
            TIMELINE: 1, // 朋友圈
            FAVORITE: 2  // 收藏
        },
        Type: {
            APP: 1,
            EMOTION: 2,
            FILE: 3,
            IMAGE: 4,
            MUSIC: 5,
            VIDEO: 6,
            WEBPAGE: 7
        },
        isInstalled: function (onSuccess, onError) {
            cordova.exec(onSuccess, onError, "Wechat", "isWXAppInstalled", []);
        },
        share: function (message, onSuccess, onError) {
            cordova.exec(onSuccess, onError, "Wechat", "share", [message]);
        },
        auth: function (scope, state, onSuccess, onError) {
            if (typeof scope == "function") {
                // Wechat.auth(function () { alert("Success"); });
                // Wechat.auth(function () { alert("Success"); }, function (error) { alert(error); });
                return cordova.exec(scope, state, "Wechat", "sendAuthRequest");
            }

            if (typeof state == "function") {
                // Wechat.auth("snsapi_userinfo", function () { alert("Success"); });
                // Wechat.auth("snsapi_userinfo", function () { alert("Success"); }, function (error) { alert(error); });
                return cordova.exec(state, onSuccess, "Wechat", "sendAuthRequest", [scope]);
            }

            return cordova.exec(onSuccess, onError, "Wechat", "sendAuthRequest", [scope, state]);
        },
        //opts:openid,payNo
        sendPaymentRequest: function (opts, onSuccess, onError) {
            var apiUrl = appcfg.server + "API/Pay/wxpay_app.aspx";
            try {
                SmartAjax.spost(apiUrl, opts, function (data) {
                    var model = APIResult.getModel(data);
                    if (APIResult.isok(model)) {
                        Debug.L("apiresult.isok");
                        var params = {
                            mch_id: model.result.partnerid,
                            prepay_id: model.result.prepayid,
                            nonce: model.result.noncestr,
                            timestamp: model.result.timestamp,
                            sign: model.result.sign
                        };
                        Debug.L("parentid:" + model.result.partnerid);
                        cordova.exec(onSuccess, onError, "Wechat", "sendPaymentRequest", [params]);
                    } else { onError("err:" + model.retmsg); }
                })
            } catch (ex) { onError("ex:" + ex.message); }
        }//sendPaymentRequest end;
    }
})
.factory('News', function(){
	return {
		list:function(nodeid,psize,cpage,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'articlelist',
				psize:psize,
				cpage:cpage,
				nodeid:nodeid
			};
			SmartAjax.spost(appcfg.api, opts, function (data) {
				var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
			});
		},
		getcontent:function(generalid,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'getcontent',
				psize:1,
				cpage:1,
				generalid:generalid
			};
			SmartAjax.spost(appcfg.api, opts, function (data) {
				if(data.retcode==1)
				{
					callback(data);
				}
			});
		},
		courierlist:function(nodeid,psize,cpage,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'courierlist',
				psize:psize,
				cpage:cpage,
				nodeid:nodeid
			};
			SmartAjax.spost(appcfg.api, opts, function (data) {
				var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
			});
		},
		videolist:function(nodeid,psize,cpage,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'videolist',
				psize:psize,
				cpage:cpage,
				nodeid:nodeid
			};
			SmartAjax.spost(appcfg.api, opts, function (data) {
				var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
			});
		},
		getvideocont:function(generalid,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'getvideocont',
				psize:1,
				cpage:1,
				generalid:generalid
			};
			SmartAjax.spost(appcfg.api, opts, function (data) {
				if(data.retcode==1)
				{
					callback(data);
				}
			});
		}
	};
})
.factory('Grade', function(){
	return {
		list:function(cate,grade,parentid,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'gradelist',
				psize:100,
				cpage:1,
				cate:cate,
				grade:grade,
				parentid:parentid				
			}
			SmartAjax.spost(appcfg.api, opts, function (data) {
				var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
			});
		},
		sdmlist:function(nodeid,area,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'sdmlist',
				psize:100,
				cpage:1,
				nodeid:nodeid,
				area:area
			}
			SmartAjax.spost(appcfg.api, opts, function (data) {
				var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
			});
		},
		liulist:function(nodeid,area,callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'liulianglist',
				psize:100,
				cpage:1,
				nodeid:nodeid,
				area:area
			}
			SmartAjax.spost(appcfg.api, opts, function (data) {
				var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
			});		
		},
		huafeilist:function(callback){
			var opts={
				action:'GetCustom',
				key:'',
				alias:'huafeilist',
				psize:100,
				cpage:1
			}
			SmartAjax.spost(appcfg.api, opts, function (data) {
				var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model); }
                else { console.log(model.retmsg); }
			});		
		}
	}
})
.factory('YiSai', function(User){
    var getOpenID = function () { return User.getlogin().openid; };
	var yisi = {
        api: appcfg.server+"API/yisi.ashx",
        life: {
            //最近一次的查询
            last: {}
        },
        phone: {}, flow: {}, oil: {}
    };
	return {
		query:function (account, proid,callback){
			var opts = { openid: getOpenID(), action: "query", type: "life", "account": account, "proid": proid };
			SmartAjax.spost(yisi.api, opts, function (data) {
				var model = APIResult.getModel(data);
				if (APIResult.isok(model)) {
					yisi.life.last = model.result;
					callback(model);
				}
				else {
					yisi.life.last = null;
					callback(model);
				}
			});			
		},
		neworder:function(callback){
			var last = yisi.life.last;
			if (!last) { console.log("必须先查询才能发起支付"); return false; }
			if (parseFloat(last.money) < 1) {
				console.log("你没有欠费,不需要支付");
				return false;
			}
			var opts = { openid: getOpenID(), action: "neworder", type: "life", "account": last.account, "proid": last.proid, "money": last.money };
			SmartAjax.spost(yisi.api, opts, function (data) {
				var model = APIResult.getModel(data);
				callback(model);
			});			
		},
		list:function(callback){
			var opts = { openid: getOpenID(), action: "list", type: "life" };
			SmartAjax.spost(yisi.api, opts, function (data) {
				var model = APIResult.getModel(data);
				callback(model);
			});
		},
		view:function(orderno,callback){
			var opts = { openid: getOpenID(), action: "view", type: "life", "orderno": orderno };
			SmartAjax.spost(yisi.api, opts, function (data) {
				var model = APIResult.getModel(data);
				callback(model);
			});
		},
		flowneworder:function(proid,mobile,callback){
			var opts = { openid: getOpenID(), action: "neworder", type: "flow", "account": mobile, "proid": proid };
			SmartAjax.spost(yisi.api, opts, function (data) {
				var model = APIResult.getModel(data);
				callback(model);
			});
		},
		phoneneworder:function(mobile,proid,callback){
			var opts = { openid: getOpenID(), action: "neworder", type: "phone", "account": mobile, "proid": proid };
			SmartAjax.spost(yisi.api, opts, function (data) {
				var model = APIResult.getModel(data);
				callback(model);
			});
		},
		phonelist:function(callback){
			var opts = { openid: getOpenID(), action: "list", type: "phone" };
			SmartAjax.spost(yisi.api, opts, function (data) {
				var model = APIResult.getModel(data);
				callback(model);
			});
		}
	};
})
.factory("ChatIM", function () {
    var chatim = { api: appcfg.server + "api/comp/api_qq_im.ashx?action=", sdkAppID: "1400012582", accountType: "6551" };
    //从服务端获取sign签名并登录,callback用于处理服务器的成功或失败回调
    chatim.login = function (mu, cbok, cberr) {
        var ref = this;
        SmartAjax.spost(ref.api + "login", { "openid": mu.openid }, function (data) {
            var model = APIResult.getModel(data);
            var info = model.result;
            if (APIResult.isok(model)) {
                //使用签名,登录im服务器
                loginInfo = {
                    "sdkAppID": ref.sdkAppID, //用户所属应用id,必填
                    'appIDAt3rd': ref.sdkAppID, //用户所属应用id，必填
                    'accountType': ref.accountType, //用户所属应用帐号类型，必填
                    'identifier': info.identity, //当前用户ID,必须是否字符串类型，必填
                    'identifierNick': mu.UserName, //当前用户昵称，选填
                    'userSig': info.sign, //当前用户身份凭证，必须是字符串类型，必填
                    'headurl': appcfg.server + mu.UserFace
                };
                var options = {
                    'isAccessFormalEnv': true,//是否访问正式环境，默认访问正式，选填
                    'isLogOn': true//是否开启控制台打印日志,默认开启，选填
                }
                webim.login(loginInfo, ref.listen, options, cbok, cberr);
            }
            else { console.log("login failed,ex:" + model.retmsg); }
        });
    }
    //根据用户ID,获取指定用户的IM信息
    chatim.getuser = function (uid,openid,callback) {
        SmartAjax.spost(chatim.api + "getuser", { "uid": uid,"openid":openid }, function (data) {
            var model = APIResult.getModel(data);
            if (APIResult.isok(model)) {
                callback(model.result);
            }
            else {
                console.log("im.getuser failed," + model.retmsg);
            }
        });
    }
    chatim.listen = {
        "onConnNotify": null,
        "jsonpCallback": null,//IE9(含)以下浏览器用到的jsonp回调函数
        "onMsgNotify": null,//监听新消息(私聊，群聊，群提示消息)事件
        "onGroupInfoChangeNotify": function () { },//监听群资料变化事件
        "groupSystemNotifys": function () { }//监听（多终端同步）群系统消息事件
    };
    //监听连接状态回调变化事件
    chatim.listen.onConnNotify = function (resp) {
        switch (resp.ErrorCode) {
            case webim.CONNECTION_STATUS.ON:
                //webim.Log.warn('连接状态正常...');
                break;
            case webim.CONNECTION_STATUS.OFF:
                console.log('连接已断开，无法收到新消息，请检查下你的网络是否正常');
                break;
            default:
                console.log('未知连接状态,status=' + resp.ErrorCode);
                break;
        }
    }
    //IE9(含)以下浏览器用到的jsonp回调函数
    chatim.listen.jsonpCallback = function (rspData) {
        webim.setJsonpLastRspData(rspData);
    }
    //newMsgList 为新消息数组，结构为[Msg]
    chatim.listen.onMsgNotify = function (newMsgList) {
        //console.warn(newMsgList);
        var sess, newMsg;
        //获取所有聊天会话
        var sessMap = webim.MsgStore.sessMap();

        for (var j in newMsgList) {//遍历新消息
            newMsg = newMsgList[j];

            if (newMsg.getSession().id() == selToID) {//为当前聊天对象的消息
                selSess = newMsg.getSession();
                //在聊天窗体中新增一条消息
                //console.warn(newMsg);
                addMsg(newMsg);
            }
        }
        //消息已读上报，以及设置会话自动已读标记
        webim.setAutoRead(selSess, true, true);

        for (var i in sessMap) {
            sess = sessMap[i];
            if (selToID != sess.id()) {//更新其他聊天对象的未读消息数
                //updateSessDiv(sess.type(), sess.id(), sess.unread());
            }
        }
    }
	//获取历史消息
	chatim.gethistory = function (uname,num,time,key,success,error){
		
		var opts = {
			'Peer_Account': uname,
			'MaxCnt':  num,
			'LastMsgTime':  time,
			'MsgKey':  key
		}
		webim.getC2CHistoryMsgs(opts,function(data){
			success(data);
		},function(data){
			error(data);
		});
	}
    return chatim;
})
.directive('repeatDone', function (){
	return function (scope, element, attrs) {
		if (scope.$last) { // all are rendered
			scope.$eval(attrs.repeatDone);
		}
   };
});