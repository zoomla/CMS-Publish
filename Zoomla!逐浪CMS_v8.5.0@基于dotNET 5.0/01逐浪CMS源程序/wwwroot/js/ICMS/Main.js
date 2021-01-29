﻿//场景切换
function ScenceFunc(json)//Scence Switch
{
    var deskobj = null;
    try { deskobj = JSON.parse(json); } catch (ex) { console.log("ScenceFunc", ex.message, json); return; }
    for (var i = 0; i < deskobj.length; i++) {
        if (!deskobj[i].Visible) {
            $(".menu" + deskobj[i].ID).hide()
        } else {
            for (var j = 0; j < deskobj[i].Child.length; j++) {
                if (!deskobj[i].Child[j].Visible) {
                    $(".menu" + deskobj[i].Child[j].ID).hide();
                }
            }
        }
    }
}
//清除首页的选中缓存
function ClearDefault()
{
    window.localStorage.removeItem("Default_leftin");
}
function openmenu(id) {
    $(".m_top_bottom>ul").hide();
    //$(".m_top_bottom").find("." + id).show();
    $(".m_top_bottom").find("." + id).css("display", "flex");
}
//----首页左边栏
function hideleft() {//隐掉基本左边栏,显示ascx边栏
    if ($("#right").hasClass("sys_ml16rem")) {
        LeftBarHide();
    }
    else {
        LeftBarShow();
    }
}
function LeftBarHide() {
    window.localStorage.Default_leftStatus = 0;
    $("#left").removeClass("sysSidebar_show");
	$("#left").addClass("sysSidebar_hidden");
    $("#right").removeClass("sys_ml16rem");
    $("#right").addClass("sys_ml3rem");
    LeftSwitchFunc();
}
function LeftBarShow() {
    window.localStorage.Default_leftStatus = 1;
	$("#left").removeClass("sysSidebar_hidden");
	$("#left").addClass("sysSidebar_show");
    $("#right").removeClass("sys_ml3rem");
    $("#right").addClass("sys_ml16rem");
    LeftSwitchFunc();
}
function LeftSwitchFunc() {
    //缓存设为不开启左边栏,或左边栏不可见
    var openleft = ((window.localStorage.Default_leftStatus && window.localStorage.Default_leftStatus == 0) || $("#left").is(":hidden"));
    if (openleft) {
        $("#leftSwitch").css("left", "2px");
        $("#leftSwitch").attr("alt", "打开左边栏");
        $("#leftSwitch .fa").attr("class","zi zi_checkcircle");
    }
    else {
        var leftWidth = $("#left").width();
        $("#leftSwitch").attr("alt", "关闭左边栏");
        $("#leftSwitch .fa").attr("class", "zi zi_doubleLeft");
    }
    $("#leftSwitch").show();
}
//读取配置参数初始化左边栏
function LeftBarInit()
{
    LeftSwitchFunc();
    var openleft = ((window.localStorage.Default_leftStatus && window.localStorage.Default_leftStatus == 0) || $("#left").is(":hidden"));
    if (openleft) { LeftBarHide(); }
    else { LeftBarShow();}
}
//搜索
function showsearch() {
    if ($("#search_div").hasClass("hidden-lg hidden_group"))
        $("#search_div").removeClass("hidden-lg hidden_group");
    else
        $("#search_div").addClass("hidden-lg hidden_group");
}
//设置Cookies
function setCookie(obj) {
    if (!navigator.cookieEnabled) {
        alert('不允许设置Cookie项!');
    } else {
        var date = new Date();
        date.setTime(date.getTime() + 60000 * 10);
        document.cookie = "SetLock=" + escape(obj) + ";expires=" + date.toGMTString() + ";path=/" + ";domaim=z01.com" + ":secure";
    }
}
function getCookie(cookie_name) {
    var allcookies = document.cookie;
    var cookie_pos = allcookies.indexOf(cookie_name);
    // 如果找到了索引，就代表cookie存在，反之，就说明不存在。  
    if (cookie_pos != -1) {
        // 把cookie_pos放在值的开始，只要给值加1即可。   
        cookie_pos += cookie_name.length + 1;
        var cookie_end = allcookies.indexOf(";", cookie_pos);
        if (cookie_end == -1) {
            cookie_end = allcookies.length;
        }
        var value = unescape(allcookies.substring(cookie_pos, cookie_end));
    }
    return value;
}
//----
//用于锁屏
function showWindow(url, width, height) {
    var windowstr = "<div class=lockin><iframe src='" + url + "' scrolling='no' frameborder='0'></iframe></div>";
    document.getElementById("infoDiv").innerHTML = windowstr;
    document.getElementById("infoDiv").style.top = "0px";
    document.getElementById("infoDiv").style.width = "100%";
    document.getElementById("infoDiv").style.height = "100%";
    //document.getElementById("tranDiv").style.height = document.body.clientHeight + "px";
    document.getElementById("tranDiv").style.width = document.body.clientWidth + "px";
    document.getElementById("tranDiv").style.display = "";
    document.getElementById("tranDivBack").style.display = "";
    document.getElementById("infoDiv").style.display = "";
}
//-----Tab切换,左边栏效果
var myFrame =
  {
      TabJsonArr: [{ tid: "1", left: "menu1_1", htmls: "", keyword: "" }],
      AddTabJson: function (id, url, ht) {
          var isHas = false;
          jsonArr = myFrame.TabJsonArr;
          for (var i = 0; i < jsonArr.length; i++) {
              if (jsonArr[i].tid == id) { jsonArr[i].left = url; jsonArr[i].htmls = ht; isHas = true; break; }
          }
          if (!isHas)//无匹配，新增
          {
              var newTab = { "tid": id, "left": url, "htmls": ht };
              jsonArr.push(newTab);
          }
      },
      GetLeftUrl: function (tid) {//获取当前的ID，如有则更新，无则创建
          jsonArr = myFrame.TabJsonArr;
          for (var i = 0; i < jsonArr.length; i++) {
              if (jsonArr[i].tid == tid) return jsonArr[i].left;
          }
      },
      SetKeyword: function (tid) {//取出记忆的关键词
          for (var i = 0; i < jsonArr.length; i++) {
              if (jsonArr[i].tid == tid) { $("#keyWord").val(jsonArr[i].keyword); break; }
          }
      },
      SaveKeyword: function (tid, str) {//关键词记忆
          for (var i = 0; i < jsonArr.length; i++) {
              if (jsonArr[i].tid == tid) { jsonArr[i].keyword = str; break; }
          }
      },
      UpdateLeft: function (tid)
      {
          var jsonArr = myFrame.TabJsonArr;
          var json = "";
          for (var i = 0; i < jsonArr.length; i++) {
              if (jsonArr[i].tid == tid) { json = jsonArr[i]; break; }
          }
          if (json.htmls && json.htmls != "") {
              $("#left_Div").html(json.htmls);
              $("#left_Div").show();
              $("#left_ul_div").hide();
              ascxInit(json.left);
          }
          else showleft(json.left);
      },
      SwitchLeft: function (tid) {//根据当前tid切换左边栏&&右边栏&&左边栏选中
          if (tid == undefined) { return; }
          myFrame.UpdateLeft(tid);
          myFrame.UpdateSelected(tid);
      },
      SelectedJson: [],//左边栏选中
      AddSelected: function (tid, obj)//tid,超链接,如拥有ID属性则存ID(NodeTree兼容)，无则直接存对象的引用
      {
          var isHas = false;
          jsonArr = myFrame.SelectedJson; 
          for (var i = 0; i < jsonArr.length; i++) {
              if (jsonArr[i].tid == tid)
              { 
                  $(jsonArr[i].left).removeClass("SelectedA"); jsonArr[i].left = obj; jsonArr[i].id = obj.id; isHas = true; break;                  
              } 
          }
          if (!isHas)
          { 
              var newTab = { "tid": tid, "left": obj, "id": obj.id };  
              jsonArr.push(newTab);
          } 
          $(obj).addClass("SelectedA");
          $(".SelectedA").parent().find("li a").css({ paddingLeft:'20px',color:'rgba(25,99,170,0.8)'});
          $(".SelectedA").parent().find("li").css({background:'#f5f5f5'});
          //栏目坐菜单图标+、-的切换
          var temp = $(obj).parent().parent().parent().find(".fa-chevron-up");
          if (temp.length > 0) { 
              $(".tvNav li li a").css({ paddingLeft: '20px' });
              $(".tvNav li li li a").css({ paddingLeft: '35px' });
              $(".tvNav li li li li a").css({ paddingLeft: '45px' });
              if ($(obj).find(".fa-chevron-up").length > 0) {
                  $(obj).find("i").removeClass("fa-chevron-up");
                  $(obj).find("i").addClass("fa-chevron-down");
              }
              else { 
                  temp.removeClass("fa-chevron-up");
                  temp.addClass("fa-chevron-down");
                  $(obj).find("i").removeClass("fa-chevron-down");
                  $(obj).find("i").addClass("fa-chevron-up");
              }
          }          
          else { 
              $(obj).find("i").removeClass("fa-chevron-down");
              $(obj).find("i").addClass("fa-chevron-up");
          }
          
           
          
      },
      UpdateSelected: function (tid) {
          var jsonArr = myFrame.SelectedJson;
          for (var i = 0; i < jsonArr.length; i++) {
              if (jsonArr[i].tid != tid) { 
                  $(jsonArr[i].left).removeClass("SelectedA");
                   
              }
              else//如有ID则以ID为准
              {
                  if (jsonArr[i].id && jsonArr[i].id != undefined && jsonArr[i].id != "") {
                      $("#" + jsonArr[i].id).addClass("SelectedA");
                      
                  }
                  else {
                      $(jsonArr[i].left).addClass("SelectedA");
                       
                  }
              }
          }
      }
  }
