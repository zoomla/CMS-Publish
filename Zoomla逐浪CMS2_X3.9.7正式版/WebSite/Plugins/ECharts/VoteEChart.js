var mychart = {
    pie: function (data) {
        //饼图,[{name:"",value:50}]
        var option = {
            title: { left: "left", text: '', x: 'center' },//数据统计
            tooltip: { trigger: 'item', formatter: "{a} <br/>{b} : {c} ({d}%)" },
            legend: { show: false, orient: 'vertical', left: 'left', data: [] },
            series: [{
                name: '数据量', type: 'pie', radius: '55%', center: ['50%', '50%'], data: [],
                itemStyle: { emphasis: { shadowBlur: 10, shadowOffsetX: 0, shadowColor: 'rgba(0, 0, 0, 0.5)' } }
            }]
        };
        option.legend.data = [];
        option.series[0].data = [];
        for (var i = 0; i < data.length; i++) {
            option.legend.data.push(data[i].name);
            option.series[0].data.push(data[i]);
        }
        return option;
    },
    circle: function (data) {
        //环形,[{name:"",value:50}]
        var option = {
            title: { left: "left", text: '', x: 'center' },//数据统计
            tooltip: { trigger: 'item', formatter: "{a} <br/>{b} : {c} ({d}%)" },
            legend: { orient: 'vertical', left: 'left', data: [] },
            series: [{
                name: '数据量', type: 'pie', radius: ['50%', '70%'], avoidLabelOverlap: false, data: []
            }]
        };
        option.legend.data = [];
        option.series[0].data = [];
        for (var i = 0; i < data.length; i++) {
            option.legend.data.push(data[i].name);
            option.series[0].data.push(data[i]);
        }
        return option;
    },
    bar: function (data) {
        var option = {
            color: ['#3398DB'],
            tooltip: { trigger: 'axis', axisPointer: { type: 'shadow' } },
            grid: { left: '3%', right: '4%', bottom: '3%', containLabel: true },
            xAxis: [{ type: 'category', axisTick: { alignWithLabel: true }, data: [] }],
            yAxis: [{ type: 'value' }],
            series: [{ name: '', type: 'bar', barWidth: '30%', data: [] }]
        };
        option.series[0].data = [];
        for (var i = 0; i < data.length; i++) {
            option.xAxis[0].data.push(data[i].name);
            option.series[0].data.push(data[i].value);
        }
        return option;
    },
    line: function (data) {
        var option = {
            color: ['#3398DB'],
            title: { text: '' },
            tooltip: { trigger: 'axis', axisPointer: { type: 'shadow' } },
            legend: { data: [''] },
            grid: { left: '3%', right: '4%', bottom: '3%', containLabel: true },
            xAxis: { type: 'value', boundaryGap: [0, 0.01] },
            yAxis: { type: 'category', data: [] },
            series: [{ name: '', type: 'bar', data: [] }]
        };
        option.legend.data = [];
        option.series[0].data = [];
        for (var i = 0; i < data.length; i++) {
            option.yAxis.data.push(data[i].name);
            option.series[0].data.push(data[i].value);
        }
        return option;
    },
};
var charts = [];
function showchart(id, type) {
    var chart = null;
    var data = JSON.parse($("#item_" + id).find("#chart_hid").val());
    var $chartDiv = $("#item_" + id).find(".zlchart");
    if ($chartDiv.height() == 0) { $chartDiv.height(260); }
    $chartDiv.show();
    if (!charts[id]) {
        chart = echarts.init(document.getElementById("chart_" + id));
        charts[id] = chart;
    }
    else { chart = charts[id]; }
    chart.clear();
    switch (type) {
        case "pie":
            chart.setOption(mychart.pie(data));
            break;
        case "circle":
            chart.setOption(mychart.circle(data));
            break;
        case "bar":
            chart.setOption(mychart.bar(data));
            break;
        case "line":
            chart.setOption(mychart.line(data));
            break;
    }
}
function hidechart(id) {
    var $chartDiv = $("#item_" + id).find(".zlchart");
    $chartDiv.hide();
}