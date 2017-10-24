<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String context = request.getContextPath();// /dt41_javaweb2
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+context+"/"; %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <script src="http://s1.bdstatic.com/r/www/cache/ecom/esl/1-6-10/esl.js"></script>
<head>
<base href="<%=path%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>哈哈，进来了</h1>
<c:if test="${lists!=null}">
<c:forEach items="${lists}"  var="list">
<p>${list.suozaiquyu}喂喂</p>
<p>${list.times}喂喂</p>
<center><h3>${list.xiangmumingcheng }公司销售记录表</h3></center>
</c:forEach>
</c:if>
<div id="main" style="height:400px"></div>

<script type="text/javascript">
require.config({
    paths:{ 
        'echarts' : 'http://echarts.baidu.com/build/echarts',
        'echarts/chart/bar' : 'http://echarts.baidu.com/build/echarts'
    }
});

// 使用
require(
    [
        'echarts',
        'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
    ],
    function (ec) {
        // 基于准备好的dom，初始化echarts图表
        var myChart = ec.init(document.getElementById('main')); 
        
var option =  {
title : {
text: '',
subtext: '纯属虚构'
},
tooltip : {
trigger: 'axis'
},
legend: {
data:['意向','预购','成交']
},
toolbox: {
show : true,
feature : {
    mark : {show: true},
    dataView : {show: true, readOnly: false},
    magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
    restore : {show: true},
    saveAsImage : {show: true}
}
},
calculable : true,
xAxis : [
{
    type : 'category',
    boundaryGap : false,
    data : []
}
],
yAxis : [
{
    type : 'value'
}
],
series : [
{
    name:'成交',
    type:'line',
    smooth:true,
    itemStyle: {normal: {areaStyle: {type: 'default'}}},
    data:[]
    /* data:[90,89,56,999,66,33,24] */
},
/* {
    name:'预购',
    type:'line',
    smooth:true,
    itemStyle: {normal: {areaStyle: {type: 'default'}}},
    data:[30, 182, 434, 791, 390, 30, 10]
},
{
    name:'意向',
    type:'line',
    smooth:true,
    itemStyle: {normal: {areaStyle: {type: 'default'}}},
    data:[1320, 1132, 601, 234, 120, 90]
} */
]
};

 /*     为echarts对象加载数据  */
        myChart.setOption(option); 
        
        //用ajax取数据
        var come = 1;
        getData(come);
        function getData(come) {
            $.ajax({
                type : "post",
                async : false, //同步执行  
                url : "<%=path%>/selectAccount.action",
                data : {
                	/* username:$("input[name=username]").checked */
                },
                dataType : "json", //返回数据形式为json  
                success : function(result) {
                	if(result){
                	     option.legend.data = result.legend;
                         option.xAxis[0].data = result.category;
                         option.series[0].data = result.series[0].data;
                         myChart.hideLoading();
                         myChart.setOption(option);
                         myChart.hideLoading();
                         
                	}
                } ,
                error:function(errorMeg){
                	alert("图表请求失败！")
                	 myChart.showLoading();
                }
             });
        }
    }
);
    </script>
<!-- 折线图 -->
</body>
</html>