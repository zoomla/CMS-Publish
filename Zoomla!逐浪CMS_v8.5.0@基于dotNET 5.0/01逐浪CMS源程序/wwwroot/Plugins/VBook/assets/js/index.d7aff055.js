(function(e){function t(t){for(var r,o,c=t[0],u=t[1],s=t[2],l=0,d=[];l<c.length;l++)o=c[l],Object.prototype.hasOwnProperty.call(a,o)&&a[o]&&d.push(a[o][0]),a[o]=0;for(r in u)Object.prototype.hasOwnProperty.call(u,r)&&(e[r]=u[r]);f&&f(t);while(d.length)d.shift()();return i.push.apply(i,s||[]),n()}function n(){for(var e,t=0;t<i.length;t++){for(var n=i[t],r=!0,o=1;o<n.length;o++){var c=n[o];0!==a[c]&&(r=!1)}r&&(i.splice(t--,1),e=u(u.s=n[0]))}return e}var r={},o={index:0},a={index:0},i=[];function c(e){return u.p+"assets/js/"+({}[e]||e)+"."+{"chunk-1280fab2":"055b326c"}[e]+".js"}function u(t){if(r[t])return r[t].exports;var n=r[t]={i:t,l:!1,exports:{}};return e[t].call(n.exports,n,n.exports,u),n.l=!0,n.exports}u.e=function(e){var t=[],n={"chunk-1280fab2":1};o[e]?t.push(o[e]):0!==o[e]&&n[e]&&t.push(o[e]=new Promise((function(t,n){for(var r="assets/css/"+({}[e]||e)+"."+{"chunk-1280fab2":"abf52fdb"}[e]+".css",a=u.p+r,i=document.getElementsByTagName("link"),c=0;c<i.length;c++){var s=i[c],l=s.getAttribute("data-href")||s.getAttribute("href");if("stylesheet"===s.rel&&(l===r||l===a))return t()}var d=document.getElementsByTagName("style");for(c=0;c<d.length;c++){s=d[c],l=s.getAttribute("data-href");if(l===r||l===a)return t()}var f=document.createElement("link");f.rel="stylesheet",f.type="text/css",f.onload=t,f.onerror=function(t){var r=t&&t.target&&t.target.src||a,i=new Error("Loading CSS chunk "+e+" failed.\n("+r+")");i.code="CSS_CHUNK_LOAD_FAILED",i.request=r,delete o[e],f.parentNode.removeChild(f),n(i)},f.href=a;var p=document.getElementsByTagName("head")[0];p.appendChild(f)})).then((function(){o[e]=0})));var r=a[e];if(0!==r)if(r)t.push(r[2]);else{var i=new Promise((function(t,n){r=a[e]=[t,n]}));t.push(r[2]=i);var s,l=document.createElement("script");l.charset="utf-8",l.timeout=120,u.nc&&l.setAttribute("nonce",u.nc),l.src=c(e);var d=new Error;s=function(t){l.onerror=l.onload=null,clearTimeout(f);var n=a[e];if(0!==n){if(n){var r=t&&("load"===t.type?"missing":t.type),o=t&&t.target&&t.target.src;d.message="Loading chunk "+e+" failed.\n("+r+": "+o+")",d.name="ChunkLoadError",d.type=r,d.request=o,n[1](d)}a[e]=void 0}};var f=setTimeout((function(){s({type:"timeout",target:l})}),12e4);l.onerror=l.onload=s,document.head.appendChild(l)}return Promise.all(t)},u.m=e,u.c=r,u.d=function(e,t,n){u.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:n})},u.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},u.t=function(e,t){if(1&t&&(e=u(e)),8&t)return e;if(4&t&&"object"===typeof e&&e&&e.__esModule)return e;var n=Object.create(null);if(u.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var r in e)u.d(n,r,function(t){return e[t]}.bind(null,r));return n},u.n=function(e){var t=e&&e.__esModule?function(){return e["default"]}:function(){return e};return u.d(t,"a",t),t},u.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},u.p="/Plugins/VBook/",u.oe=function(e){throw console.error(e),e};var s=window["webpackJsonp"]=window["webpackJsonp"]||[],l=s.push.bind(s);s.push=t,s=s.slice();for(var d=0;d<s.length;d++)t(s[d]);var f=l;i.push([0,"chunk-vendors"]),n()})({0:function(e,t,n){e.exports=n("2034")},1336:function(e,t,n){"use strict";n("ed63"),n("5ab2"),n("6d57"),n("e10e");var r=n("70ea"),o=(n("2b45"),n("f548"),n("e769")),a=function(){var e=(new Date).getTime();window.performance&&"function"===typeof window.performance.now&&(e+=performance.now());var t="xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g,(function(t){var n=(e+16*Math.random())%16|0;return e=Math.floor(e/16),("x"==t?n:3&n|8).toString(16)}));return t},i=function e(t){var n=arguments.length>1&&void 0!==arguments[1]?arguments[1]:[];if(null===t||"object"!==Object(o["a"])(t))return t;var r=n.filter((function(e){return e.original===t}))[0];if(r)return r.copy;var a=Array.isArray(t)?[]:{};return n.push({original:t,copy:a}),Object.keys(t).forEach((function(r){a[r]=e(t[r],n)})),a},c=n("391c"),u=n("9b2a");function s(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function l(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?s(Object(n),!0).forEach((function(t){Object(r["a"])(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):s(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}var d={elName:"",animations:[],commonStyle:{position:"absolute",width:u["a"].canvasH5Width,height:30,top:200,left:0,rotate:0,paddingTop:0,paddingLeft:0,paddingRight:0,paddingBottom:0,marginTop:0,marginLeft:0,marginRight:0,marginBottom:0,borderWidth:0,borderColor:"",borderStyle:"solid",borderRadius:0,boxShadow:"",fontSize:16,fontWeight:500,lineHeight:1.4,letterSpacing:0,textAlign:"center",color:"#000000",backgroundColor:"",backgroundImage:"",backgroundSize:"cover",opacity:1,zIndex:1},events:[],propsValue:{},value:"",valueType:"String"},f={name:"",elements:[],commonStyle:{backgroundColor:"",backgroundImage:"",backgroundSize:"cover"},config:{}},p={name:"",title:"未命名场景",description:"",coverImage:"",auther:"",script:"",width:u["a"].canvasH5Width,height:u["a"].canvasH5Height,pages:[]},m=function(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},n=Object(c["cloneDeep"])(e),r=n.valueType||"String",o={Sting:"",Array:[],Object:{},Boolean:!1,Number:0},u=Object(c["cloneDeep"])(d),s=l(l({uuid:a()},u),{},{elName:n.elName,propsValue:i(n.needProps||{})});return s.commonStyle=Object(c["merge"])(s.commonStyle,n.defaultStyle),s.commonStyle=Object(c["merge"])(s.commonStyle,t),s.value=e.defaultValue||o[r],s.valueType=r,s.isForm=!!e.isForm,s},g=function(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{};return e=Object(c["cloneDeep"])(e),e.uuid=a(),e.commonStyle=Object(c["merge"])(e.commonStyle,t),e.commonStyle.top=e.commonStyle.top+10,e.commonStyle.left=e.commonStyle.left+10,e},v=function(){return l({uuid:a()},Object(c["cloneDeep"])(f))},y=function(e){var t=Object(c["cloneDeep"])(e);return t.uuid=a(),t.elements=t.elements.map((function(e){return g(e)})),t},h=function(){var e=Object(c["cloneDeep"])(p),t=v();return e.pages.push(l({},t)),l({},e)},b=function(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:1,n=["width","height","top","left","paddingTop","paddingLeft","paddingRight","paddingBottom","marginTop","marginLeft","marginRight","marginBottom","borderWidth","fontSize","borderRadius","letterSpacing"],r={};for(var o in e)n.includes(o)?r[o]=e[o]*t+"px":r[o]=e[o];return r.transform="rotate(".concat(r.rotate,"deg)"),r.backgroundImage=r.backgroundImage?"url(".concat(r.backgroundImage,")"):"",r};t["a"]={elementConfig:d,pageConfig:f,projectConfig:p,getElementConfig:m,getPageConfig:v,getProjectConfig:h,copyPage:y,copyElement:g,getCommonStyle:b}},"1ab8":function(e,t,n){"use strict";var r=n("8950"),o=n.n(r);o.a},2034:function(e,t,n){"use strict";n.r(t);var r={};n.r(r),n.d(r,"setLocalStorage",(function(){return Q})),n.d(r,"getLocalStorage",(function(){return ee})),n.d(r,"removeLocalStorage",(function(){return te})),n.d(r,"Cookie",(function(){return ne})),n.d(r,"dataURItoBlob",(function(){return re}));n("9dd9"),n("f548"),n("e10e"),n("6d57"),n("e44b"),n("6648"),n("5f54"),n("f0e6");var o=n("0261"),a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{class:{hideHeader:e.$route.meta.hideHeader},attrs:{id:"app"}},[n("div",{directives:[{name:"show",rawName:"v-show",value:!e.$route.meta.hideHeader,expression:"!$route.meta.hideHeader"}],staticClass:"page-header-wrapper"},[n("page-header")],1),n("router-view",{staticClass:"sub-page"})],1)},i=[],c=n("70ea"),u=(n("cc57"),function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"components-page-header"},[n("div",{staticClass:"logo-wrapper cursor-pointer",on:{click:function(t){return e.$router.push("/")}}}),e._t("default"),n("div",{staticClass:"pull-right"})],2)}),s=[],l=(n("5ab2"),n("ae8c"));function d(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function f(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?d(Object(n),!0).forEach((function(t){Object(c["a"])(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):d(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}var p={name:"page-header",components:{},data:function(){return{}},computed:f({},Object(l["d"])({userData:function(e){return e.user.userData},token:function(e){return e.user.token}})),methods:{logoutFn:function(){this.$router.push({name:"Login"})},goLogin:function(){this.$mUtils.Cookie.set("beforeLoginUrl",encodeURIComponent(this.$route.fullPath),1/24/60,window.location.host,window.location.pathname.substring(0,window.location.pathname.length-1)),this.$router.push({name:"Login"})}}},m=p,g=(n("1ab8"),n("4023")),v=Object(g["a"])(m,u,s,!1,null,"ce100072",null),y=v.exports,h={components:Object(c["a"])({},y.name,y)},b=h,O=(n("cdf5"),Object(g["a"])(b,a,i,!1,null,null,null)),j=O.exports,x=n("fe79");o["default"].use(x["a"]);var U=new x["a"]({routes:[{path:"/editor",name:"Editor",component:function(){return n.e("chunk-1280fab2").then(n.bind(null,"fbd7"))}}]}),D=(n("616f"),n("2b45"),n("9a33"),n("e769")),I={install:function(e){var t=e.prototype,n={siteName:"相册",server:"",apiUrl:"/API/H5",uploadUrl:"",apiId:"SSY5UF6SUK",apiKey:"sZ2Mx7BvAgEWr7i6JDh4vPLFluMuR4pn"};n.server="",n.apiUrl=n.apiUrl+"?apiId="+n.apiId+"&apiKey="+n.apiKey+"&action=",n.uploadUrl=n.apiUrl+"upload";var r={htmlToText:function(e,t){if(!e)return"";var n=document.createElement("div");n.innerHTML=e;var r=n.textContent;return r.length>t&&(r=r.substr(0,t)+"..."),r},substr:function(e,t){return!e||e.length<=t?e:e.substr(e,t)+"..."}},o={ToInt:function(e,t){if(t||(t=0),"True"==e||"true"==e||1==e)return 1;if("False"==e||"false"==e||0==e)return 0;var n=parseInt(e);return n+""=="NaN"&&(n=t),n},ToDouble:function(e,t,n){n||(n=0),t||(t=2);var r=parseFloat(e);return r+""=="NaN"&&(r=n),parseFloat(r.toFixed(t))},ToDate:function(e,t){if(!e||"string"!=typeof e)return"";switch(e=e.split(".")[0],t){case"date":e=e.split("T")[0];break;case"minute":e=e.replace("T"," "),e=e.substr(0,e.length-3);break;default:e=e.replace("T"," ");break}return e}},a={del:function(e,t){if(!e||e.length<1)return!1;for(var n=0;n<e.length;n++)if(e[n]==t)return e.splice(n,1),!0;return!1},isEmpty:function(e){return!e||e.length<1},getFirst:function(e,t){if(t||(t={}),!e||"[]"==e||"{}"==e||"null"==e)return t;var n=[];if(n="string"==typeof e?JSON.parse(e):e,n.length<1)return t;var r=t;for(var o in r=0==e.indexOf("{")?JSON.parse(e):n[0],r)"string"!=typeof r[o]||0!=r[o].indexOf("[")&&0!=r[o].indexOf("{")||(r[o]=JSON.parse(r[o]));return r}};e.prototype.util={alert:function(e,t){window.console.error(e),t&&t()},confirm:function(e,n){t.$weui.dialog({title:"",content:e,buttons:[{label:"取消",type:"default",onClick:function(){}},{label:"确定",type:"primary",onClick:n}]})},random:function(e){e||(e=6);for(var t="",n=1;n<=e;n++){var r=Math.floor(16*Math.random()).toString(16);t+=r}return t},stringify:function(e){var t=JSON.parse(JSON.stringify(e));for(var n in t)(Array.isArray(t[n])||"object"==Object(D["a"])(t[n]))&&(t[n]=JSON.stringify(t[n]));return JSON.stringify(t)},isNull:function(e){return!e||"null"==e||"{}"==e||"[]"==e},checkTG:function(e,n){n||(n=e.$route.params.id);var r=e.$route.query.puid;if(r){var o={};o.HdId=n,o.PUser=r,o.Link=location.hash,t.jsp("tg_relation_add",{model:JSON.stringify(o)}).then((function(e){window.console.log(e)}))}else window.console.log("未指定puid")},config:n,str:r,convert:o,array:a},t.util.getImg=function(e,t){var r=n.server;switch(e&&"null"!=e&&!e.endsWith("/null")||(e=""),t){case"userface":e?e.indexOf("://")<0&&(e=r+e):e=r+"/Images/userface/noface.png";break;case"nopic":e?e.indexOf("://")<0&&(e.toLowerCase().indexOf("/uploadfiles/")<0&&(e="/UploadFiles/"+e),e=r+e):e=r+"/UploadFiles/nopic.svg";break;default:e?e.indexOf("://")<0&&(e=r+e):e=r+"/UploadFiles/nopic.svg";break}return e},t.util.initWechatShare=function(e,r){var o=i.get();t.jsp("wx_sign",{url:location.href}).then((function(a){if(1!=a.retcode)return t.util.alert("error:"+a.retmsg),!1;a.result=JSON.parse(a.result),a.result.debug=!1,a.result.jsApiList=["checkJsApi","onMenuShareTimeline","onMenuShareAppMessage"];var i={title:r.PubTitle,desc:r.hd_fm_text,link:n.server+"/wxmp/#/cyf/bm/"+r.ID+"?puid="+o.userId,imgUrl:r.hd_fm[0].url,success:function(){}};i.imgUrl||(i.imgUrl=t.util.getImg("/UploadFiles/logo.png")),i.desc||(i.desc="参与活动"),e.config(a.result),e.ready((function(){e.onMenuShareTimeline(i),e.onMenuShareAppMessage(i)}))}))},e.prototype.jsp=function(e,r){var o=n.apiUrl+e,a=i.get();a&&a.userId>0&&(a.openid?o+="&openid="+a.openid:a.msn&&(o+="&openid="+a.msn));var c=new FormData;for(var u in r)c.append(u,r[u]);return this.$axios.post(o,c,{timeout:3e4}).then((function(n){return 200!=n.status?(t.util.alert("["+e+"] request error:"+JSON.stringify(n)),!1):(1!=n.data.retcode&&t.util.alert(n.data.retmsg),new Promise((function(e){e(n.data)})))}))},e.prototype.post=function(e,n){return t.jsp(e,n).then((function(e){return new Promise((function(t){t(e)}))}))},t.util.jumpToPay=function(e,t){var r=n.server+"/PayOnline/wxpay_mp?payno="+e;r+="&SuccessUrl="+t,location=r};var i={logout:function(){localStorage.removeItem("sys_mu")},getLast:function(t){e.prototype.jsp("user_getlast",{}).then((function(e){if(1!=e.retcode)return window.console.error("user_getlast",e.retmsg),!1;var n=JSON.parse(e.result);i.set(n),t&&t(n)}))},get:function(){var e=localStorage.getItem("sys_mu");if(e){var n=JSON.parse(e);return n.userFace=t.util.getImg(n.userFace),n}return null},set:function(e){null!=e&&void 0!=e&&localStorage.setItem("sys_mu",JSON.stringify(e))}}}},E={install:function(e){e.prototype.Regex={isMinLen:function(e,t){return e=e.replace(/ /g,""),e.length<t},isEmpty:function(){for(var e=0;e<arguments.length;e++){if(!arguments[e]||void 0==arguments[e]||arguments[e]+""=="NaN")return!0;if(!this.isInt(arguments[e])){var t=arguments[e].replace(/ /g,"");if(""==t)return!0}}return!1},isPop:function(e){var t=/^(\w+)\.(\w+)\.(\w+)/g;return!!t.exec(e)},isContainChina:function(e){var t=/[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/gi;return!!t.exec(e)},isEngorNum:function(e){var t=/^[A-Za-z0-9]*$/;return!!t.exec(e)},isCharorNum:function(e){var t=/^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[\w])*$/;return!!t.exec(e)},isVirtualPath:function(e){return 0==e.indexOf("~/")&&e.indexOf(".")>0},isUrl:function(e){return!1},isEmail:function(e){var t=/^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/gi;return!!t.exec(e)},isIDCard:function(e){var t=/(^\d{15}$)|(^\d{17}([0-9]|X)$)/;return t.exec(e)},isMobilePhone:function(e){var t=/^1(?:3|4|5|6|7|8|9)\d{9}$/,n=/0\d{2,5}-\d{5,8}/g;return!(!t.exec(e)&&!n.exec(e))},isZipCode:function(e){return this.isInt(e)&&6==e.length},isIP:function(e){var t=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g;return!!t.exec(e)},isInt:function(e){var t=/^\d+(\d+)?$/gi;return!!t.exec(e)},isNum:function(){for(var e=0;e<arguments.length;e++){var t=parseFloat(arguments[e]);if(!(t>=0))return!1}return!0},extCheck:function(e,t){if(!e||""==e||!t||""==t)return!1;var n=this.getExt(e),r=t.toLowerCase().split(",");if(""==n||r.length<1)return!1;for(var o=0;o<r.length;o++)if(n==r[o])return!0;return!1},domIsEng:function(e){var t=0,n=/[^a-zA-Z0-9\s]+/gi;return!n.exec(e)&&(t=e.toString().indexOf(" "),t>0)},_isIgnKey:function(e){for(var t=[37,38,39,40,13,20,16,17,18,8],n=0;n<t.length;n++)if(e.keyCode==t[n])return!0;return!1},getExt:function(e){if(!e)return"";if(e=e.split("?")[0].replace(/" "/g,"").toLowerCase(),e.indexOf("/")>-1&&(e=e.substring(e.lastIndexOf("/")+1,e.length)),e.indexOf(".")<0)return"";var t=e.lastIndexOf(".")+1,n=e.substring(t,e.length);return n}}}},w=n("82ae"),S=n.n(w),P=(n("e697"),n("e204"),n("c52d")),C=n("391c"),k=n("1336"),A={projectData:{},activePageUUID:"",activeElementUUID:"",historyCache:[],currentHistoryIndex:-1,activeAttrEditCollapse:["1"]},H={setPrjectData:function(e,t){var n=e.commit,r=e.state,o=e.dispatch,a=t;a||(a=k["a"].getProjectConfig()),n("setPrjectData",a),r.projectData.pages&&r.projectData.pages.length||o("addPage"),o("setActivePageUUID",r.projectData.pages[0].uuid)},setActivePageUUID:function(e,t){var n=e.commit;n("setActivePageUUID",t),n("setActiveElementUUID","")},setActiveElementUUID:function(e,t){var n=e.commit;n("setActiveElementUUID",t)},updateCoverImage:function(e,t){var n=e.commit;n("updateCoverImage",t)},addPage:function(e,t){var n=e.commit,r=k["a"].getPageConfig(),o=-1;o=t?A.projectData.pages.findIndex((function(e){return e.uuid===t})):A.projectData.pages.length-1,n("insertPage",r,o),n("addHistoryCache")},deletePage:function(e,t){var n=e.state,r=e.commit,o=e.dispatch;if(1===n.projectData.pages.length&&n.activePageUUID===t)return o("addPage"),r("setActivePageUUID",n.projectData.pages[1].uuid),r("deletePage",a),void r("addHistoryCache");n.projectData.pages[0]===t&&n.activePageUUID===t&&r("setActivePageUUID",n.projectData.pages[1].uuid);var a=n.projectData.pages.findIndex((function(e){return e.uuid===t}));r("deletePage",a),r("addHistoryCache")},copyPage:function(e,t){var n=e.commit,r=A.projectData.pages.find((function(e){return e.uuid===t})),o=k["a"].copyPage(r);n("insertPage",o),n("addHistoryCache")},addElement:function(e,t){var n=e.commit,r=N.activePage(A),o=k["a"].getElementConfig(t,{zIndex:r.elements.length+1});n("addElement",o),n("setActiveElementUUID",o.uuid),n("addHistoryCache")},elementCommand:function(e,t){var n=e.commit,r=e.dispatch,o=e.state,a=N.activeElement(o);switch(t){case"copy":r("copyElement",a);break;case"delete":r("deleteElement",a.uuid);break;case"fontA+":r("resetElementCommonStyle",{fontSize:a.commonStyle.fontSize+1});break;case"fontA-":r("resetElementCommonStyle",{fontSize:a.commonStyle.fontSize-1});break;case"fontB":r("resetElementCommonStyle",{fontWeight:"bold"===a.commonStyle.fontWeight?"normal":"bold"});break;case"layerUp":n("resetElementZIndex",{uuid:a.uuid,type:"layerUp"}),n("addHistoryCache");break;case"layerDown":n("resetElementZIndex",{uuid:a.uuid,type:"layerDown"}),n("addHistoryCache");break;case"layerTop":n("resetElementZIndex",{uuid:a.uuid,type:"layerTop"}),n("addHistoryCache");break;case"layerBottom":n("resetElementZIndex",{uuid:a.uuid,type:"layerBottom"}),n("addHistoryCache");break;default:break}},copyElement:function(e,t){var n=e.state,r=e.commit,o=t||N.activeElement(n),a=N.activePage(n),i=k["a"].copyElement(o,{zIndex:a.elements.length+1});r("addElement",i),r("setActiveElementUUID",i.uuid),r("addHistoryCache")},deleteElement:function(e,t){var n=e.state,r=e.commit;t===n.activeElementUUID&&r("setActiveElementUUID",""),r("resetElementZIndex",{uuid:t,type:"set0"}),r("deleteElement",t),r("addHistoryCache")},resetElementCommonStyle:function(e,t){var n=e.commit;n("resetElementCommonStyle",t),n("addHistoryCache")},addElementAnimate:function(e,t){var n=e.commit,r={type:t,duration:1,infinite:"",interationCount:1,delay:0};n("addElementAnimate",r),n("addHistoryCache")},deleteElementAnimate:function(e,t){var n=e.commit;n("deleteElementAnimate",t),n("addHistoryCache")},addElementEvent:function(e,t){var n=e.commit,r={type:t,url:""};n("addElementEvent",r),n("addHistoryCache")},deleteElementEvent:function(e,t){var n=e.commit;n("deleteElementEvent",t),n("addHistoryCache")},addHistoryCache:function(e){var t=e.commit;t("addHistoryCache")},editorUndo:function(e){var t=e.commit,n=e.state;if(N.canUndo(n)){var r=n.historyCache[n.currentHistoryIndex-1];t("relapceEditorState",Object(C["cloneDeep"])(r)),t("editorUndo")}},editorRedo:function(e){var t=e.commit;if(N.canRedo(A)){var n=A.historyCache[A.currentHistoryIndex+1];t("relapceEditorState",Object(C["cloneDeep"])(n)),t("editorRedo")}}},T={setPrjectData:function(e,t){e.projectData=t},setActivePageUUID:function(e,t){e.activePageUUID=t},setActiveElementUUID:function(e,t){e.activeElementUUID=t},updateCoverImage:function(e,t){e.projectData.coverImage=t},insertPage:function(e,t,n){n?e.projectData.pages.splice(n,0,t):e.projectData.pages.push(t)},deletePage:function(e,t){e.projectData.pages.splice(t,1)},addElement:function(e,t){var n=e.projectData.pages.findIndex((function(t){return t.uuid===e.activePageUUID}));e.projectData.pages[n].elements.push(t)},deleteElement:function(e,t){var n=N.activePage(e),r=n.elements.findIndex((function(e){return e.uuid===t}));n.elements.splice(r,1)},resetElementCommonStyle:function(e,t){var n=N.activeElement(e);n.commonStyle=Object(C["merge"])(n.commonStyle,t)},addElementAnimate:function(e,t){var n=N.activeElement(e);n.animations.push(t)},deleteElementAnimate:function(e,t){var n=N.activeElement(e);n.animations.splice(t,1)},addElementEvent:function(e,t){var n=N.activeElement(e);n.events.push(t)},deleteElementEvent:function(e,t){var n=N.activeElement(e);n.events.splice(t,1)},resetElementZIndex:function(e,t){var n=t.uuid,r=t.type;n=n||e.activeElementUUID;var o=N.activePage(e),a=o.elements.find((function(e){return e.uuid===n})),i=a.commonStyle.zIndex,c=o.elements.length,u=1,s={layerUp:Math.min(i+1,c),layerDown:Math.max(i-1,u),layerTop:c,layerBottom:u,set0:0};if(void 0!==s[r]){var l=s[r];a.commonStyle.zIndex=l,o.elements.forEach((function(e){n!==e.uuid&&("layerUp"===r&&e.commonStyle.zIndex===l&&e.commonStyle.zIndex--,"layerDown"===r&&e.commonStyle.zIndex===l&&e.commonStyle.zIndex++,"layerTop"===r&&e.commonStyle.zIndex>i&&e.commonStyle.zIndex--,("layerBottom"===r||"set0"===r)&&e.commonStyle.zIndex<i&&e.commonStyle.zIndex++)}))}},addHistoryCache:function(e){e.currentHistoryIndex+1<e.historyCache.length&&e.historyCache.splice(e.currentHistoryIndex+1),e.historyCache.push({projectData:Object(C["cloneDeep"])(e.projectData),activePageUUID:e.activePageUUID,activeElementUUID:e.activeElementUUID}),e.historyCache.splice(100),e.currentHistoryIndex++},editorUndo:function(e){e.currentHistoryIndex--},editorRedo:function(e){e.currentHistoryIndex++},relapceEditorState:function(e,t){e.projectData=Object(C["cloneDeep"])(t.projectData),e.activePageUUID=t.activePageUUID,e.activeElementUUID=t.activeElementUUID},updateActiveAttrEditCollapse:function(e,t){e.activeAttrEditCollapse=Object(P["a"])(t)}},N={currentPageIndex:function(e){return e.projectData.pages?e.projectData.pages.findIndex((function(t){return t.uuid===e.activePageUUID})):-1},activeElementIndex:function(e){if(!e.projectData.pages)return-1;var t=e.projectData.pages.findIndex((function(t){return t.uuid===e.activePageUUID}));return-1===t?-1:e.projectData.pages[t].elements.findIndex((function(t){return t.uuid===e.activeElementUUID}))},activePage:function(){return A.projectData.pages&&A.activePageUUID?A.projectData.pages.find((function(e){return e.uuid===A.activePageUUID})):{commonStyle:{},config:{}}},activeElement:function(){if(!A.projectData.pages)return{commonStyle:{},propsValue:{}};var e=A.projectData.pages.findIndex((function(e){return e.uuid===A.activePageUUID}));return-1===e?{commonStyle:{},propsValue:{}}:A.projectData.pages[e].elements.find((function(e){return e.uuid===A.activeElementUUID}))},canUndo:function(e){return e.currentHistoryIndex>0},canRedo:function(e){return e.historyCache.length>e.currentHistoryIndex+1},pageMode:function(e){return e.projectData.pageMode}},L={state:A,getters:N,actions:H,mutations:T};function _(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function M(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?_(Object(n),!0).forEach((function(t){Object(c["a"])(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):_(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}var $={token:"",permissionsList:[],userData:{avatar:"",level:""}},F={updateUserInfo:function(e,t){var n=e.commit;n("updateUserInfo",t)},updateUserToken:function(e,t){var n=e.commit;n("updateUserToken",t)},doLogout:function(){}},z={updateUserInfo:function(e,t){e.userData=M({},t)},updateUserToken:function(e,t){e.token=t||""}},B={authorization:function(e){return e.token?"Bearer "+e.token:""},userData:function(e){return e.userData}},J={state:$,getters:B,actions:F,mutations:z},R=n("b705"),W=n.n(R),Z={},V={showMassage:function(e,t){console.log(t),Object(R["Message"])({type:t.type,message:t.message||t.data})}},K={},q={};o["default"].use(l["a"]);var G=new l["a"].Store({state:Z,getters:q,actions:V,mutations:K,modules:{editor:L,user:J}}),X=n("38bc"),Y=n.n(X),Q=(n("70e7"),n("47e7"),function(e,t){e&&("string"!==typeof t&&(t=JSON.stringify(t)),window.localStorage.setItem(e,t))}),ee=function(e){if(e){var t=window.localStorage.getItem(e);return t?JSON.parse(t):void 0}},te=function(e){e&&window.localStorage.removeItem(e)},ne={get:function(e){for(var t=document.cookie,n=t.split("; "),r=0;r<n.length;r++){var o=n[r].split("=");if(o[0]==e)return o[1]}return""},set:function(e,t,n,r,o){var a=e+"="+(t||""),i=new Date;r=void 0!=r?";domain="+r:"",i.setTime(i.getTime()+24*(n||1)*3600*1e3),a=a+r+"; path="+(o||"/")+"; expires="+i.toGMTString(),document.cookie=a},remove:function(e){this.set(e,"",-1)}};function re(e){for(var t=atob(e.split(",")[1]),n=e.split(",")[0].split(":")[1].split(";")[0],r=new ArrayBuffer(t.length),o=new Uint8Array(r),a=0;a<t.length;a++)o[a]=t.charCodeAt(a);var i=new Blob([r],{type:n});return i}U.beforeEach((function(e,t,n){Y.a.start(),n()})),U.afterEach((function(){Y.a.done()}));var oe=n("9b2a"),ae={booleanToText:function(e){return e?"是":"否"},getLabelText:function(e,t){var n=arguments.length>2&&void 0!==arguments[2]?arguments[2]:"label",r=t.find((function(t){return t.value===e}));return r?r[n]:""}},ie=ae,ce=n("e82a"),ue="icklsdufidsakdfa",se="";function le(e){var t=ce.enc.Utf8.parse(ue),n=ce.enc.Utf8.parse(se),r=ce.AES.encrypt(e,t,{iv:n,mode:ce.mode.ECB,padding:ce.pad.Pkcs7});return r.ciphertext.toString()}function de(e){var t=ce.enc.Hex.parse(e),n=ce.enc.Base64.stringify(t),r=ce.enc.Utf8.parse(ue),o=ce.enc.Utf8.parse(se),a=ce.AES.decrypt(n,r,{iv:o,mode:ce.mode.CBC,padding:ce.pad.Pkcs7});return a.toString(ce.enc.Utf8)}var fe={Decrypt:de,Encrypt:le},pe=(n("b11f"),n("deae"),n("157a"),n("9306")),me=n.n(pe);o["default"].use(W.a),o["default"].use(me.a),o["default"].use(I),o["default"].use(E),o["default"].prototype.$mUtils=r,o["default"].prototype.AES=fe,o["default"].prototype.$axios=S.a,o["default"].prototype.$config=oe["a"],Object.keys(ie).forEach((function(e){o["default"].filter(e,ie[e])})),o["default"].prototype.goBeforeLoginUrl=function(){var e=ne.get("beforeLoginUrl");e=decodeURIComponent(e),e&&-1==e.indexOf("/author")?(U.push(e),ne.set("beforeLoginUrl","",1/24/60,window.location.host,window.location.pathname.substring(0,window.location.pathname.length-1))):U.push("/")},String.prototype.replaceAll=function(e,t){return this.replace(new RegExp(e,"gm"),t)},o["default"].config.productionTip=!1,new o["default"]({router:U,store:G,render:function(e){return e(j)}}).$mount("#app")},"86f1":function(e,t,n){},8950:function(e,t,n){},"9b2a":function(e,t,n){"use strict";n("5ab2"),n("6d57"),n("e10e");var r=n("70ea");function o(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function a(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?o(Object(n),!0).forEach((function(t){Object(r["a"])(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):o(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}var i={development:{baseURL:""},production:{baseURL:""}},c="production",u=!1,s=!1,l=a(a({isDevelop:u||s},i[c]),{},{canvasH5Width:748,canvasH5Height:1060});t["a"]=l},b11f:function(e,t,n){},cdf5:function(e,t,n){"use strict";var r=n("86f1"),o=n.n(r);o.a},deae:function(e,t,n){}});