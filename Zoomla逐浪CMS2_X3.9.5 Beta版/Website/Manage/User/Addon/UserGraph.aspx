<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserGraph.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Addon.UserGraph" MasterPageFile="~/Manage/I/Default.master" %> 
<asp:Content runat="server" ContentPlaceHolderID="head"><title>用户画像</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    
    <style type="text/css">
        .zlchart { width: 100%; height: 260px; }
        .zlsecondchart { width: 100%; height: 290px; }
        .panel-body { height: 275px; }
    </style>
    <div class="container-fulid">
        <div class="row padding_l_r10px">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 padding5">
                <div class="panel panel-default Worktable_well">
                    <div class="panel-heading"><i class="fa fa-user"></i><span>性别统计</span></div>
                    <div class="panel-body WorktableHeight">
                        <div id="SexChart" class="zlchart"></div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 padding5">
                <div class="panel panel-default Worktable_well">
                    <div class="panel-heading"><i class="fa fa-file"></i><span>年龄统计</span></div>
                    <div class="panel-body WorktableHeight">
                        <div id="AgeChart" class="zlchart"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 padding5">
                <div class="panel panel-default Worktable_well">
                    <div class="panel-heading"><i class="fa  fa-user"></i><span>登录频率</span></div>
                    <div class="panel-body WorktableHeight">
                        <div id="LoginChart" class="zlchart"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 padding5">
                <div class="panel panel-default Worktable_well">
                    <div class="panel-heading"><span>用户地区分布</span></div>
                    <div class="panel-body WorktableHeight">
                        <div id="ProvinceChart" class="zlchart"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 padding5">
                <div class="panel panel-default Worktable_well">
                    <div class="panel-heading"><i class="fa  fa-user"></i><span>活跃指数</span></div>
                    <div class="panel-body WorktableHeight">
                        <div id="ActivityChart" class="zlchart"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 padding5">
                <div class="panel panel-default Worktable_well">
                    <div class="panel-heading"><i class="fa  fa-user"></i><span>消费指数</span></div>
                    <div class="panel-body WorktableHeight">
                        <div id="ConsumeChart" class="zlchart"></div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 padding5">
                <div class="panel panel-default Worktable_well">
                    <div class="panel-heading">
                        <a href="javascript:;" id="purse" class="btn btn-default" onclick="changeWealthPointsChartType('purse');">余额</a>
                        <a href="javascript:;" id="silverCoin" class="btn btn-default" onclick="changeWealthPointsChartType('silverCoin');">银币</a>
                        <a href="javascript:;" id="userExp" class="btn btn-default" onclick="changeWealthPointsChartType('userExp');">积分</a>
                        <span class="badge pull-right"></span>
                    </div>
                    <div class="panel-body WorktableHeight purse" style="height: 261px">
                        <div id="WealthPointsChart" class="zlchart userFund"></div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 padding5">
                <div class="panel panel-default Worktable_well">
                    <div class="panel-heading">
                        <a href="javascript:;" class="btn btn-default zl-day" onclick="changeRegTimeChartType('zl-day');">日</a>
                        <a href="javascript:;" class="btn btn-default zl-week" onclick="changeRegTimeChartType('zl-week');">周</a>
                        <a href="javascript:;" class="btn btn-default zl-month" onclick="changeRegTimeChartType('zl-month');">月</a>
                        <a href="javascript:;" class="btn btn-default zl-season" onclick="changeRegTimeChartType('zl-season');">季</a>
                        <a href="javascript:;" class="btn btn-default zl-year" onclick="changeRegTimeChartType('zl-year');">年</a>
                        <a href="javascript:;" class="btn btn-default zl-all" onclick="changeRegTimeChartType('zl-all');">全部时间</a>
                        <span class="badge pull-right"></span>
                    </div>
                    <div class="panel-body WorktableHeight purse" style="height: 261px">
                        <div id="UserRegTimeChart" class="zlchart userFund"></div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <asp:HiddenField runat="server" ID="GraphData_Hid" />
    <script src="/Plugins/ECharts/build/source/echarts.js"></script>
    <script>  
        var json=JSON.parse($("#GraphData_Hid").val());
        var wealthPointsLocal = echarts.init(document.getElementById('WealthPointsChart'));  
        var userRegTimeLocal = echarts.init(document.getElementById('UserRegTimeChart')); 
        var fundGroup = ["一百以内","大于100","大于500","大于1K","大于5K","大于1W"];
        <%--        var fund = <%=FundJson%>; 
        var sliverCoin = <%=SliverCoinJson%>; 
        var userExp = <%=UserExpJson%>; --%>
        var fund = json.FundJson; 
        var sliverCoin = json.SliverCoinJson; 
        var userExp = json.UserExpJson; 
        var wealthPointsOption = {
            title: {
                text: ''
            },
            tooltip: {},
            legend: {
                data:[]
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '人',
                type: 'bar',
                data: [],
                itemStyle: {
                    normal:{
                        color: '#6E8B3D',
                        shadowBlur: 200,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    },
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 1.5)'
                    }
                }
            }]
        }; 
        wealthPointsOption.xAxis.data = [];  
        wealthPointsOption.xAxis.data = fundGroup;
        var currWeal = '';
        
        //用于财富指数图的切换数据
        function changeWealthPointsChartType(panel){ 
            $(currWeal).removeClass('btn-info');
            $('#'+panel).addClass('btn-info');
            currWeal = '#'+ panel;

            wealthPointsOption.series[0].data = []; 
            var data ={}; 
            //var elem;
            if(panel == 'purse'){
                data = fund; 
                wealthPointsOption.title.text='用户余额';
                wealthPointsOption.title.subtext = '元';
                wealthPointsOption.series[0].itemStyle.normal.color = '#6E8B3D';
                wealthPointsOption.series[0].data= [];  
            } else if (panel=='silverCoin'){
                data =sliverCoin; 
                wealthPointsOption.title.text = '银币';
                wealthPointsOption.title.subtext='个';  
                wealthPointsOption.series[0].itemStyle.normal.color = '#548B54';
            } else if (panel == 'userExp'){
                data = userExp; 
                wealthPointsOption.title.text='用户积分'; 
                wealthPointsOption.title.subtext = '积分';
                wealthPointsOption.series[0].itemStyle.normal.color = '#4876FF';
            }else {
                data = {};
            }  
            wealthPointsOption.series[0].data = data; 
            wealthPointsLocal.setOption(wealthPointsOption); 
        }
        //用于处理用户注册人数的数据切换
        var userRegTimeGroup = ["当日","一周内","当月","当季","今年","全部时间"];
        <%--var userRegTime = <%=UserRegTimeJson%>;--%>
        var userRegTime = json.UserRegTimeJson;
        var currRegDom = ''; 
        //用户注册时间配置项
        var userRegTimeOption = {
            title: {
                text: '',
                subtext: '人'
            },
            tooltip: {},
            legend: {
                data:[]
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '人',
                type: 'bar',
                barWidth: '30%',
                data: [],
                itemStyle: {
                    normal:{
                        color: '#1C86EE',
                        shadowBlur: 200,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    },
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 1.5)'
                    }
                }
            }]
        };  
        function changeRegTimeChartType(panel){
            $(currRegDom).removeClass('btn-info');
            $('.'+panel).addClass('btn-info');
            currRegDom = '.'+ panel;

            var data = []; 
            var index = 0;
            userRegTimeOption.xAxis.data= [];
            userRegTimeOption.series[0].data= [];  
  
            if(panel == 'zl-day') { 
                userRegTimeOption.title.text='当日注册量';
                index = 0; 
            }else if(panel =='zl-week'){
                userRegTimeOption.title.text='本周注册量';
                index = 1; 
            }else if(panel =='zl-month'){
                userRegTimeOption.title.text='当月注册量';
                index = 2; 
            }else if(panel =='zl-season'){
                userRegTimeOption.title.text='本季度注册量';
                index = 3; 
            }else if(panel =='zl-year'){
                userRegTimeOption.title.text='今年注册量';
                index = 4; 
            }else{
                userRegTimeOption.title.text='总注册量';
                index = 5; 
            }
            userRegTimeOption.xAxis.data.push(userRegTimeGroup[index]);
            userRegTimeOption.series[0].data.push({ value: userRegTime[index], name: userRegTimeGroup[index] });
            userRegTimeLocal.setOption(userRegTimeOption);   
        }
    </script>
    <script>
    </script>
    <script> 
        var sexChartLocal = echarts.init(document.getElementById('SexChart'));
        var ageChartLocal = echarts.init(document.getElementById('AgeChart'));
        var loginChartLocal = echarts.init(document.getElementById('LoginChart'));
        var provinceChartLocal = echarts.init(document.getElementById('ProvinceChart'));
        var activityChartLocal = echarts.init(document.getElementById('ActivityChart'));
        var consumeChartLocal = echarts.init(document.getElementById('ConsumeChart'));

        // 配置项
        //性别配置型
        var sexChartOption = { 
            title : {
                text: '性别统计',
                subtext: '',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['男','女','未知']
            },
            series : [
                {
                    name: '性别',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[ ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        }; 
        //年龄配置项
        var ageChartOption = {
            title: {
                text: '年龄统计'
            },
            tooltip: {},
            legend: {
                data:['年龄']
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '人',
                type: 'bar',
                data: [],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 1.5)'
                    }
                }
            }]
        }; 
        //登录频率配置项
        var loginChartOption = {
            title : {
                text: '登录频率',
                subtext: '',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: []
            },
            series : [
                {
                    name: '人数',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[ 
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
    
        //用户活跃度配置项
        var activityChartOption = {
            title : {
                text: '用户活跃指数',
                subtext: '',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: []
            },
            series : [
                {
                    name: '活跃度',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]   
        };
        //用户消费指数配置项
        var consumeChartOption = {
            title: {
                text: '消费指数',
                subtext: '消费积分'
            },
            tooltip: {},
            legend: {
                data:[]
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '人',
                type: 'bar',
                data: [],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 1.5)'
                    }
                }
            }]
        }; 

        // 填充数据 
        $(function () {
            //性别图
            sexChartOption.series[0].data = [];  
            sexChartOption.series[0].data.push({ value: json.UserSexJson[0], name: '男' });
            sexChartOption.series[0].data.push({ value: json.UserSexJson[1], name: '女' });
            //年龄图   
            <%--var ageSet = <%=AgeSetJson%>;--%>
            var ageSet = json.AgeSetJson;
            var ageGroupSet = ["小于20岁","20-30岁","30-40岁","40-50岁","大于50岁","未知"]; 
            ageChartOption.xAxis.data = ageGroupSet; 
            ageChartOption.series[0].data = [];  
            ageChartOption.series[0].data = ageSet;   
            //登录频率图
            var loginRateGroup = ["极高","频繁","活跃","一般","较少"]; 
            <%--var loginRateSet = <%=LoginRateJson%>; --%> 
            var loginRateSet = json.LoginRateJson; 
            loginChartOption.series[0].data = [];
            loginChartOption.legend.data = []; 
            loginChartOption.legend.data = loginRateGroup;  
            for (var i = 0; i < loginRateGroup.length; i++) {
                loginChartOption.series[0].data.push({ value: loginRateSet[i], name: loginRateGroup[i] });
            }

            //用户地区分布图
             var provinceName = json.ProvinceName;
            <%--var provinceSet = <%=ProvinceSet%>;--%>
            var provinceSet = json.ProvinceSet; 
            var dataAxis =  provinceName;
            var data = [];
            for (var i = 0; i < provinceName.length; i++) {
                data.push(provinceSet[i]);
            }

            var yMax = 1000;
            var dataShadow = [];

            for (var i = 0; i < data.length; i++) {
                dataShadow.push(yMax);
            }

            provinceChartOption = {
                title: {
                    text: '用户地区分布',
                    subtext: '点击，滚轮或滑动缩放'
                },
                xAxis: {
                    data: dataAxis,
                    axisLabel: {
                        inside: true,
                        textStyle: {
                            color: '#5C5C5C'
                        }
                    },
                    axisTick: {
                        show: false
                    },
                    axisLine: {
                        show: false
                    },
                    z: 10
                },
                yAxis: {
                    axisLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        textStyle: {
                            color: '#999'
                        }
                    }
                },
                dataZoom: [
                    {
                        type: 'inside'
                    }
                ],
                series: [
                    { // For shadow
                        type: 'bar',
                        itemStyle: {
                            normal: {color: 'rgba(0,0,0,0.05)'}
                        },
                        barGap:'-100%',
                        barCategoryGap:'40%',
                        data: dataShadow,
                        animation: false
                    },
                    {
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(
                                    0, 0, 0, 1,
                                    [
                                        {offset: 0, color: '#83bff6'},
                                        {offset: 0.5, color: '#188df0'},
                                        {offset: 1, color: '#188df0'}
                                    ]
                                )
                            },
                            emphasis: {
                                color: new echarts.graphic.LinearGradient(
                                    0, 0, 0, 1,
                                    [
                                        {offset: 0, color: '#2378f7'},
                                        {offset: 0.7, color: '#2378f7'},
                                        {offset: 1, color: '#83bff6'}
                                    ]
                                )
                            }
                        },
                        data: data
                    }
                ]
            }; 
            // Enable data zoom when user click bar.
            var zoomSize = 6;
            provinceChartLocal.on('click', function (params) { 
                provinceChartLocal.dispatchAction({
                    type: 'dataZoom',
                    startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 1.2, 0)],
                    endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 1.2, data.length - 1)]
                });
            });
             
            //用户活跃度图
            var userActivityGroup =  [ "最近三天","最近一周","最近一个月","最近三个月","非活跃用户"]; 
            <%--var userActivity = <%=UserActivityJson%>;--%>
            var userActivity = json.UserActivityJson;
            activityChartOption.legend.data = [];  
            activityChartOption.series[0].data = [];
            activityChartOption.legend.data =  userActivityGroup;  
            for (var i = 0; i < userActivityGroup.length; i++) {
                activityChartOption.series[0].data.push({ value: userActivity[i], name: userActivityGroup[i] });  
            }
            //用户消费指数
            var consumeExpGroup = [ "一百以内","大于100","大于500","大于1K","大于5K","大于1W"];
            <%--var consumeExp = <%=ConsumeExpJson%>;--%>
            var consumeExp = json.ConsumeExpJson;
            consumeChartOption.xAxis.data = []; 
            consumeChartOption.series[0].data = [];   
            consumeChartOption.xAxis.data = consumeExpGroup;  
            consumeChartOption.series[0].data = consumeExp;    
             
            //设置参数
            sexChartLocal.setOption(sexChartOption);
            ageChartLocal.setOption(ageChartOption);
            loginChartLocal.setOption(loginChartOption);
            provinceChartLocal.setOption(provinceChartOption);
            activityChartLocal.setOption(activityChartOption);
            consumeChartLocal.setOption(consumeChartOption);
            changeWealthPointsChartType('purse');
            changeRegTimeChartType('zl-day');
        })
    </script>
</asp:Content>
