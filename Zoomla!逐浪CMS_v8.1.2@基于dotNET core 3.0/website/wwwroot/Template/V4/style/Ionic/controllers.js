angular.module('starter.controllers', [])

.controller('IndexCtrl',function($scope,$http){
	$scope.openLink = function (url) {
      window.open(url, '_system');
    }
})
.controller('DashCtrl', function ($scope, $ionicSideMenuDelegate, Product, Wechat,User) {
	//User.autoLogin(function(data){});//need del
	$scope.city="<i class='fa fa-spinner fa-spin'></i>";
	
	$scope.prolist="";
	$scope.pulldown = {};
	$scope.pullup = {};
	$scope.pullup.cpage = 1;
	$scope.count="";
	
	console.log($scope.nodeid)

	Product.list(10,$scope.pullup.cpage,$scope.nodeid,function(data){ //pagesize,cpage,node
		$scope.prolist=JSON.parse(data.result);
		$scope.count=JSON.parse(data.addon).count;
	});
	
	$scope.pulldown.init = function () {
		$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		$scope.pullup.cpage=1;
		Product.list(10,$scope.pullup.cpage,$scope.nodeid,function(data){ //pagesize,cpage,node
			$scope.prolist=JSON.parse(data.result);
			$scope.count=JSON.parse(data.addon).count;
			$scope.$broadcast('scroll.refreshComplete');
		});
		$scope.pullup.canbeload = true;
	};
	$scope.pulldown.showspin = false;
	
	//---------------上拉(没有滚动,就没有上拉)
	$scope.pullup.load = function () {
		$scope.pullup.cpage++;
		Product.list(10,$scope.pullup.cpage,$scope.nodeid,function(data){ //pagesize,cpage,node
			$scope.prolist=$scope.prolist.concat(JSON.parse(data.result));
			$scope.$broadcast('scroll.infiniteScrollComplete');
			if($scope.pullup.cpage*10>$scope.count)
				$scope.pullup.canbeload = false;
		});
	};
	//是否启用上拉加载
	$scope.pullup.canbeload = true;
	$scope.pulldown.init();
	
//	$scope.pro=[];	
//	Product.list(30,1,1,function(data){
//		$scope.pro[0]=JSON.parse(data.result);
//	});
//	Product.list(6,1,6,function(data){
//		$scope.pro[1]=JSON.parse(data.result);
//	});
//	Product.list(6,1,7,function(data){
//		$scope.pro[2]=JSON.parse(data.result);
//	});
//	Product.list(6,1,8,function(data){
//		$scope.pro[3]=JSON.parse(data.result);
//	});
//	Product.list(6,1,9,function(data){
//		$scope.pro[4]=JSON.parse(data.result);
//	});
	$scope.btnname = "微信支付11";
	$scope.openPay = function () {
	    var showInfo = function (msg) {
	        var dom = document.getElementById("result_div");
	        if (dom != null) { dom.innerText = msg; }
	    }
	    showInfo("进入支付");
	    try {
	        Wechat.sendPaymentRequest(function (data) {
	            showInfo("return ok" + data);
	        }, function (data) { showInfo("return failed" + data); });
	    } catch (ex) { showInfo("exception:"+ex.message); }
	}
	
	//根据GPS获取当前位置信息
	var geoc = new BMap.Geocoder();  
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS)
		{
			var mypoint = new BMap.Point(r.point.lng,r.point.lat);
			geoc.getLocation(mypoint, function(rs){
				var addComp = rs.addressComponents;
				console.log(addComp);
				$scope.city=addComp.city.replace("市","")+"<i class='icon ion-ios-arrow-down'></i>";
				$scope.$digest();
				//$(".mycity").html(addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber);
			});
		}
	});
})

.controller('DiscountCtrl', function($scope,$ionicSideMenuDelegate,Product) {
	$scope.nodeid=180;
	$scope.prolist="";
	$scope.pulldown = {};
	$scope.pullup = {};
	$scope.pullup.cpage = 1;
	$scope.count="";

	Product.list(10,$scope.pullup.cpage,$scope.nodeid,function(data){ //pagesize,cpage,node
		$scope.prolist=JSON.parse(data.result);
		console.log($scope.prolist)
		$scope.count=JSON.parse(data.addon).count;
	});

	$scope.pulldown.init = function () {
		$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		$scope.pullup.cpage=1;
		Product.list(10,$scope.pullup.cpage,$scope.nodeid,function(data){ //pagesize,cpage,node
			$scope.prolist=JSON.parse(data.result);
			$scope.count=JSON.parse(data.addon).count;
			$scope.$broadcast('scroll.refreshComplete');
		});
		$scope.pullup.canbeload = true;
	};
	$scope.pulldown.showspin = false;
	
	//---------------上拉(没有滚动,就没有上拉)
	$scope.pullup.load = function () {
		$scope.pullup.cpage++;
		Product.list(10,$scope.pullup.cpage,$scope.nodeid,function(data){ //pagesize,cpage,node
			$scope.prolist=$scope.prolist.concat(JSON.parse(data.result));
			$scope.$broadcast('scroll.infiniteScrollComplete');
			if($scope.pullup.cpage*10>$scope.count)
				$scope.pullup.canbeload = false;
		});
	};
	//是否启用上拉加载
	$scope.pullup.canbeload = true;
	$scope.pulldown.init();
})

.controller('ChatDetailCtrl', function($scope, $stateParams, Chats) {
  $scope.chat = Chats.get($stateParams.chatId);
})

