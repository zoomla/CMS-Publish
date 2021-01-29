<template>
  <div id="app">
    <div  class="inav">
        <!-- <router-link to="/">logo</router-link> 
      <router-link to="/">首页</router-link> 
      <router-link to="/about">卡死你3000</router-link>
      <router-link to="/about">Powershell智能管家</router-link>
      <router-link to="/about">RPA自动化探索</router-link>
      <router-link to="/about">入门教程</router-link>
      <router-link to="/about">技术文摘</router-link>
      <router-link to="/about">交流社区</router-link>
      <router-link to="/about">扩展资源</router-link>
      <input type="text" class="putxt" placeholder="Search"> -->
        

 
  <b-navbar toggleable="lg" type="dark" variant="info" class="fixed-top">
     <div class="container-xl">
    <b-navbar-brand href="/"><b-img src="./assets/images/logo.svg" alt="PowerShell开发者社区"></b-img></b-navbar-brand>
    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
    <b-collapse id="nav-collapse" is-nav>
      <b-navbar-nav>
        <b-nav-item href="/" active>首页</b-nav-item>
        <b-nav-item href="https://gitee.com/chuanjiao10/kasini3000" target="_blank">卡死你3000</b-nav-item>
        <b-nav-item href="#">Powershell智能管家</b-nav-item>
        <b-nav-item href="#">RPA自动化探索</b-nav-item>
        <b-nav-item href="#">入门教程</b-nav-item>
        <b-nav-item href="#">技术文摘</b-nav-item>
        <b-nav-item href="#">交流社区</b-nav-item>
        <b-nav-item href="#">扩展资源</b-nav-item>
      </b-navbar-nav>

      <!-- Right aligned nav items -->
      <b-navbar-nav class="ml-auto">
        <b-nav-form>
          <b-form-input size="sm" class="mr-sm-2" placeholder="Search"></b-form-input>
          <b-button size="sm" class="my-2 my-sm-0" type="submit">Search</b-button>
        </b-nav-form>

        <b-nav-item-dropdown text="语言" right>
          <b-dropdown-item href="#">EN</b-dropdown-item>
          <b-dropdown-item href="#">ES</b-dropdown-item>
          <b-dropdown-item href="#">RU</b-dropdown-item>
          <b-dropdown-item href="#">FA</b-dropdown-item>
        </b-nav-item-dropdown>

        <b-nav-item-dropdown right>
          <!-- Using 'button-content' slot -->
          <template v-slot:button-content>
            <em>会员</em>
          </template>
          <b-dropdown-item href="#">登录</b-dropdown-item>
          <b-dropdown-item href="#">注册</b-dropdown-item>
        </b-nav-item-dropdown>
      </b-navbar-nav>
    </b-collapse>
     </div>
  </b-navbar>
</div>

<router-view/>
<ZoomlaKefu_top cols="12" md="12" class="bg-info" con="2020年逐浪软件科技" :icpOpen="true" icp="沪ICP200800号"/>
<!-- <ZoomlaKefu tel="13177777714" qq="1799661890" url="http://www.z01.com" /> -->
</div>
</template>


<style lang="scss">
@import "assets/global.scss";
/* #app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
} */
</style>