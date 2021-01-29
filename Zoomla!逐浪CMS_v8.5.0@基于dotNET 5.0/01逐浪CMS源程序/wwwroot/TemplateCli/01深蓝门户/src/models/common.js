exports.install = function(Vue,options){
// 参数：method（API名），data（请求参数对象） 
var ref=Vue.prototype;
var str={
	htmlToText:function(html,len){
		if(!html){return "";}
		var dom=document.createElement("div");
		dom.innerHTML=html;
		var text= dom.textContent;
		if(text.length>len){text=(text.substr(0,len))+"...";}
		return text;
	}
}
  Vue.prototype.jsp = function(action,data){
        const baseUrl = 'http://192.168.1.4:97/API/WXAPP?apiId=cd3c2bf95091673cd0a7f2d551cda6dd&apiKey=4b434af0977dbe552e7f4a4e24e731d9&action=';
		let url = baseUrl+action;
        // jsonp请求参数和get方法类似，都是params的方式拼接
        for(let item in data){
             url += `&${item}=${data[item]}`;
        }
        return this.$jsonp(url);
    };
	Vue.prototype.util={
		alert:function(msg,cb){
			alert(msg);cb();
		},
		"str":str
	};
	
  Vue.prototype.B_User={
	login:function(){
		
	},
	get:function(){
		return {userId:1,userName:"admin",honeyName:'徐子林',trueName:"逐浪软件",mobile:"18890554432"};
		return localStorage.getItem("sys_mu");
	},
	set:function(mu){
		localStorage.setItem("sys_mu",mu);
	},
  }
}