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
        //const baseUrl = 'http://win100:90/Cloud/API?appId=SSY5UF6SUK&appKey=sZ2Mx7BvAgEWr7i6JDh4vPLFluMuR4pn&action=';
        const baseUrl = 'http://tl.lqlawyer.com/API/WXAPP?apiId=eecabae94e760d1c50157f35b5d4aa72&apiKey=c13b007c8feb97803c24f76735a820b2&action=';
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