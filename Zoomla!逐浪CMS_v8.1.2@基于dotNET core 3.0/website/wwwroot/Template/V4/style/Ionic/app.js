// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.services' is found in services.js
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'starter.controllers', 'starter.services'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);
    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
	if (window.cordova && window.cordova.InAppBrowser) {
        window.open = window.cordova.InAppBrowser.open;
      }
  });
})

.config(function($stateProvider, $urlRouterProvider,$ionicConfigProvider) {
	
	$ionicConfigProvider.platform.ios.tabs.style('standard'); 
	$ionicConfigProvider.platform.ios.tabs.position('bottom');
	$ionicConfigProvider.platform.android.tabs.style('standard');
	$ionicConfigProvider.platform.android.tabs.position('standard');
	$ionicConfigProvider.platform.ios.navBar.alignTitle('center'); 
	$ionicConfigProvider.platform.android.navBar.alignTitle('left');
	$ionicConfigProvider.platform.ios.backButton.previousTitleText('').icon('ion-ios-arrow-thin-left');
	$ionicConfigProvider.platform.android.backButton.previousTitleText('').icon('ion-android-arrow-back');        
	$ionicConfigProvider.platform.ios.views.transition('ios'); 
	$ionicConfigProvider.platform.android.views.transition('android');


  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider

  // setup an abstract state for the tabs directive
    .state('tab', {
    url: '/tab',
    abstract: true,
    templateUrl: 'Template/V4/views/tabs.html'
  })

  // Each tab has its own nav history stack:

.state('tab.dash', {
url: '/dash',
views: {
  'tab-dash': {
	templateUrl: 'Template/V4/views/tab-dash.html',
	controller: 'DashCtrl'
  }
}
})
.state('tab.selcity', {
  url: '/selcity',
  views: {
	'tab-dash': {
	  templateUrl: 'Template/V4/views/tab-selcity.html',
	  controller: 'DiscountCtrl'
	}
  }
})
.state('tab.discount', {
  url: '/discount',
  views: {
	'tab-discount': {
	  templateUrl: 'Template/V4/views/tab-discount.html',
	  controller: 'DiscountCtrl'
	}
  }
})
.state('tab.account', {
url: '/account',
views: {
  'tab-account': {
	templateUrl: 'Template/V4/views/tab-account.html',
	controller: 'AccountCtrl'
  }
}
})
.state('product', {
    url: '/product',
    abstract: true,
    templateUrl: 'Template/V4/views/product/tabs.html'
})
.state('product.detail', {
    url: '/detail/:proid',
    views: {
        'product-view': {
            templateUrl: 'Template/V4/views/product/detail.html',
            controller: 'ProDetailCtrl'
        }
    }
})
.state('product.list', {
    url: '/list/:nodeid',
      views: {
          'product-view': {
              templateUrl: 'Template/V4/views/product/list.html',
              controller: 'ProListCtrl'
          }
      }
})
.state('product.searchlist', {
    url: '/searchlist/:proname',
      views: {
          'product-view': {
              templateUrl: 'Template/V4/views/product/searchlist.html',
              controller: 'SearchListCtrl'
          }
      }
})
.state("product.cart", {
    url: "/cart",
    views: {
        "product-view": {
            templateUrl: 'Template/V4/views/product/cart.html',
			cache:'false',
            controller: 'CartCtrl'
        }
    }
})
.state("product.order", {
    url: "/order/:ids",
    views: {
        "product-view": {
            templateUrl: 'Template/V4/views/product/order.html',
            controller: 'OrderCtrl'
        }
    }
})
.state('shop', {
    url: '/shop',
    abstract: true,
    templateUrl: 'Template/V4/views/shop/tabs.html'
})
.state('shop.list', {
    url: '/list/:type',
      views: {
          'shop-view': {
              templateUrl: 'Template/V4/views/shop/list.html',
              controller: 'ShopCtrl'
          }
      }
})
.state('shop.detail', {
    url: '/detail/:gid',
      views: {
          'shop-view': {
              templateUrl: 'Template/V4/views/shop/detail.html',
              controller: 'ShopDetailCtrl'
          }
      }
})
.state('user', {
	url: '/user',
	abstract: true,
	templateUrl: 'Template/V4/views/user/tabs.html'
})
.state('user.orderlist', {
	url: '/orderlist',
	views: {
	  'user-view': {
		templateUrl: 'Template/V4/views/user/orderlist.html',
		controller: 'UserOrder'
	  }
	}
})
.state('user.orderinfo', {
	url: '/orderinfo/:orderid',
	views: {
	  'user-view': {
		templateUrl: 'Template/V4/views/user/orderinfo.html',
		controller: 'UserOrderInfo'
	  }
	}
})
.state('user.addrecei', {
	url: '/addrecei/:receid',
	views: {
	  'user-view': {
		templateUrl: 'Template/V4/views/user/addrecei.html',
		controller: 'AddReceiCtrl'
	  }
	}
})
.state('user.receilist', {
	url: '/receilist',
	views: {
	  'user-view': {
		templateUrl: 'Template/V4/views/user/receilist.html',
		controller: 'ReceiListCtrl'
	  }
	}
})
.state('tab.login', {
	url: '/login',
		views: {
			'tab-login': {
			templateUrl: 'Template/V4/views/user/login.html',
			controller: 'UserLoginCtrl'
		}
	}
})
.state('tab.nearby', {
	url: '/nearby',
	views: {
		'tab-nearby': {
			templateUrl: 'Template/V4/views/tab-nearby.html',
			controller: 'NearbyCtrl'
		}
	}
})
.state('news', {
    url: '/news',
    abstract: true,
    templateUrl: 'Template/V4/views/news/tabs.html'
})
.state('news.index', {
	url: '/index/:nodeid',
	views: {
		'news-view': {
			templateUrl: 'Template/V4/views/news/index.html',
			controller: 'NewsIndexCtrl'
		}
	}
})
.state('news.content', {
	url: '/content/:generalid',
	views: {
		'news-view': {
			templateUrl: 'Template/V4/views/news/content.html',
			controller: 'NewsContentCtrl'
		}
	}
})
.state('news.restaurants', {
	url: '/restaurants/:nodeid',
	views: {
		'news-view': {
			templateUrl: 'Template/V4/views/news/restaurants.html',
			controller: 'NewsIndexCtrl'
		}
	}
})
.state('news.courier', {
	url: '/courier/:nodeid',
	views: {
		'news-view': {
			templateUrl: 'Template/V4/views/news/courier.html',
			controller: 'NewsCourierCtrl'
		}
	}
})
.state('news.videolist', {
	url: '/videolist/:nodeid',
	views: {
		'news-view': {
			templateUrl: 'Template/V4/views/news/videolist.html',
			controller: 'NewsVideoCtrl'
		}
	}
})
.state('news.videocont', {
	url: '/videocont/:generalid',
	views: {
		'news-view': {
			templateUrl: 'Template/V4/views/news/videocont.html',
			controller: 'NewsVideoContCtrl'
		}
	}
})
.state('pay', {
    url: '/pay',
    abstract: true,
    templateUrl: 'Template/V4/views/pay/tabs.html'
})
.state('pay.list', {
    url: '/list',
      views: {
          'pay-view': {
              templateUrl: 'Template/V4/views/pay/list.html',
              controller: 'PayListCtrl'
          }
      }
})
.state('pay.waterpay', {
    url: '/waterpay/:nodeid',
      views: {
          'pay-view': {
              templateUrl: 'Template/V4/views/pay/waterpay.html',
              controller: 'WaterPayCtrl'
          }
      }
})
.state('pay.billpay', {
    url: '/billpay',
      views: {
          'pay-view': {
              templateUrl: 'Template/V4/views/pay/billpay.html',
              controller: 'BillPayCtrl'
          }
      }
})
.state('pay.trafficpay', {
    url: '/trafficpay',
      views: {
          'pay-view': {
              templateUrl: 'Template/V4/views/pay/trafficpay.html',
              controller: 'TrafficPayCtrl'
          }
      }
})
.state('im', {
  url: '/im',
  abstract: true,
  templateUrl: 'Template/V4/views/im/tabs.html'
})
.state('im.chat', {
  url: '/chat/:uid',
  views: {
	  'im-view': {
		  templateUrl: 'Template/V4/views/im/chat.html',
		  controller: 'IMChatCtrl'
	  }
  }
})
.state('im.unread', {
  url: '/unread',
  views: {
	  'im-view': {
		  templateUrl: 'Template/V4/views/im/unread.html',
		  controller: 'IMUnReadCtrl'
	  }
  }
});

// if none of the above states are matched, use this as the fallback
$urlRouterProvider.otherwise('/tab/dash');
});
