<template>
  <div>
    
<ion-side-menus>
<!-- 中间内容 -->
<ion-side-menu-content drag-content="false">
<ion-nav-view>
</ion-nav-view>
<div class="home_beat" ng-controller="IndexCtrl"><a ng-click="openLink('http://www.z01.com/pub')"><span>下载逐浪</span></a></div>
</ion-side-menu-content>
</ion-side-menus>

  </div>
</template>

<script>
  export default{
  data(){
  return {};
  },
  methods:{

  }
  }
</script>