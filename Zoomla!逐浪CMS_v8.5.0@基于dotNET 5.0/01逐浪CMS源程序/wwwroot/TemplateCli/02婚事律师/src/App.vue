<template>
  <div id="app">
<b-container class="inav" fluid="xl">
<b-navbar toggleable="lg" type="dark" variant="">
<b-navbar-brand href="/"><b-img src="./assets/images/logo.svg" alt="唐乐律师团队"></b-img></b-navbar-brand>

<b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

<b-collapse id="nav-collapse" is-nav>
<b-navbar-nav>
<li class="nav-item"><router-link class="nav-link" to="/">首页</router-link></li>
<li class="nav-item"><router-link class="nav-link" to="/chengxu">离婚程序</router-link></li>
<li class="nav-item"><router-link class="nav-link" to="/haizi">子女抚养</router-link></li>
<li class="nav-item"><router-link class="nav-link" to="/caichan">财产分割</router-link></li>
<li class="nav-item"><router-link class="nav-link" to="/jicheng">遗产继承</router-link></li>
<li class="nav-item"><router-link class="nav-link" to="/caifu">分家析产</router-link></li>
<li class="nav-item"><router-link class="nav-link" to="/about">关于团队</router-link></li>
<li class="nav-item"><router-link class="nav-link" to="/contact">联系我们</router-link></li>
</b-navbar-nav>
<b-navbar-nav class="ml-auto">
        <b-nav-form>
          <b-form-input size="sm" class="mr-sm-2" placeholder="Search"></b-form-input>
          <b-button class="btn my-2 my-sm-0" type="submit" style="background:none; margin-left:-3rem; color:#ff9d00;" ><i class="zi zi_search" ></i></b-button>
        </b-nav-form>
</b-navbar-nav>		

</b-collapse>
</b-navbar>
</b-container>

<b-container fluid="xl" class="d-block d-sm-none inavs">
<ul class="row">
<li class="col-4"><router-link class="nav-link" to="/chengxu">离婚程序</router-link></li>
<li class="col-4"><router-link class="nav-link" to="/haizi">子女抚养</router-link></li>
<li class="col-4"><router-link class="nav-link" to="/caichan">财产分割</router-link></li>
<li class="col-4"><router-link class="nav-link" to="/jicheng">遗产继承</router-link></li>
<li class="col-4"><router-link class="nav-link" to="/caifu">分家析产</router-link></li>
<li class="col-4"><router-link class="nav-link" to="/about">关于团队</router-link></li>
</ul>
</b-container>

 <!--   <div id="nav">
     <router-link to="/">首页</router-link> |
      <router-link to="/about">离婚程序</router-link>
      <router-link to="/about">离婚子女</router-link>
      <router-link to="/about">离婚财产</router-link>
      <router-link to="/about">遗产继续</router-link>
      <router-link to="/about">分析家产</router-link>
      <router-link to="/about">离婚程序</router-link>
    </div> -->
    <router-view/>
  </div>
</template>

<style lang="scss">
@import "assets/global.scss";
</style>