//显示左边栏与右窗口
/*
 * left_Div   :动态加载菜单的div(如节点树)
 * left_Hid   :动态加载的菜单,html缓存
 * left_ul_div:预置菜单的div
 */ 
function showleft(id, rightUrl) {
    $("#left_Hid").val("");
    $("#left_ul_div").show();
    $("#left_Div").hide();
    if (id && id != "") {
        $("#" + id).parent().find(".m_left_ulin").removeClass("open");//第二层
        $("#" + id).addClass("open");
        $("#" + id).parent().parent().find(".m_left_ul").removeClass("open");//第一层
        $("#" + id).parent().addClass("open");
        var pid = id.split('_')[0];
        $("#" + pid).removeClass("hidden");
        $("#" + pid).addClass("open");
        lastLeft = id;
    }
    if (rightUrl && rightUrl != "") { ShowMain('', rightUrl); }
    myFrame.AddTabJson(currentFrameTabId, id);
    LeftBarShow();
}
var keywordArr = [];//用于缓存关键词
function ShowMain(leftUrl, rightUrl, obj,remind) {//优先加载右边iframe
    if (rightUrl && rightUrl != "") { 
        rightUrl = rightUrl.replace("{$path}", Path);
        var temp = FrameTab.getDomById(currentFrameTabId, "iframe");
        temp.src = "/lib/html/wait.html?ver=6" + (remind ? "&r=" + encodeURI(remind) : "");
        $(temp).bind("load", function () { $(temp).unbind("load"); temp.src = rightUrl; })
    }
    setTimeout(function () {
        if (leftUrl && $("#left_Hid").val() !== leftUrl) {
            $("#left_Hid").val(leftUrl);
            //$("#leftSwitch_Btn").click();//触发加载左边栏
            $.post(Path + "Index/ASCXLoad", { "name": leftUrl }, function (data) {
                //console.log("ASCXLoad", leftUrl, data);
                $("#left_Div").html(data);
                $("#left_ul_div").hide();
                DivCache(leftUrl.toLowerCase());ascxInit(leftUrl);  setLayout();

            });
            myFrame.AddTabJson(currentFrameTabId, leftUrl);
            lastLeft = leftUrl;
            //关键词记忆
            setTimeout(function () {
                myFrame.SetKeyword(currentFrameTabId); $(".ascx_key").bind("blur paste clip", function () { myFrame.SaveKeyword(currentFrameTabId, $(this).val()); });
            }, 1000);
        }
    }, 100);
    if (obj && obj != undefined) {
        myFrame.AddSelected(currentFrameTabId, obj);
    }
    LeftBarShow();
}
//舆情层级菜单
function BindLayerUL() {
    $(".laybtn").click(function () {
        $ul = $(this).parent("li").find("ul");
        console.log($ul.css("display"));//单次点击触发了两次事件
        if ($ul.is(":hidden")) {
            $ul.slideDown();
            $(this).find("i").removeClass("zi zi_pluscircle");
            $(this).find("i").addClass("zi zi_circleDowns");
        }
        else {
            $ul.slideUp();
            $(this).find("i").removeClass("zi zi_circleDowns");
            $(this).find("i").addClass("zi zi_pluscircle");
        }
    })
};