.controller('AccountCtrl', function($scope,Product) {
	$scope.prolist="";
	$scope.nodeid=180;
	$scope.pulldown = {};
	$scope.pullup = {};
	$scope.pullup.cpage = 1;
	$scope.count="";

	Product.hot(10,$scope.pullup.cpage,$scope.nodeid,function(data){
		$scope.prolist=JSON.parse(data.result);
		console.log(data)
		$scope.count=JSON.parse(data.addon).count;
	});
	
	$scope.pulldown.init = function () {
		$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		$scope.pullup.cpage=1;
		Product.hot(10,$scope.pullup.cpage,$scope.nodeid,function(data){ //pagesize,cpage,node
			$scope.prolist=JSON.parse(data.result);
			$scope.count=JSON.parse(data.addon).count;
			$scope.$broadcast('scroll.refreshComplete');
		});
		$scope.pullup.canbeload = true;
	};
	$scope.pulldown.showspin = false;
	
	//---------------上拉(没有滚动,就没有上拉)
	$scope.pullup.load = function () {
		$scope.pullup.cpage++;
		Product.hot(10,$scope.pullup.cpage,$scope.nodeid,function(data){ //pagesize,cpage,node
			$scope.prolist=$scope.prolist.concat(JSON.parse(data.result));
			$scope.$broadcast('scroll.infiniteScrollComplete');
			if($scope.pullup.cpage*10>$scope.count)
				$scope.pullup.canbeload = false;
		});
	};
	//是否启用上拉加载
	$scope.pullup.canbeload = true;
	$scope.pulldown.init();
})
.controller('ProListCtrl', function($scope,$state,$stateParams,Product,NodeInfo,Cart,User) {
	$scope.nodeid=$stateParams.nodeid;
	$scope.prolist="";
	$scope.pulldown = {};
	$scope.pullup = {};
	$scope.pullup.cpage = 1;
	$scope.count="";
	$scope.nodename="";
	Product.list(10,$scope.pullup.cpage,$scope.nodeid,function(data){ //pagesize,cpage,node
		$scope.prolist=JSON.parse(data.result);
		$scope.count=JSON.parse(data.addon).count;
	});
	NodeInfo.Name($scope.nodeid,function(data) {
		$scope.nodename=data;
	});

	$scope.pulldown.init = function () {
		$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		$scope.pullup.cpage=1;
		Product.list(10,$scope.pullup.cpage,$scope.nodeid,function(data){ //pagesize,cpage,node
			$scope.prolist=JSON.parse(data.result);
			$scope.count=JSON.parse(data.addon).count;
			$scope.$broadcast('scroll.refreshComplete');
		});
		$scope.pullup.canbeload = true;
	};
	$scope.pulldown.showspin = false;
	
	//---------------上拉(没有滚动,就没有上拉)
	$scope.pullup.load = function () {
		$scope.pullup.cpage++;
		Product.list(10,$scope.pullup.cpage,$scope.nodeid,function(data){ //pagesize,cpage,node
			$scope.prolist=$scope.prolist.concat(JSON.parse(data.result));
			$scope.$broadcast('scroll.infiniteScrollComplete');
			if($scope.pullup.cpage*10>$scope.count)
				$scope.pullup.canbeload = false;
		});
	};
	//是否启用上拉加载
	$scope.pullup.canbeload = true;
	$scope.pulldown.init();
	$scope.addToCart = function ($item,eve) {
	    Cart.add($item.id, 1, function (data) {
			var obj = eve.target;
			var cart = $('.mobile_cart');
			var imgtodrag = $(obj).parent().find('img').eq(0);
			if (imgtodrag) {
				var imgclone = imgtodrag.clone().offset({
					top: imgtodrag.offset().top,
					left: imgtodrag.offset().left
				}).css({
					'opacity': '1',
					'position': 'absolute',
					'height': '50px',
					'width': '50px',
					'z-index': '100',
					'padding':'0',
					'border':'none',
					'border-radius':'50px'
				}).appendTo($('body')).animate({
					'top': cart.offset().top,
					'left': cart.offset().left,
					'width': 0,
					'height': 0
				}, 1000, 'easeInOutExpo');
				setTimeout(function () {
					cart.effect('shake', { times: 2 }, 200);
				}, 1500);
				imgclone.animate({
					'width': 0,
					'height': 0
				}, function () {
					$(this).detach();
				});
			}

//			console.log($(eve.target))
		});
	};
	$scope.GoToCart = function (){
		$state.go("product.cart", {}, { reload: true });
	};
})
.controller('ProDetailCtrl', function($scope,$state,$stateParams,$ionicPopup,$ionicSlideBoxDelegate,$sce,Cart,Product,User) {
	$scope.proid=$stateParams.proid;
	$scope.pro = {};	
	$scope.pics= [];
	$scope.content="";
	$scope.pronum = 0;
	$scope.proview = {
		likeclass:'ion-ios-star-outline',
		likeactive:'',
		liketext:'赞',
		pubid:0
	};
	$scope.getlogin=User.getlogin();

	Product.isliked(7,52,$scope.proid,function(data){
		if (APIResult.isok(data))
		{
			if(parseInt(data.result)>0)
			{
				$scope.proview.pubid=data.result;
				$scope.proview.likeactive="active";
				$scope.proview.likeclass="ion-ios-star";
				$scope.proview.liketext="已赞";
				$scope.$digest();
			}
		}
	});
	
	Product.info($scope.proid,function(data){
		$scope.pro=data;
		console.log($scope.pro)
		$scope.pics=JSON.parse($scope.pro.pics);
		$scope.content=$sce.trustAsHtml($scope.pro.procontent.replace(/\/UploadFiles\//g,appcfg.server+'UploadFiles/'));
		$scope.$digest();
	});
	$scope.AddToCart = function() {
		if($scope.getlogin&&$scope.getlogin!=null)
		{
			Cart.add($scope.proid, 1, function (data) {
				var offset = $(".mobile_cart").offset();
				console.log(appcfg.server+'UploadFiles/'+$scope.pro.thumbnails)
				var flyer = $('<img class="flyer-img" src='+appcfg.server+'UploadFiles/'+$scope.pro.thumbnails+' />'); // //抛物体对象
				flyer.fly({
					start: {
						left: $(".view").width()*0.9,
						top: $(".view").height()-50 //y需要减去减动条
					},
					end: {
						left: $(".view").width()*0.7,
						top: $(".view").height()-30,
						width: 0, //结束时宽度 
						height: 0 //结束时高度 
					},
					onEnd: function () {
						//$("#tip").show().animate({ width: '200px' }, 300).fadeOut(500);//成功加入购物车动画效果 
						//this.destory();
						flyer.remove();
						$scope.pronum++;
						$scope.$digest();
					}
				});
			});
		}
		else
		{
			$state.go("tab.login", {}, { reload: true });
		}
	};
	$scope.repeatDone = function() {
		$ionicSlideBoxDelegate.update();
	};
	Cart.list(function(data){
		data=data.result;
		for(i=0;i<data.length;i++)
		{
			$scope.pronum += parseInt(data[i].Pronum);
		}
	});
	//商品点赞
	$scope.ProLike=function(){
		if($scope.proview.pubid>0)
		{
			var alertPopup = $ionicPopup.alert({
				title: '提示信息',
				template: '您今天已经赞过该商品了，请明天再来点赞吧！'
			});
			alertPopup.then(function(res) {
				//console.log('Thank you for not eating my delicious ice cream cone');
			});
		}
		else
		{				
			var opts={
				PubTitle:'商品点赞',
				PubContent:'商品点赞',
				PubContentid:$scope.proid
			};
			Product.like(7,52,opts,function(data){
				if (APIResult.isok(data))
				{
					$scope.proview.pubid=data.result;
					$scope.proview.likeactive="active";
					$scope.proview.likeclass="ion-ios-star";
					$scope.proview.liketext="已赞";
					$scope.$digest();
				}
			});
		}
	};
	$scope.ChatFun=function(){
		$state.go("im.chat",{uid:$scope.pro.userid});
	};
})
.controller("CartCtrl", function ($scope,$state, User, Cart, Order, DataCenter,Debug) {
	$scope.pulldown = {};
    $scope.list = []; 
    Cart.list(function (model) {
        $scope.list = model.result;
        angular.forEach($scope.list, function (data, index, arr) {
            data.ischk = true;
        })
        $scope.$digest();
    });
    $scope.newOrder = function () {
        var ids = "";
        angular.forEach($scope.list, function (data, index, arr) {
            if (data.ischk) { ids += data.ID + ","; }
        })
        if (ids == "") { alert("请先选定需要添加的商品"); return false; }
        ids = ids.substring(0, ids.length - 1);
        //DataCenter.set(ids);
        $state.go("product.order", { "ids": ids }, { reload: false });
    }
    $scope.del = function (item) {
        angular.forEach($scope.list, function (d, i, v) {
            if (d.ID == item.ID) { $scope.list.splice(i, 1); }
        })
        Cart.del(item.ID, function (model) {
            console.log("删除成功");
        });
    }
    $scope.clear = function () {
        if ($scope.list.length < 1) { return; }
        var ids = "";
        angular.forEach($scope.list, function (d, i, v) {
            ids += d.ID + ",";
        })
        ids = ids.substring(0, ids.length - 1);
        Cart.del(ids, function (model) {
            console.log("清空成功");
        });
        $scope.list = [];
    }
	
	$scope.pulldown.init = function () {
		$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		Cart.list(function (model) {
			$scope.list = model.result;
			angular.forEach($scope.list, function (data, index, arr) {
				data.ischk = true;
			});
			$scope.$broadcast('scroll.refreshComplete');
			$scope.$digest();
		});
	};
	$scope.pulldown.showspin = false;
	$scope.pulldown.init();
})
.controller("OrderCtrl", function ($scope,$state,$stateParams,$ionicPopup, User, Cart, Order, Address, Pay, DataCenter, Debug) {
    try {
		$scope.paymod={
			hide:true
		}
        $scope.storeList = [];
        $scope.orderMod = { ids: $stateParams.ids,receid:0};//当前订单信息,  
        //$scope.orderMod.ids = "29,30";//need del
        if ($scope.orderMod.ids == "") { Debug.pop("未指定需要支付的商品"); return false; }
        Order.carttoorder($scope.orderMod.ids, function (model) {
            $scope.storeList = model.result;
            angular.forEach($scope.storeList, function (store, v, i) {
                store.fareseled = store.faredt[0];
            })
            model.addon = JSON.parse(model.addon);//money,fare,count
            $scope.getfare();
            $scope.orderMod.count = model.addon.count;
            $scope.orderMod.money = model.addon.money;
            $scope.orderMod.totalMoney = function () {
                return (parseFloat($scope.orderMod.money) + parseFloat($scope.orderMod.fare));
            }
            $scope.$digest();
        });
        //实时计算运费
        $scope.getfare = function () {
            $scope.orderMod.fare = 0;
            angular.forEach($scope.storeList, function (store, v, i) {
                var fare = parseInt(store.fareseled.Total);
                if (fare && fare > 0) { $scope.orderMod.fare += fare; }
            })
        }
        //计算运费,根据其选定值
        $scope.fareChange = function (m) {
            $scope.getfare();
        }
        //------------地址
        $scope.Address = [];
        Address.list(function (model) {
            $scope.Address = model.result;
            if ($scope.Address.length > 0) {
                $scope.orderMod.receid = $scope.Address[0].ID;
            }
        });
        //-----------Begin Pay
        $scope.sendPay = function () {
			$scope.paymod.hide=false;
            //1,提交信息,生成支付单
            Debug.L("pay start");
			if($scope.orderMod.receid>0)
			{
				console.log($scope.orderMod.receid);
			}
			else
			{
				var alertPopup = $ionicPopup.alert({
					title: '提示信息',
					template: '尚未添加地址是否立即前往添加地址'//model.retmsg
				});
				alertPopup.then(function(res) {
					$state.go("user.addrecei", {receid:''}, { reload: true });
				});				
			}
            //预处理一些数据
            $scope.orderMod.fareList = [];
            angular.forEach($scope.storeList, function (store, i, v) {
                $scope.orderMod.fareList.push({ "storeid": store.id, "expid": store.fareseled.ID });
            });
            Order.createpayment($scope.orderMod, function (model) {
                Debug.L("获取返回" + model.result);
                //2,返回支付单号,客户端根据用户所选支付平台,使用支付单号发起支付(默认微信)
                Pay.sendPay("wxpay", model.result, function (data) {
                    //支付成功
					$state.go("tab.login", {}, { reload: true });
                }, function (data) {
					
                    //支付失败
					$state.go("tab.dash", {}, { reload: true });
                });
            });
        };
    } catch (ex) { document.getElementById("err_div").innerText = ex.message; }
})
.controller('ShopCtrl', function($scope,$stateParams,Product) {
	$scope.type=$stateParams.type;
	$scope.shoplist="";
	$scope.pulldown = {};
	$scope.pullup = {};
	$scope.pullup.cpage = 1;
	$scope.count="";

	Product.usershoplist(10,$scope.pullup.cpage,$scope.type,function(data){
		data=JSON.parse(data.result);
		$scope.shoplist=data;
	});

	$scope.pulldown.init = function () {
		$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		$scope.pullup.cpage=1;
		Product.usershoplist(10,$scope.pullup.cpage,$scope.type,function(data){
			$scope.shoplist=JSON.parse(data.result);
			$scope.count=JSON.parse(data.addon).count;
			$scope.$broadcast('scroll.refreshComplete');
		});
		$scope.pullup.canbeload = true;
	};
	$scope.pulldown.showspin = false;
	
	//---------------上拉(没有滚动,就没有上拉)
	$scope.pullup.load = function () {
		$scope.pullup.cpage++;
		Product.usershoplist(10,$scope.pullup.cpage,$scope.type,function(data){ //pagesize,cpage,node
			$scope.shoplist=$scope.shoplist.concat(JSON.parse(data.result));
			$scope.$broadcast('scroll.infiniteScrollComplete');
			if($scope.pullup.cpage*10>$scope.count)
				$scope.pullup.canbeload = false;
		});
	};
	//是否启用上拉加载
	$scope.pullup.canbeload = true;
	$scope.pulldown.init();
})
.controller('ShopDetailCtrl', function($sce,$scope,$stateParams,Product) {
	$scope.shopid=$stateParams.gid;
	$scope.usershop="";
	$scope.userpro = [];
	$scope.pics="";
	$scope.pulldown = {};
	$scope.pullup = {};
	$scope.pullup.cpage = 1;
	$scope.count="";

	Product.usershopdetail($scope.shopid,function(data){
		data=JSON.parse(data.result)[0]
		$scope.pics=JSON.parse(data.pics);
		$scope.usershop=data;
		if(data.videourl==""||data.videourl== null)
			$(".usershop_video").remove();
		else
		{
			$scope.videourl = $sce.trustAsResourceUrl(data.videourl);
			$(".usershop_video").show();
		}
	});
	Product.userprolist($scope.shopid,6,$scope.pullup.cpage,function(data){
		$scope.userpro = data.result;
	});
	
	$scope.pulldown.init = function () {
		$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		$scope.pullup.cpage=1;
		Product.userprolist($scope.shopid,6,$scope.pullup.cpage,function(data){
			$scope.userpro = data.result;
			$scope.count=JSON.parse(data.addon).count;
			$scope.$broadcast('scroll.refreshComplete');
		});
		$scope.pullup.canbeload = true;
	};
	$scope.pulldown.showspin = false;
	
	//---------------上拉(没有滚动,就没有上拉)
	$scope.pullup.load = function () {
		$scope.pullup.cpage++;
		Product.userprolist($scope.shopid,6,$scope.pullup.cpage,function(data){ //pagesize,cpage,node
			$scope.userpro=$scope.userpro.concat(data.result);
			console.log($scope.pullup.cpage)
			$scope.$broadcast('scroll.infiniteScrollComplete');
			if($scope.pullup.cpage*6>$scope.count)
				$scope.pullup.canbeload = false;
		});
	};
	//是否启用上拉加载
	$scope.pullup.canbeload = true;
	$scope.pulldown.init();

})
.controller('NearbyCtrl', function($scope,$stateParams,User) {
	$scope.mapmarket="";
	$scope.userlist=[];
	$scope.pulldown = {};
	$scope.pullup = {};
	$scope.pullup.cpage = 1;
	$scope.count="";
	$scope.usergroup=["普通会员","商家会员"];
	
	var geoc = new BMap.Geocoder();  
	var map = new BMap.Map();
	var geolocation = new BMap.Geolocation();
	
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS)
		{
			var mypoint = new BMap.Point(r.point.lng,r.point.lat);		
			geoc.getLocation(mypoint, function(rs){
				var addComp = rs.addressComponents;
				$scope.mapmarket=addComp;
				console.log(addComp)
				$scope.$digest();
			});
		}
	});
	User.list(10,$scope.pullup.cpage,function(data){
		$scope.userlist=data.result;
	});
	$scope.pulldown.init = function () {
		$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		$scope.pullup.cpage=1;
		User.list(10,$scope.pullup.cpage,function(data){
			$scope.userlist = data.result;
			$scope.count=JSON.parse(data.addon).count;
			$scope.$broadcast('scroll.refreshComplete');
		});
		$scope.pullup.canbeload = true;
	};
	$scope.pulldown.showspin = false;
	
	//---------------上拉(没有滚动,就没有上拉)
	$scope.pullup.load = function () {
		$scope.pullup.cpage++;
		User.list(10,$scope.pullup.cpage,function(data){ //pagesize,cpage,node
			$scope.userlist=$scope.userlist.concat(data.result);
			$scope.$broadcast('scroll.infiniteScrollComplete');
			if($scope.pullup.cpage*10>$scope.count)
				$scope.pullup.canbeload = false;
		});
	};
	//是否启用上拉加载
	$scope.pullup.canbeload = true;
	$scope.pulldown.init();
})
.controller('NewsIndexCtrl', function($sce,$scope,$stateParams,News,NodeInfo) {
	$scope.nodeid=$stateParams.nodeid;
	$scope.nodename="";
	$scope.articlelist=[];
	$scope.pulldown = {};
	$scope.pullup = {};
	$scope.pullup.cpage = 1;
	$scope.count="";
	
	News.list($scope.nodeid,10,$scope.pullup.cpage,function(data){
		$scope.articlelist=data.result;
		console.log(data.result)
	});
	
	NodeInfo.Name($scope.nodeid,function(data) {
		$scope.nodename=data;
	});

	$scope.pulldown.init = function () {
		$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		$scope.pullup.cpage=1;
		News.list($scope.nodeid,10,$scope.pullup.cpage,function(data){
			$scope.articlelist = data.result;
			$scope.count=JSON.parse(data.addon).count;
			$scope.$broadcast('scroll.refreshComplete');
		});
		$scope.pullup.canbeload = true;
	};
	$scope.pulldown.showspin = false;
	
	//---------------上拉(没有滚动,就没有上拉)
	$scope.pullup.load = function () {
		$scope.pullup.cpage++;
		News.list($scope.nodeid,10,$scope.pullup.cpage,function(data){ //pagesize,cpage,node
			$scope.articlelist=$scope.articlelist.concat(data.result);
			$scope.$broadcast('scroll.infiniteScrollComplete');
			if($scope.pullup.cpage*10>$scope.count)
				$scope.pullup.canbeload = false;
		});
	};
	//是否启用上拉加载
	$scope.pullup.canbeload = true;
	$scope.pulldown.init();
})
.controller('NewsContentCtrl', function($sce,$scope,$stateParams,News,NodeInfo) {
	$scope.generalid=$stateParams.generalid;
	$scope.nodename="";
	$scope.article={};
	News.getcontent($scope.generalid,function(data){
		data=JSON.parse(data.result)[0];
		$scope.article=data;
		$scope.article.content=$sce.trustAsHtml($scope.article.content.replace(/\/UploadFiles\//g,appcfg.server+'UploadFiles/'));
		NodeInfo.Name($scope.article.nodeid,function(data) {
			$scope.nodename=data;
		});
	});
})
.controller('NewsCourierCtrl', function($sce,$scope,$stateParams,News,NodeInfo) {
	$scope.nodeid=$stateParams.nodeid;
	$scope.nodename="";
	$scope.courierlist=[];
	$scope.pulldown = {};
	$scope.pullup = {};
	$scope.pullup.cpage = 1;
	$scope.count="";
	
	News.courierlist(16,10,1,function(data){
		$scope.courierlist=data.result;
	});
	
	NodeInfo.Name($scope.nodeid,function(data) {
		$scope.nodename=data;
	});

	$scope.pulldown.init = function () {
		$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		$scope.pullup.cpage=1;
		News.courierlist($scope.nodeid,10,$scope.pullup.cpage,function(data){
			$scope.courierlist = data.result;
			$scope.count=JSON.parse(data.addon).count;
			$scope.$broadcast('scroll.refreshComplete');
		});
		$scope.pullup.canbeload = true;
	};
	$scope.pulldown.showspin = false;
	
	//---------------上拉(没有滚动,就没有上拉)
	$scope.pullup.load = function () {
		$scope.pullup.cpage++;
		News.courierlist($scope.nodeid,10,$scope.pullup.cpage,function(data){ //pagesize,cpage,node
			$scope.courierlist=$scope.courierlist.concat(data.result);
			$scope.$broadcast('scroll.infiniteScrollComplete');
			if($scope.pullup.cpage*10>$scope.count)
				$scope.pullup.canbeload = false;
		});
	};
	//是否启用上拉加载
	$scope.pullup.canbeload = true;
	$scope.pulldown.init();
})
.controller('NewsVideoCtrl', function($sce,$scope,$stateParams,News,NodeInfo) {
	$scope.nodeid=$stateParams.nodeid;
	$scope.nodename="";
	$scope.courierlist=[];
	$scope.pulldown = {};
	$scope.pullup = {};
	$scope.pullup.cpage = 1;
	$scope.count="";
	
	NodeInfo.Name($scope.nodeid,function(data) {
		$scope.nodename=data;
	});
	
	News.videolist($scope.nodeid,10,$scope.pullup.cpage,function(data){
		$scope.articlelist=data.result;
	});
	
	$scope.pulldown.init = function () {
		$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		$scope.pullup.cpage=1;
		News.videolist($scope.nodeid,10,$scope.pullup.cpage,function(data){
			$scope.articlelist = data.result;
			$scope.count=JSON.parse(data.addon).count;
			$scope.$broadcast('scroll.refreshComplete');
		});
		$scope.pullup.canbeload = true;
	};
	$scope.pulldown.showspin = false;
	
	//---------------上拉(没有滚动,就没有上拉)
	$scope.pullup.load = function () {
		$scope.pullup.cpage++;
		News.videolist($scope.nodeid,10,$scope.pullup.cpage,function(data){ //pagesize,cpage,node
			$scope.articlelist=$scope.articlelist.concat(data.result);
			$scope.$broadcast('scroll.infiniteScrollComplete');
			if($scope.pullup.cpage*10>$scope.count)
				$scope.pullup.canbeload = false;
		});
	};
	//是否启用上拉加载
	$scope.pullup.canbeload = true;
	$scope.pulldown.init();
})
.controller('NewsVideoContCtrl', function($sce,$scope,$stateParams,News,NodeInfo) {
	$scope.generalid=$stateParams.generalid;
	$scope.nodename="";
	$scope.article={};
	News.getvideocont($scope.generalid,function(data){
		data=JSON.parse(data.result)[0];
		$scope.article=data;
		$scope.article.content=$sce.trustAsHtml($scope.article.content.replace(/\/UploadFiles\//g,appcfg.server+'UploadFiles/'));
		$scope.article.url=$sce.trustAsResourceUrl(appcfg.server+$scope.article.url);
		NodeInfo.Name($scope.article.nodeid,function(data) {
			$scope.nodename=data;
		});
	});
})
.controller('UserLoginCtrl', function($sce,$scope,$stateParams,$ionicPopup,User) {
	$scope.title="会员登录";
	$scope.userinfo = User.getlogin();
	$scope.show = {
		showuser:false
	};
	if($scope.userinfo!=null)
	{
		$scope.show.showuser=true;
		$scope.title="账号信息";
	}

	$scope.loginuser={name:'',pwd:''};
	$scope.loginfun=function(){
		User.login($scope.loginuser.name,$scope.loginuser.pwd,function(data){
			var model = data;
			if (APIResult.isok(model))
			{
				console.log(model)
				if(model.result.UserID>0)
				{
					$scope.userinfo=model.result;
					$scope.show.showuser=true;
					$scope.$digest();
				}
				//openid = model.result.OpenID;
			}
			else
			{
				var alertPopup = $ionicPopup.alert({
					title: '提示信息',
					template: '账号或密码错误'//model.retmsg
				});
				alertPopup.then(function(res) {
					console.log('Thank you for not eating my delicious ice cream cone');
				});
				console.log("出错:" + model.retmsg);
			}
		});
		//$scope.loginuser.name="admin8888";
	};
	$scope.loginout = function(){
		User.logout();
		$scope.show.showuser=false;
	}
})
.controller('UserInfo', function($scope,$ionicPopup,$state,User) {
	$scope.userinfo={};
	if(localStorage.getItem("openid")&&localStorage.getItem("openid")!="")
	{
		User.getlogin(localStorage.getItem("openid"),function(data){
			var model = APIResult.getModel(data);
			if (APIResult.isok(model))
			{
				$scope.userinfo=model.result;
			}
		});
	}
})
.controller('UserOrder', function($scope,$ionicPopup,$state,User,Order) {
	$scope.orderlist={};
	$scope.pulldown = {};
	$scope.pullup = {};
	$scope.pullup.cpage = 1;
	$scope.count="";
	
	Order.list({ cpage: $scope.pullup.cpage, psize: 10 ,withpro: true }, function (model) {
        $scope.orderlist = model.result;
		$scope.count=model.page.itemCount;
		for(i=0;i<$scope.orderlist.length;i++)
		{
			$scope.orderlist[i].ProList=JSON.parse($scope.orderlist[i].ProList)
		}
    });

	$scope.pulldown.init = function () {
		$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		$scope.pullup.cpage=1;
		Order.list({ cpage: $scope.pullup.cpage, psize: 10 ,withpro: true }, function (model) {
			$scope.orderlist = model.result;
			for(i=0;i<$scope.orderlist.length;i++)
			{
				$scope.orderlist[i].ProList=JSON.parse($scope.orderlist[i].ProList)
			}
			$scope.count=model.page.itemCount;
			$scope.$broadcast('scroll.refreshComplete');
		});
		$scope.pullup.canbeload = true;
	};
	$scope.pulldown.showspin = false;
	
	//---------------上拉(没有滚动,就没有上拉)
	$scope.pullup.load = function () {
		$scope.pullup.cpage++;
		Order.list({ cpage: $scope.pullup.cpage, psize: 10 ,withpro: true }, function (model) {
			$scope.orderlist=$scope.orderlist.concat(model.result);
			for(i=0;i<$scope.orderlist.length;i++)
			{
				$scope.orderlist[i].ProList=JSON.parse($scope.orderlist[i].ProList)
			}
			$scope.$broadcast('scroll.infiniteScrollComplete');
			if($scope.pullup.cpage*10>$scope.count)
				$scope.pullup.canbeload = false;
		});
	};
	//是否启用上拉加载
	$scope.pullup.canbeload = true;
	$scope.pulldown.init();
})
.controller('UserOrderInfo', function($scope,$stateParams,$ionicPopup,$state,User) {
	
})
.controller('PayListCtrl', function($scope){
	$scope.city="<i class='fa fa-spinner fa-spin'></i>";
	//根据GPS获取当前位置信息
	var geoc = new BMap.Geocoder();  
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS)
		{
			var mypoint = new BMap.Point(r.point.lng,r.point.lat);
			geoc.getLocation(mypoint, function(rs){
				var addComp = rs.addressComponents;
				console.log(addComp);
				$scope.city=addComp.city;
				$scope.$digest();
				//$(".mycity").html(addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber);
			});
		}
	});
})
.controller('WaterPayCtrl', function($scope,Grade,$stateParams,$ionicPopup,YiSai){
	$scope.paymod = {account:'69240005',proid:'',hide:true,loadtext:'查询欠费记录...'};
	$scope.nodeid=$stateParams.nodeid;
	if($scope.nodeid=="17")
		$scope.title="水费缴费";
	else if($scope.nodeid=="18")
		$scope.title="电费缴费";
	else if($scope.nodeid=="19")
		$scope.title="燃气费缴费";
	Grade.list(1,1,0,function(data){
		var str="";
		data=data.result;
		for(var i=0;i<data.length;i++)
		{
			str+="<option value=\""+data[i].gradeid+"\">"+data[i].gradename+"</option>";
		}
		$("#sheng_sel").html("<option value=''>请选择省份</option>"+str);
	});
	$("#sheng_sel").change(function(){
		$("#danwei_sel").html("<option value=''>请选择缴费单位</option>");
		var parentid=$(this).val();
		Grade.list(1,2,parentid,function(data){
			data=data.result;
			var str="";
			for(var i=0;i<data.length;i++)
			{
				str+="<option value=\""+data[i].gradeid+"\">"+data[i].gradename+"</option>";
			}
			$("#shi_sel").html("<option value=''>请选择城市</option>"+str);
		})
	});
	$("#shi_sel").change(function(){
		var area=$("#sheng_sel option:selected").text()+"|"+$("#shi_sel option:selected").text();
		Grade.sdmlist($scope.nodeid,area,function(data){
			data=data.result;
			var str="";
			for(var i=0;i<data.length;i++)
			{
				str+="<option value=\""+data[i].pronum+"\">"+data[i].company+"</option>";
			}
			$("#danwei_sel").html("<option value=''>请选择缴费单位</option>"+str);
		});
	});
	$scope.lifepayfun=function(){
		if($scope.paymod.proid==""||$scope.paymod.account=="")
		{
			var alertPopup = $ionicPopup.alert({
				title: '提示信息',
				template: '请先选择缴费单位，填写用户账号后再进行缴费！'
			});
			alertPopup.then(function(res) {
				//console.log('Thank you for not eating my delicious ice cream cone');
			});
		}
		else
		{
			$scope.paymod.hide=false;
			YiSai.query($scope.paymod.account,$scope.paymod.proid,function(data){
				if (APIResult.isok(data))
				{
					data=data.result;
					if (parseFloat(data.money) < 1)
					{
						$scope.paymod.hide=true;
						var alertPopup = $ionicPopup.alert({
							title: '提示信息',
							template: '你没有欠费,不需要支付'
						});
						alertPopup.then(function(res) {
							//console.log('Thank you for not eating my delicious ice cream cone');
						});
					}
					else
					{
						$scope.paymod.loadtext="正在生成订单...";
						YiSai.neworder(function(data){
							if (APIResult.isok(data))
							{
								//2,返回支付单号,客户端根据用户所选支付平台,使用支付单号发起支付(默认微信)
								Pay.sendPay("wxpay", data.result, function (data) {
									//支付成功
									$state.go("tab.login", {}, { reload: true });
								}, function (data) {
									//支付失败
									$state.go("tab.dash", {}, { reload: true });
								});
							}
							else
							{
								$scope.paymod.hide=true;
								var alertPopup = $ionicPopup.alert({
									title: '提示信息',
									template: data.retmsg
								});
								alertPopup.then(function(res) {
									//console.log('Thank you for not eating my delicious ice cream cone');
								});
							}
						});
					}
				}
				else
				{
					$scope.paymod.hide=true;
					var alertPopup = $ionicPopup.alert({
						title: '提示信息',
						template: data.retmsg
					});
					alertPopup.then(function(res) {
						//console.log('Thank you for not eating my delicious ice cream cone');
					});
				}
			});
		}
	};

})
.controller('BillPayCtrl', function($scope,$stateParams,$ionicPopup,Grade,YiSai,Pay){
	$scope.paymod={
		proid:'',
		phone:'',
		hide:true,
		loadtext:'正在生成订单...'
	}
	Grade.huafeilist(function(data){
		var str="";
		data=data.result;
		for(var i=0;i<data.length;i++)
		{
			str+="<option value=\""+data[i].pronum+"\">"+data[i].title+"</option>";
		}
		$("#huafei_sel").html("<option value=''>请选择要缴费的金额</option>"+str);
	});
	$scope.BillPay=function(){
		console.log($scope.paymod)
		if(!ZL_Regex.isMobilePhone($scope.paymod.phone)||ZL_Regex.isEmpty($scope.paymod.proid))
		{
			var alertPopup = $ionicPopup.alert({
				title: '提示信息',
				template: '请选择充值金额并填写正确的手机号后再进行充值！'
			});
			alertPopup.then(function(res) {
				//console.log('Thank you for not eating my delicious ice cream cone');
			});
		}
		else
		{
			$scope.paymod.hide=false;
			YiSai.phoneneworder($scope.paymod.phone,$scope.paymod.proid,function(data){
				if (APIResult.isok(data))
				{
					console.log(data);
					//2,返回支付单号,客户端根据用户所选支付平台,使用支付单号发起支付(默认微信)
					Pay.sendPay("wxpay", data.result, function (data) {
	                    //支付成功
						$state.go("tab.login", {}, { reload: true });
					}, function (data) {
						//支付失败
						$state.go("tab.dash", {}, { reload: true });
					});
				}
				else
				{
					$scope.paymod.hide=true;
					var alertPopup = $ionicPopup.alert({
						title: '提示信息',
						template: data.retmsg
					});
					alertPopup.then(function(res) {
						//console.log('Thank you for not eating my delicious ice cream cone');
					});
				}
			});
		}
	};
})
.controller('TrafficPayCtrl', function($scope,$ionicPopup,$stateParams,Pay,YiSai,Grade){
	$scope.paymod={
		proid:'',
		money:0,
		phone:'',
		hide:true
	}	
	$scope.area=["全国","北京","上海","天津","重庆","江苏","浙江","广东","海南","福建","山东","江西","四川","安徽","河北","河南","湖北","湖南","陕西","山西","黑龙江","辽宁","吉林","广西","云南","贵州","甘肃","内蒙古","宁夏","西藏","新疆","青海"];
	$("#yys_sel").change(function(e){
		$scope.money=0;
		$scope.$digest();
		$("#liuliang_sel").html("<option value=''>请选择流量包</option>");
		var nodeid=$(this).val();
		if(nodeid=="23"||nodeid=="24"||nodeid=="25")
		{
			$("#area_sel").html("<option value=''>请选择地区</option><option value='全国'>全国</option>");
		}
		else
		{
			var str="";
			for(var i=1;i<$scope.area.length;i++)
			{
				str+="<option value=\""+$scope.area[i]+"\">"+$scope.area[i]+"</option>";
			}
			$("#area_sel").html("<option value=''>请选择地区</option>"+str);
		}
	});
	$("#area_sel").change(function(){
		var nodeid=$("#yys_sel").val();
		var area=$(this).val();
		Grade.liulist(nodeid,area,function(data){
			data=data.result;
			var str="";
			for(var i=0;i<data.length;i++)
			{
				str+="<option value=\""+data[i].pronum+"\" data-money=\""+data[i].money+"\">"+data[i].title+"</option>";
			}
			$("#liuliang_sel").html("<option value=''>请选择流量包</option>"+str);
		});
	});
	$("#liuliang_sel").change(function(){
		$scope.paymod.money=$("#liuliang_sel option:selected").data("money");
		$scope.$digest();
	});
	$scope.FlowPay=function(){
		if(ZL_Regex.isEmpty($scope.paymod.proid)||!ZL_Regex.isMobilePhone($scope.paymod.phone))
		{
			var alertPopup = $ionicPopup.alert({
				title: '提示信息',
				template: '请选择流量包并填写正确的手机号后再进行充值！'
			});
			alertPopup.then(function(res) {
				//console.log('Thank you for not eating my delicious ice cream cone');
			});
		}
		else
		{
			$scope.paymod.hide=false;
			YiSai.flowneworder($scope.paymod.proid,$scope.paymod.phone,function(data){
				if (APIResult.isok(data))
				{
					//2,返回支付单号,客户端根据用户所选支付平台,使用支付单号发起支付(默认微信)
					Pay.sendPay("wxpay", data.result, function (data) {
	                    //支付成功
						$state.go("tab.login", {}, { reload: true });
					}, function (data) {
						//支付失败
						$state.go("tab.dash", {}, { reload: true });
					});
				}
				else
				{
					$scope.paymod.hide=true;
					var alertPopup = $ionicPopup.alert({
						title: '提示信息',
						template: data.retmsg
					});
					alertPopup.then(function(res) {
						//console.log('Thank you for not eating my delicious ice cream cone');
					});
				}
			});
		}
	};
})
.controller("IMChatCtrl", function ($scope,$state,$stateParams,$filter,$ionicPopup,User,ChatIM) {
	$scope.pulldown = {};
	$scope.count="";
	$scope.LastMsgTime = Math.round(new Date().getTime() / 1000);
	$scope.tmu = {};
	//后期优化为该页面长久存在,避免每次使用均登录
    var uid = $stateParams.uid;
    var mu = User.getlogin();
	if(mu&&mu!=null)
	{
		//获取对方用户信息
		ChatIM.getuser(uid,mu.openid,function (model) {
			$scope.tmu = model;
			console.log(model)
			selToID = model.imid;
			friendHeadUrl = appcfg.server + model.userface;
			//success Object {ActionStatus: "OK", ErrorInfo: "init success", identifierNick: "test"}
			ChatIM.login(mu, function (data) {
				console.log("success", data); 
				ChatIM.gethistory($scope.tmu.honeyname,15,$scope.LastMsgTime,"",function(data){
				$scope.LastMsgTime=data.LastMsgTime;
				if(data.MsgList.length>0)
				{
					var str = "";
					for(var i=0;i<data.MsgList.length;i++)
					{	
						if(data.MsgList[i].isSend)
						{
							str+='<div class="onemsg_wrap self"><div class="msghead"><span>'+$filter("date")(data.MsgList[i].time*1000, "yyyy-MM-dd HH:mm:ss")+'</span></div><div class="onemsg_contain"><div class="onemsg"><div class="msgbody"><div>'+convertMsgtoHtml(data.MsgList[i])+'</div></div><span class="arrow-before arrow"></span><span class="arrow-after arrow"></span></div><img src="'+appcfg.server+mu.UserFace+'" class="uface" alt="'+mu.UserName+'" onerror="javascript:this.src=\'img/noface.png\';"><div class="clearfix"></div></div></div>'
						}
						else
						{
							str+='<div class="onemsg_wrap"><div class="msghead"><span>'+$filter("date")(data.MsgList[i].time*1000, "yyyy-MM-dd HH:mm:ss")+'</span></div><div class="onemsg_contain"><div class="onemsg"><div class="msgbody"><div>'+convertMsgtoHtml(data.MsgList[i])+'</div></div><span class="arrow-before arrow"></span><span class="arrow-after arrow"></span></div><img src="'+friendHeadUrl+'" class="uface" alt="'+mu.UserName+'" onerror="javascript:this.src=\'img/noface.png\';"><div class="clearfix"></div></div></div>'
						}
					}
					
					$(".msgflow").prepend(str);
					$(".scroll-content").scrollTop($(".msgflow").height());
				}
			},function(data){});
			}, function (data){
				console.log("failed", data);
			});
			$scope.$digest();
		});
	}
	else
	{
		$state.go("tab.login", {}, { reload: true });
	}
	$scope.pulldown.init = function () {
	$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		ChatIM.gethistory($scope.tmu.honeyname,15,$scope.LastMsgTime,"",function(data){
			$scope.LastMsgTime=data.LastMsgTime;
			if(data.MsgList.length>0)
			{
				var str = "";
				for(var i=0;i<data.MsgList.length;i++)
				{
					
					if(data.MsgList[i].isSend)
					{
						str+='<div class="onemsg_wrap self"><div class="msghead"><span>'+$filter("date")(data.MsgList[i].time*1000, "yyyy-MM-dd HH:mm:ss")+'</span></div><div class="onemsg_contain"><div class="onemsg"><div class="msgbody"><div>'+convertMsgtoHtml(data.MsgList[i])+'</div></div><span class="arrow-before arrow"></span><span class="arrow-after arrow"></span></div><img src="'+appcfg.server+mu.UserFace+'" class="uface" alt="'+mu.UserName+'" onerror="javascript:this.src=\'img/noface.png\';"><div class="clearfix"></div></div></div>'
					}
					else
					{
						str+='<div class="onemsg_wrap"><div class="msghead"><span>'+$filter("date")(data.MsgList[i].time*1000, "yyyy-MM-dd HH:mm:ss")+'</span></div><div class="onemsg_contain"><div class="onemsg"><div class="msgbody"><div>'+convertMsgtoHtml(data.MsgList[i])+'</div></div><span class="arrow-before arrow"></span><span class="arrow-after arrow"></span></div><img src="'+friendHeadUrl+'" class="uface" alt="'+mu.UserName+'" onerror="javascript:this.src=\'img/noface.png\';"><div class="clearfix"></div></div></div>'
					}
				}
				$(".msgflow").prepend(str);
			}
			else
			{
				
			}
		},function(data){});
		$scope.$broadcast('scroll.refreshComplete');
	};
	$scope.pulldown.showspin = false;
			
	//是否启用上拉加载
	$scope.pulldown.init();
})
.controller("AddReceiCtrl", function ($scope,$state,$stateParams,$ionicPopup,User,Address) {
	$scope.receid=$stateParams.receid;
	$scope.receiv={
		ReceivName:'',
		Street:'',
		Zipcode:'',
		phone:'',
		MobileNum:'',
		Email:'',
		province:'',
		city:'',
		county:''
	}
	if($scope.receid!=""&&parseInt($scope.receid)>0)
	{
		Address.get($scope.receid,function(data){
			if(APIResult.isok(data))
			{
				data=data.result;
				$scope.receiv.ReceivName=data.ReceivName;
				$scope.receiv.Street=data.Street;
				$scope.receiv.Zipcode=data.Zipcode;
				$scope.receiv.phone=data.phone;
				$scope.receiv.MobileNum=data.MobileNum;
				$scope.receiv.Email=data.Email;
				if(data.Provinces!="")
				{
					var pstr=data.Provinces.split(' ');
					pcc.SetDef(pstr[0],pstr[1],pstr[2]);
					pcc.ProvinceInit();
				}
			}
		});
	}
	$scope.Addreceiv=function(){
		if($scope.receiv.ReceivName=="")
		{
			var alertPopup = $ionicPopup.alert({
				title: '提示信息',
				template: '收件人不能为空！'
			});
			alertPopup.then(function(res) {
				//console.log('Thank you for not eating my delicious ice cream cone');
			});
		}
		else if($("#province").val()==""||$("#city").val()==""||$("#conuty").val()=="")
		{
			var alertPopup = $ionicPopup.alert({
				title: '提示信息',
				template: '地区不能为空！'
			});
			alertPopup.then(function(res) {
				//console.log('Thank you for not eating my delicious ice cream cone');
			});
		}
		else if($scope.receiv.Street=="")
		{
			var alertPopup = $ionicPopup.alert({
				title: '提示信息',
				template: '详细地址不能为空！'
			});
			alertPopup.then(function(res) {
				//console.log('Thank you for not eating my delicious ice cream cone');
			});
		}
		else if(!ZL_Regex.isMobilePhone($scope.receiv.MobileNum))
		{
			var alertPopup = $ionicPopup.alert({
				title: '提示信息',
				template: '手机输入不正确！'
			});
			alertPopup.then(function(res) {
				//console.log('Thank you for not eating my delicious ice cream cone');
			});
		}
		else
		{
			
			if($scope.receid!=""&&parseInt($scope.receid)>0)
			{
				$scope.opts={
					ID:$scope.receid,
					ReceivName:$scope.receiv.ReceivName,
					Street:$scope.receiv.Street,
					Zipcode:$scope.receiv.Zipcode,
					phone:$scope.receiv.phone,
					MobileNum:$scope.receiv.MobileNum,
					Email:$scope.receiv.Email,
					Provinces:$("#province").val()+" "+$("#city").val()+" "+$("#county").val()
				}
				Address.edit($scope.opts,function(data){
					if (APIResult.isok(data))
					{
						var alertPopup = $ionicPopup.alert({
							title: '提示信息',
							template: '修改成功！'
						});
						alertPopup.then(function(res) {
							$state.go("user.receilist", {receid:''}, { reload: true });
						});
					}
					else
					{
						var alertPopup = $ionicPopup.alert({
							title: '提示信息',
							template: '修改失败！'
						});
						alertPopup.then(function(res) {
							$state.go("user.receilist", {receid:''}, { reload: true });
						});
					}
				});
			}
			else
			{
				$scope.opts={
					ReceivName:$scope.receiv.ReceivName,
					Street:$scope.receiv.Street,
					Zipcode:$scope.receiv.Zipcode,
					phone:$scope.receiv.phone,
					MobileNum:$scope.receiv.MobileNum,
					Email:$scope.receiv.Email,
					Provinces:$("#province").val()+" "+$("#city").val()+" "+$("#county").val()
				}
				Address.add($scope.opts,function(data){
					if (APIResult.isok(data))
					{
						var alertPopup = $ionicPopup.alert({
							title: '提示信息',
							template: '添加成功！'
						});
						alertPopup.then(function(res) {
							$state.go("user.receilist", {receid:''}, { reload: true });
							//console.log('Thank you for not eating my delicious ice cream cone');
						});
					}
					else
					{
						var alertPopup = $ionicPopup.alert({
							title: '提示信息',
							template: '添加失败！'
						});
						alertPopup.then(function(res) {
							$state.go("user.receilist", {receid:''}, { reload: true });
							//console.log('Thank you for not eating my delicious ice cream cone');
						});
					}
				});				
			}

		}
	}
})
.controller("ReceiListCtrl", function ($scope,$state,$stateParams,$ionicPopup,User,Address) {
	$scope.receilist={};
	$scope.pulldown = {};
	
	Address.list(function(data){ //pagesize,cpage,node
		if (APIResult.isok(data)){
			console.log(data.result)
			$scope.receilist=data.result;	
		}
	});
	
	$scope.pulldown.init = function () {
		$scope.$broadcast('scroll.refreshComplete');
		//下拉兼容处理(用于兼容在Android 4.4.x版本中ionic下拉插件无法滚动bug)
		var x = 0;
		$(".scroll-content").on('touchstart', function (e) {
			x = e.originalEvent.targetTouches[0].pageX;
			var scrolldiv = null;
			$("*").each(function () {
				if ($(this).scrollTop() > 0) {
					scrolldiv = $(this)[0];
					return false;
				}
			});
			if (scrolldiv==null) {
				$(".scroll-content").scrollTop(1);
			}
		});
	};
	
	//下拉处理(刷新当前页|将前8条数据替换为最新数据)
	$scope.pulldown.refresh = function () {
		$scope.pulldown.showspin = true;
		Address.list(function(data){ //pagesize,cpage,node
			$scope.receilist=data.result;
			$scope.$broadcast('scroll.refreshComplete');
		});
	};
	$scope.pulldown.showspin = false;
	
	$scope.edit=function(titem){
		$state.go("user.addrecei", {receid:titem.ID}, { reload: true });
	}
	$scope.del=function(titem){
		var confirmPopup = $ionicPopup.confirm({
			title: '确认信息',
			template: '是否确认删除?'
		});
		confirmPopup.then(function(res) {
			if(res) {
				Address.del(titem.ID,function(data){
					if (APIResult.isok(data)){
						var alertPopup = $ionicPopup.alert({
							title: '提示信息',
							template: '删除成功！'
						});
						alertPopup.then(function(res) {
							Address.list(function(data){ //pagesize,cpage,node
								if (APIResult.isok(data)){
									console.log(data.result)
									$scope.receilist=data.result;	
								}
							});
						});
					}
					else
					{
						var alertPopup = $ionicPopup.alert({
							title: '提示信息',
							template: '删除失败！'
						});
						alertPopup.then(function(res) {
							Address.list(function(data){ //pagesize,cpage,node
								if (APIResult.isok(data)){
									console.log(data.result)
									$scope.receilist=data.result;	
								}
							});

						});	
					}
				})
			}
		});
	}
	$scope.AddFun=function(){
		$state.go("user.addrecei", {receid:''}, { reload: true });
	}
});