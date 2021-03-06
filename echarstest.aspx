﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="echarstest.aspx.vb" Inherits="Jamada_4_0.echarstest" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="ECharts">
    <title>echarstest</title>
    <script src="js/common.js"></script>
    <script src="echars/echarts.js" charset='utf-8'></script>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=53oVIOgmSIejwV7EfphPgTynOZbIiVYu"></script>
    <script src="echars/bmap.min.js" charset='utf-8'></script>
    <script src="echars/china.js" charset='utf-8'></script>
    <script src="echars/macarons.js"></script>
    <script src="../js/RPC.js"></script>
    <link href="echars/font-awesome.min.css" rel="stylesheet">
    <link href="echars/bootstrap.css" rel="stylesheet">
    <link href="echars/carousel.css" rel="stylesheet">
    <link href="echars/echartsHome.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="echars/codemirror.js"></script>
    <script src="echars/javascript.js"></script>
    <link href="echars/codemirror.css" rel="stylesheet">
    <link href="echars/monokai.css" rel="stylesheet">
</head>
<body>
    <div id="yibiaopan" style="width: 800px; height: 600px;"></div>
    <div id="test1" style="width: 800px; height: 600px;"></div>
    <div id="pie_salesman" style="width: 800px; height: 600px;"></div>
    <div id="pie_region" style="width: 800px; height: 600px;"></div>
    <div id="pie_product" style="width: 800px; height: 600px;"></div>
    <div id="test3" style="width: 800px; height: 600px;"></div>
    <div id="test4" style="width: 800px; height: 600px;"></div>
    <select id="select">
        <option value="5">维生素E</option>
        <option value="4">维生素D</option>
        <option value="3">维生素C</option>
        <option value="2">维生素B</option>
        <option value="1">维生素A</option>
    </select>
    <div id="test5" style="width: 800px; height: 600px;"></div>
    <div id="map" style="width: 800px; height: 600px;"></div>
    <div id="map2" style="width: 800px; height: 600px;"></div>

    <script type="text/jscript">
        var receive = <%=fReceive%>;
        var sales = <%=fSales%>;
        var bankroll = <%=fBankroll%>;
        var ticket = <%=fTicket%>;
        var receiveMax = <%=fReceiveMax%>;
        var salesMax = <%=fSalesMax%>;
        var bankrollMax = <%=fBankrollMax%>;
        var ticketMax = <%=fTicketMax%>;
        var receiveMin = <%=fReceiveMin%>;
        var salesMin = <%=fSalesMin%>;
        var bankrollMin = <%=fBankrollMin%>;
        var ticketMin = <%=fTicketMin%>;
        var salesUnit = '<%=sSalesUnit%>';
        var salesUnitNum =<%=fSalesUnitNum%>;
        var bankrollUnit ='<%=sBankrollUnit%>';
        var bankrollUnitNum =<%=fBankrollUnitNum%>;
        var ticketUnit ='<%=sTicketUnit%>';
        var ticketUnitNum =<%=fTicketUnitNum%>;

    </script>

    <script type="text/javascript">

        var myChart_yibiaopan = echarts.init(document.getElementById('yibiaopan'), 'macarons');
        option_yibiaopan = {
            tooltip: {
                formatter: "{a} <br/>{c} {b}"
            },
            toolbox: {
                show: true,
                feature: {
                    restore: { show: true },
                    saveAsImage: { show: true },
                    myTool: {
                        show: true,
                        title: '自定义扩展方法',
                        icon: 'image://http://echarts.baidu.com/images/favicon.png',
                        onclick: function () {
                            var iTop = (window.screen.availHeight -  150) / 2; //获得窗口的垂直位置;  
                            var iLeft = (window.screen.availWidth -  600) / 2; //获得窗口的水平位置;
                            window.open("Changescale.aspx", 'newwindow', 'height=150,width=600,top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
                        }
                    }
                }
            },
            title: {
                text: '销售回款',
                textStyle: {
                    color: 'red',
                    fontWeight: 'lighter',
                    fontSize: 30
                }
            },
            series: [
                {
                    name: '销售收入',
                    type: 'gauge',
                    z: 3,
                    min: salesMin,
                    max: salesMax,
                    splitNumber: 10,
                    radius: '50%',
                    axisLine: {            // 坐标轴线
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: [[0.09, 'lime'], [0.82, '#1e90ff'], [1, '#ff4500']],
                            width: 10
                        }
                    },
                    axisTick: {            // 坐标轴小标记
                        length: 15,        // 属性length控制线长
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: 'auto'
                        }
                    },
                    splitLine: {           // 分隔线
                        length: 20,         // 属性length控制线长
                        lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                            color: 'auto'
                        }
                    },
                    axisLabel: {
                        backgroundColor: 'auto',
                        borderRadius: 2,
                        color: '#eee',
                        padding: 3,
                        textShadowBlur: 2,
                        textShadowOffsetX: 1,
                        textShadowOffsetY: 1,
                        textShadowColor: '#222'
                    },
                    title: {
                        // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        fontWeight: 'bolder',
                        fontSize: 20,
                        fontStyle: 'italic'
                    },
                    detail: {
                        // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        /*formatter: function (value) {
                            value = (value + '').split('.');
                            value.length < 2 && (value.push('00'));
                            return ('00' + value[0]).slice(-2)
                                + '.' + (value[1] + '00').slice(0, 2);//转为百分比
                        },*/
                        fontWeight: 'bolder',
                        borderRadius: 3,
                        backgroundColor: '#444',
                        borderColor: '#aaa',
                        shadowBlur: 5,
                        shadowColor: '#333',
                        shadowOffsetX: 0,
                        shadowOffsetY: 3,
                        borderWidth: 2,
                        textBorderColor: '#000',
                        textBorderWidth: 2,
                        textShadowBlur: 2,
                        textShadowColor: '#fff',
                        textShadowOffsetX: 0,
                        textShadowOffsetY: 0,
                        fontFamily: 'Arial',
                        width: 100,
                        color: '#eee',
                        rich: {}
                    },
                    data: [{ value: (sales / salesUnitNum).toFixed(2) - 0, name: '销售收入/' + salesUnit }]
                },
                {
                    name: '销售回款',
                    type: 'gauge',
                    center: ['20%', '55%'],    // 默认全局居中
                    radius: '35%',
                    min: receiveMin,
                    max: receiveMax,
                    endAngle: 45,
                    splitNumber: 6,
                    axisLine: {            // 坐标轴线
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: [[0.09, 'lime'], [0.82, '#1e90ff'], [1, '#ff4500']],
                            width: 8
                        }
                    },
                    axisTick: {            // 坐标轴小标记
                        length: 12,        // 属性length控制线长
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: 'auto'
                        }
                    },
                    splitLine: {           // 分隔线
                        length: 20,         // 属性length控制线长
                        lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                            color: 'auto'
                        }
                    },
                    pointer: {
                        width: 5
                    },
                    title: {
                        offsetCenter: [0, '-30%']       // x, y，单位px
                    },
                    detail: {
                        // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        fontWeight: 'bolder'
                    },
                    data: [{ value: (receive / sales * 100).toFixed(2) - 0, name: '销售回款/%' }]
                },
                {
                    name: '银行存款',
                    type: 'gauge',
                    center: ['77%', '50%'],    // 默认全局居中
                    radius: '25%',
                    min: bankrollMin,
                    max: bankrollMax,
                    startAngle: 135,
                    endAngle: 45,
                    splitNumber: 2,
                    axisLine: {            // 坐标轴线
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: [[0.09, 'lime'], [0.82, '#1e90ff'], [1, '#ff4500']],
                            width: 8
                        }
                    },
                    axisTick: {            // 坐标轴小标记
                        show: false
                    },

                    splitLine: {           // 分隔线
                        length: 15,         // 属性length控制线长
                        lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                            color: 'auto'
                        }
                    },
                    pointer: {
                        width: 2
                    },
                    title: {
                        offsetCenter: [0, '-30%'],
                        fontSize: 15
                    },
                    detail: {
                        show: false
                    },
                    data: [{ value: (bankroll / bankrollUnitNum).toFixed(2) - 0, name: '银行存款/' + bankrollUnit }]
                },
                {
                    name: '应收票据',
                    type: 'gauge',
                    center: ['77%', '50%'],    // 默认全局居中
                    radius: '25%',
                    min: ticketMin,
                    max: ticketMax,
                    startAngle: 315,
                    endAngle: 225,
                    splitNumber: 2,
                    axisLine: {            // 坐标轴线
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: [[0.09, 'lime'], [0.82, '#1e90ff'], [1, '#ff4500']],
                            width: 8
                        }
                    },
                    axisTick: {            // 坐标轴小标记
                        show: false
                    },

                    splitLine: {           // 分隔线
                        length: 15,         // 属性length控制线长
                        lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                            color: 'auto'
                        }
                    },
                    pointer: {
                        width: 2
                    },
                    title: {
                        offsetCenter: [0, '+30%'],
                        fontSize: 15
                    },
                    detail: {
                        show: false
                    },
                    data: [{ value: (ticket / ticketUnitNum).toFixed(2) - 0, name: '应收票据/' + ticketUnit }]
                }
            ]
        };

        myChart_yibiaopan.setOption(option_yibiaopan, true);
//setInterval(function (){
//    option.series[0].data[0].value = (Math.random()*300).toFixed(2) - 0;
//    option.series[1].data[0].value = receive;
//    option.series[2].data[0].value = (Math.random()*300).toFixed(2) - 0;
//    option.series[3].data[0].value = (Math.random()*300).toFixed(2) - 0;
//    myChart.setOption(option,true);
//},2000);

    </script>
    <%--仪表盘--%>

    <script type="text/javascript">
        var myChart1 = echarts.init(document.getElementById('test1'));
        option1 = {
            title: {
                text: '销售量价图'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#283b56'
                    }
                }
            },
            //            dataZoom: {
            //            id: 'dataZoomX',
            //            type: 'slider',
            //            xAxisIndex: [0],
            //            
            //            },
            legend: {
                data: ['数量', '单价']
            },
            toolbox: {
                show: true,
                feature: {
                    dataView: {
                        show: true,
                        //readOnly: false,
                        optionToContent: function (opt) {
                            var axisVal1 = opt.yAxis[0];
                            var axisVal2 = opt.yAxis[1];
                            var table = '<table style="width:100%;text-align:center"><tbody><tr>'
                                + '<td>' + opt.yAxis[0].name + '最小值</td>'
                                + '<td>' + opt.yAxis[0].name + '最大值</td>'
                                + '<td>test</td>'
                                + '</tr>';

                            table += '<tr>'
                                + '<td>' + axisVal1.min + '</td>'
                                + '<td>' + axisVal1.max + '</td>'
                                + '<td>' + opt.series[0].data[0] + '</td>'
                                + '</tr>';

                            table += '</tbody></table>';
                            return table;
                        }
                    },
                    restore: {},
                    saveAsImage: {}
                }
            },
            dataZoom: {
                show: false,
                start: 0,
                end: 100
            },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: true,
                    data: <%=flDate%>,
            /*['2017/11/21', '2017/11/25', '2017/12/1', '2017/12/4', '2017/12/8', '2017/12/12', '2017/12/18', '2017/12/23', '2017/12/27', '2017/12/31']      
        */}
            ],
            yAxis: [
                {
                    type: 'value',
                    scale: true,
                    name: '数量',
                    max: 1200,
                    min: 0,
                    boundaryGap: [0.2, 0.2]
                },
                {
                    type: 'value',
                    scale: true,
                    name: '单价',
                    max: 30,
                    min: 0,
                    boundaryGap: [0.2, 0.2]
                }
            ],
            series: [
                {
                    name: '单价',
                    type: 'line',
                    yAxisIndex: 1,
                },
                {
                    name: '数量',
                    type: 'bar',
                }
            ]
        };

        $.get('data.json').done(function (data) {
            // 填入数据
            myChart1.setOption({
                series: [{
                    // 根据名字对应到相应的系列
                    name: '单价',
                    data: [5, 20, 26, 10, 10, 20, 10, 20, 30, 10]
                },
                {
                    name: '数量',
                    data: [5, 20, 26, 10, 10, 20, 10, 20, 30, 10]

                }]
            })
        });


        myChart1.setOption(option1);
    </script>
    <%--双坐标轴、销量、单价--%>

    <script type="text/javascript">
        var myChart_pie_salesman = echarts.init(document.getElementById('pie_salesman'), 'macarons');
        option_pie_salesman = {
            title: {
                text: '业务员销售业绩',
                subtext: '月度or年度默认显示前十（不含税）',
                x: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c}元 ({d}%)"
            },
            legend: {
                type: 'scroll',
                orient: 'vertical',
                left: '78%',
                top: '22%',
                bottom: '22%',
                data:<%=Psalesmanlegend%>,
                selected:<%=PsalesmanTop%>
            },
            toolbox: {
                show: true,
                top: '15%',
                right: '1%',
                left: '79%',
                feature: {
                    mark: { show: true },
                    dataView: { show: true, readOnly: false },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },
            calculable: true,
            series: [
                {
                    name: '业务员销售额',
                    type: 'pie',
                    radius: '55%',
                    center: ['40%', '50%'],
                    data: <%=PsalesmanData%>,
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

        myChart_pie_salesman.setOption(option_pie_salesman);
    </script>
    <%--业务员饼图(demo)--%>

    <script type="text/javascript">
        var myChart_pie_region = echarts.init(document.getElementById('pie_region'), 'macarons');
        option_pie_region = {
            title: {
                text: '地区销售业绩',
                subtext: '月度or年度默认显示前十（不含税）',
                x: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c}元 ({d}%)"
            },
            legend: {
                type: 'scroll',
                orient: 'vertical',
                left: '78%',
                top: '22%',
                bottom: '22%',
                data:<%=Pregionlegend%>,
                selected:<%=PregionTop%>
            },
            toolbox: {
                show: true,
                top: '15%',
                right: '1%',
                left: '79%',
                feature: {
                    mark: { show: true },
                    dataView: { show: true, readOnly: false },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },
            calculable: true,
            series: [
                {
                    name: '地区销售额',
                    type: 'pie',
                    radius: '55%',
                    center: ['40%', '50%'],
                    data: <%=PregionData%>,
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

        myChart_pie_region.setOption(option_pie_region);
    </script>
    <%--地区饼图(demo)--%>

    <script type="text/javascript">
        var myChart_pie_product = echarts.init(document.getElementById('pie_product'), 'macarons');
        option_pie_product = {
            title: {
                text: '产品销售额业绩',
                subtext: '月度or年度默认显示前十（不含税）',
                x: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c}元 ({d}%)"
            },
            legend: {
                type: 'scroll',
                orient: 'vertical',
                left: '78%',
                top: '22%',
                bottom: '22%',
                data:<%=Pproductlegend%>,
                    selected:<%=PproductTop%>
            },
                toolbox: {
                    show: true,
                    top: '15%',
                    right: '1%',
                    left: '79%',
                    feature: {
                        mark: { show: true },
                        dataView: { show: true, readOnly: false },
                        restore: { show: true },
                        saveAsImage: { show: true },
                    }
                },
                calculable: true,
                series: [
                    {
                        name: '产品销售额',
                        type: 'pie',
                        radius: '55%',
                        center: ['40%', '50%'],
                        data: <%=PproductData%>,
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

        myChart_pie_product.setOption(option_pie_product);
    </script>
    <%--产品饼图(demo)--%>

    <script type="text/javascript">
            var myChart3 = echarts.init(document.getElementById('test3'), 'macarons');
            option3 = {
                title: {
                    text: '销售量价图',
                    subtext: '近一周数据',
                },
                tooltip: {
                    trigger: 'item',
                },
                toolbox: {
                    show: true,
                    feature: {
                        mark: { show: true },
                        restore: { show: true },
                        saveAsImage: { show: true }
                    }
                },
                calculable: true,
                legend: {
                    type: 'scroll',
                    left: '17%',
                    right: '17%',
                    top: '2%',
                    data: <%=DataLegend%>,
                selected:<%=DataLegend_false%>
            },
            xAxis: [
                {
                    type: 'category',
                    data: <%=flDate%>
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '数量',
                },
                {
                    type: 'value',
                    name: '单价',
                    axisLabel: {
                        formatter: '{value} 元'
                    }
                }
            ],
            series: [
                <%=Bdata%>
                <%=Ldata%>
            ]
        };

        myChart3.setOption(option3);
    </script>
    <%--销售量价图--%>

    <script type="text/javascript">
        var myChart4 = echarts.init(document.getElementById('test4'));
        myChart4.setOption({
            title: {
                text: '异步数据加载示例'
            },
            tooltip: {},
            legend: {
                data: ['销量']
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: []
            }]
        });

        $.get('data.json').done(function (data) {
            // 填入数据
            myChart4.setOption({
                xAxis: {
                    data: data.name
                },
                series: [{
                    // 根据名字对应到相应的系列
                    name: '销量',
                    data: data.data
                }]
            });
        });

    </script>
    <%--json导入数据--%>

    <script type="text/javascript">
            var myChart5 = echarts.init(document.getElementById('test5'));
            $(function () {
                $('#select').on('change', function () {
                    var val = $(this).val();
                    _ajax(val);
                });
            });

            function _ajax(len) {
                $.ajax({
                    url: 'index.json',
                    type: 'get',
                    success: function (res) {
                        /*$(res).attr("rows", "1");json中用第二个参数的值替换第一个参数原本的值*/
                        var xData = [];
                        var yData1 = [];
                        var yData2 = [];
                        for (var i = 0; i < 5; i++) {
                            xData.push(res.rows[len - 1].cells[i].time.slice(5));
                        }
                        for (var n = 0; n < 5; n++) {
                            yData1.push(res.rows[len - 1].cells[n].quantity);
                        }
                        for (var m = 0; m < 5; m++) {
                            yData2.push(res.rows[len - 1].cells[m].price);
                        }

                        myChart5.setOption({
                            legend: {
                                data: ['数量', '单价']
                            },
                            xAxis: {
                                type: 'category',
                                boundaryGap: true,
                                data: xData
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'cross',
                                    label: {
                                        backgroundColor: '#283b56'
                                    }
                                }
                            },
                            yAxis: [
                                {
                                    name: '数量',
                                    scale: true,
                                    type: 'value'
                                },
                                {
                                    name: '单价',
                                    scale: true,
                                    type: 'value'
                                }
                            ],
                            series: [{
                                name: '数量',
                                type: 'bar',
                                data: yData1
                            },
                            {
                                name: '单价',
                                yAxisIndex: 1,
                                type: 'line',
                                data: yData2
                            },
                            ]
                        });
                    }
                });
            }
    </script>
    <%--结合下拉框(未处理完成)--%>

    <script type="text/javascript">
       /* var myChart_map2 = echarts.init(document.getElementById('map2'));
        var bmap = myChart_map.getModel().getComponent('bmap').getBMap();
        bmap.addControl(new BMap.MapTypeControl());

        var convertData = function (data) {
            var res = [];
            for (var i = 0; i < data.length; i++) {
                var geoCoord = geoCoordMap[data[i].name];
                if (geoCoord) {
                    res.push({
                        name: data[i].name,
                        value: geoCoord.concat(data[i].value)
                    });
                }
            }
            return res;
        };

        function renderItem(params, api) {
            var coords = [
                [116.7, 39.53],
                [103.73, 36.03],
                [112.91, 27.87],
                [120.65, 28.01],
                [119.57, 39.95]
            ];
            var points = [];
            for (var i = 0; i < coords.length; i++) {
                points.push(api.coord(coords[i]));
            }
            var color = api.visual('color');

            return {
                type: 'polygon',
                shape: {
                    points: echarts.graphic.clipPointsByRect(points, {
                        x: params.coordSys.x,
                        y: params.coordSys.y,
                        width: params.coordSys.width,
                        height: params.coordSys.height
                    })
                },
                style: api.style({
                    fill: color,
                    stroke: echarts.color.lift(color)
                })
            };
        }

        option_map2 = {
            color: ['gold', 'aqua', 'lime'],
            title: {
                text: '模拟迁徙',
                subtext: '数据纯属虚构',
                x: 'center',
                textStyle: {
                    color: '#fff'
                }
            },
            tooltip: {
                trigger: 'item',
                formatter: function (v) {
                    return v[1].replace(':', ' > ');
                }
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data: ['北京', '上海', '广州'],
                selectedMode: 'single',
                selected: {
                    '上海': false,
                    '广州': false
                },
                textStyle: {
                    color: '#fff'
                }
            },
            toolbox: {
                show: true,
                orient: 'vertical',
                x: 'right',
                y: 'center',
                feature: {
                    mark: { show: true },
                    dataView: { show: true, readOnly: false },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },
            dataRange: {
                min: 0,
                max: 100,
                x: 'right',
                calculable: true,
                color: ['#ff3333', 'orange', 'yellow', 'lime', 'aqua'],
                textStyle: {
                    color: '#fff'
                }
            },
            series: [
                {
                    name: '北京',
                    type: 'map',
                    mapType: 'none',
                    data: [],
                    geoCoord: {
                        '上海': [121.4648, 31.2891],
                        '东莞': [113.8953, 22.901],
                        '东营': [118.7073, 37.5513],
                        '中山': [113.4229, 22.478],
                        '临汾': [111.4783, 36.1615],
                        '临沂': [118.3118, 35.2936],
                        '丹东': [124.541, 40.4242],
                        '丽水': [119.5642, 28.1854],
                        '乌鲁木齐': [87.9236, 43.5883],
                        '佛山': [112.8955, 23.1097],
                        '保定': [115.0488, 39.0948],
                        '兰州': [103.5901, 36.3043],
                        '包头': [110.3467, 41.4899],
                        '北京': [116.4551, 40.2539],
                        '北海': [109.314, 21.6211],
                        '南京': [118.8062, 31.9208],
                        '南宁': [108.479, 23.1152],
                        '南昌': [116.0046, 28.6633],
                        '南通': [121.1023, 32.1625],
                        '厦门': [118.1689, 24.6478],
                        '台州': [121.1353, 28.6688],
                        '合肥': [117.29, 32.0581],
                        '呼和浩特': [111.4124, 40.4901],
                        '咸阳': [108.4131, 34.8706],
                        '哈尔滨': [127.9688, 45.368],
                        '唐山': [118.4766, 39.6826],
                        '嘉兴': [120.9155, 30.6354],
                        '大同': [113.7854, 39.8035],
                        '大连': [122.2229, 39.4409],
                        '天津': [117.4219, 39.4189],
                        '太原': [112.3352, 37.9413],
                        '威海': [121.9482, 37.1393],
                        '宁波': [121.5967, 29.6466],
                        '宝鸡': [107.1826, 34.3433],
                        '宿迁': [118.5535, 33.7775],
                        '常州': [119.4543, 31.5582],
                        '广州': [113.5107, 23.2196],
                        '廊坊': [116.521, 39.0509],
                        '延安': [109.1052, 36.4252],
                        '张家口': [115.1477, 40.8527],
                        '徐州': [117.5208, 34.3268],
                        '德州': [116.6858, 37.2107],
                        '惠州': [114.6204, 23.1647],
                        '成都': [103.9526, 30.7617],
                        '扬州': [119.4653, 32.8162],
                        '承德': [117.5757, 41.4075],
                        '拉萨': [91.1865, 30.1465],
                        '无锡': [120.3442, 31.5527],
                        '日照': [119.2786, 35.5023],
                        '昆明': [102.9199, 25.4663],
                        '杭州': [119.5313, 29.8773],
                        '枣庄': [117.323, 34.8926],
                        '柳州': [109.3799, 24.9774],
                        '株洲': [113.5327, 27.0319],
                        '武汉': [114.3896, 30.6628],
                        '汕头': [117.1692, 23.3405],
                        '江门': [112.6318, 22.1484],
                        '沈阳': [123.1238, 42.1216],
                        '沧州': [116.8286, 38.2104],
                        '河源': [114.917, 23.9722],
                        '泉州': [118.3228, 25.1147],
                        '泰安': [117.0264, 36.0516],
                        '泰州': [120.0586, 32.5525],
                        '济南': [117.1582, 36.8701],
                        '济宁': [116.8286, 35.3375],
                        '海口': [110.3893, 19.8516],
                        '淄博': [118.0371, 36.6064],
                        '淮安': [118.927, 33.4039],
                        '深圳': [114.5435, 22.5439],
                        '清远': [112.9175, 24.3292],
                        '温州': [120.498, 27.8119],
                        '渭南': [109.7864, 35.0299],
                        '湖州': [119.8608, 30.7782],
                        '湘潭': [112.5439, 27.7075],
                        '滨州': [117.8174, 37.4963],
                        '潍坊': [119.0918, 36.524],
                        '烟台': [120.7397, 37.5128],
                        '玉溪': [101.9312, 23.8898],
                        '珠海': [113.7305, 22.1155],
                        '盐城': [120.2234, 33.5577],
                        '盘锦': [121.9482, 41.0449],
                        '石家庄': [114.4995, 38.1006],
                        '福州': [119.4543, 25.9222],
                        '秦皇岛': [119.2126, 40.0232],
                        '绍兴': [120.564, 29.7565],
                        '聊城': [115.9167, 36.4032],
                        '肇庆': [112.1265, 23.5822],
                        '舟山': [122.2559, 30.2234],
                        '苏州': [120.6519, 31.3989],
                        '莱芜': [117.6526, 36.2714],
                        '菏泽': [115.6201, 35.2057],
                        '营口': [122.4316, 40.4297],
                        '葫芦岛': [120.1575, 40.578],
                        '衡水': [115.8838, 37.7161],
                        '衢州': [118.6853, 28.8666],
                        '西宁': [101.4038, 36.8207],
                        '西安': [109.1162, 34.2004],
                        '贵阳': [106.6992, 26.7682],
                        '连云港': [119.1248, 34.552],
                        '邢台': [114.8071, 37.2821],
                        '邯郸': [114.4775, 36.535],
                        '郑州': [113.4668, 34.6234],
                        '鄂尔多斯': [108.9734, 39.2487],
                        '重庆': [107.7539, 30.1904],
                        '金华': [120.0037, 29.1028],
                        '铜川': [109.0393, 35.1947],
                        '银川': [106.3586, 38.1775],
                        '镇江': [119.4763, 31.9702],
                        '长春': [125.8154, 44.2584],
                        '长沙': [113.0823, 28.2568],
                        '长治': [112.8625, 36.4746],
                        '阳泉': [113.4778, 38.0951],
                        '青岛': [120.4651, 36.3373],
                        '韶关': [113.7964, 24.7028]
                    },

                    markLine: {
                        smooth: true,
                        effect: {
                            show: true,
                            scaleSize: 1,
                            period: 30,
                            color: '#fff',
                            shadowBlur: 10
                        },
                        itemStyle: {
                            normal: {
                                borderWidth: 1,
                                lineStyle: {
                                    type: 'solid',
                                    shadowBlur: 10
                                }
                            }
                        },
                        data: [
                            [{ name: '北京' }, { name: '上海', value: 95 }],
                            [{ name: '北京' }, { name: '广州', value: 90 }],
                            [{ name: '北京' }, { name: '大连', value: 80 }],
                            [{ name: '北京' }, { name: '南宁', value: 70 }],
                            [{ name: '北京' }, { name: '南昌', value: 60 }],
                            [{ name: '北京' }, { name: '拉萨', value: 50 }],
                            [{ name: '北京' }, { name: '长春', value: 40 }],
                            [{ name: '北京' }, { name: '包头', value: 30 }],
                            [{ name: '北京' }, { name: '重庆', value: 20 }],
                            [{ name: '北京' }, { name: '常州', value: 10 }]
                        ]
                    },
                    markPoint: {
                        symbol: 'emptyCircle',
                        symbolSize: function (v) {
                            return 10 + v / 10
                        },
                        effect: {
                            show: true,
                            shadowBlur: 0
                        },
                        itemStyle: {
                            normal: {
                                label: { show: false }
                            }
                        },
                        data: [
                            { name: '上海', value: 95 },
                            { name: '广州', value: 90 },
                            { name: '大连', value: 80 },
                            { name: '南宁', value: 70 },
                            { name: '南昌', value: 60 },
                            { name: '拉萨', value: 50 },
                            { name: '长春', value: 40 },
                            { name: '包头', value: 30 },
                            { name: '重庆', value: 20 },
                            { name: '常州', value: 10 }
                        ]
                    }

                },
                {
                    name: '上海',
                    type: 'map',
                    mapType: 'none',
                    data: [],
                    markLine: {
                        smooth: true,
                        effect: {
                            show: true,
                            scaleSize: 1,
                            period: 30,
                            color: '#fff',
                            shadowBlur: 10
                        },
                        itemStyle: {
                            normal: {
                                borderWidth: 1,
                                lineStyle: {
                                    type: 'solid',
                                    shadowBlur: 10
                                }
                            }
                        },
                        data: [
                            [{ name: '上海' }, { name: '包头', value: 95 }],
                            [{ name: '上海' }, { name: '昆明', value: 90 }],
                            [{ name: '上海' }, { name: '广州', value: 80 }],
                            [{ name: '上海' }, { name: '郑州', value: 70 }],
                            [{ name: '上海' }, { name: '长春', value: 60 }],
                            [{ name: '上海' }, { name: '重庆', value: 50 }],
                            [{ name: '上海' }, { name: '长沙', value: 40 }],
                            [{ name: '上海' }, { name: '北京', value: 30 }],
                            [{ name: '上海' }, { name: '丹东', value: 20 }],
                            [{ name: '上海' }, { name: '大连', value: 10 }]
                        ]
                    },
                    markPoint: {
                        symbol: 'emptyCircle',
                        symbolSize: function (v) {
                            return 10 + v / 10
                        },
                        effect: {
                            show: true,
                            shadowBlur: 0
                        },
                        itemStyle: {
                            normal: {
                                label: { show: false }
                            }
                        },
                        data: [
                            { name: '包头', value: 95 },
                            { name: '昆明', value: 90 },
                            { name: '广州', value: 80 },
                            { name: '郑州', value: 70 },
                            { name: '长春', value: 60 },
                            { name: '重庆', value: 50 },
                            { name: '长沙', value: 40 },
                            { name: '北京', value: 30 },
                            { name: '丹东', value: 20 },
                            { name: '大连', value: 10 }
                        ]
                    }
                },
                {
                    name: '广州',
                    type: 'map',
                    mapType: 'none',
                    data: [],
                    markLine: {
                        smooth: true,
                        effect: {
                            show: true,
                            scaleSize: 1,
                            period: 30,
                            color: '#fff',
                            shadowBlur: 10
                        },
                        itemStyle: {
                            normal: {
                                borderWidth: 1,
                                lineStyle: {
                                    type: 'solid',
                                    shadowBlur: 10
                                }
                            }
                        },
                        data: [
                            [{ name: '广州' }, { name: '福州', value: 95 }],
                            [{ name: '广州' }, { name: '太原', value: 90 }],
                            [{ name: '广州' }, { name: '长春', value: 80 }],
                            [{ name: '广州' }, { name: '重庆', value: 70 }],
                            [{ name: '广州' }, { name: '西安', value: 60 }],
                            [{ name: '广州' }, { name: '成都', value: 50 }],
                            [{ name: '广州' }, { name: '常州', value: 40 }],
                            [{ name: '广州' }, { name: '北京', value: 30 }],
                            [{ name: '广州' }, { name: '北海', value: 20 }],
                            [{ name: '广州' }, { name: '海口', value: 10 }]
                        ]
                    },
                    markPoint: {
                        symbol: 'emptyCircle',
                        symbolSize: function (v) {
                            return 10 + v / 10
                        },
                        effect: {
                            show: true,
                            shadowBlur: 0
                        },
                        itemStyle: {
                            normal: {
                                label: { show: false }
                            }
                        },
                        data: [
                            { name: '福州', value: 95 },
                            { name: '太原', value: 90 },
                            { name: '长春', value: 80 },
                            { name: '重庆', value: 70 },
                            { name: '西安', value: 60 },
                            { name: '成都', value: 50 },
                            { name: '常州', value: 40 },
                            { name: '北京', value: 30 },
                            { name: '北海', value: 20 },
                            { name: '海口', value: 10 }
                        ]
                    }
                },
                {
                    name: '全国',
                    type: 'map',
                    mapType: 'none',
                    data: [],
                    markLine: {
                        smooth: true,
                        symbol: ['none', 'circle'],
                        symbolSize: 1,
                        itemStyle: {
                            normal: {
                                color: '#fff',
                                borderWidth: 1,
                                borderColor: 'rgba(30,144,255,0.5)'
                            }
                        },
                        data: [
                            [{ name: '北京' }, { name: '包头' }],
                            [{ name: '北京' }, { name: '北海' }],
                            [{ name: '北京' }, { name: '广州' }],
                            [{ name: '北京' }, { name: '郑州' }],
                            [{ name: '北京' }, { name: '长春' }],
                            [{ name: '北京' }, { name: '长治' }],
                            [{ name: '北京' }, { name: '重庆' }],
                            [{ name: '北京' }, { name: '长沙' }],
                            [{ name: '北京' }, { name: '成都' }],
                            [{ name: '北京' }, { name: '常州' }],
                            [{ name: '北京' }, { name: '丹东' }],
                            [{ name: '北京' }, { name: '大连' }],
                            [{ name: '北京' }, { name: '东营' }],
                            [{ name: '北京' }, { name: '延安' }],
                            [{ name: '北京' }, { name: '福州' }],
                            [{ name: '北京' }, { name: '海口' }],
                            [{ name: '北京' }, { name: '呼和浩特' }],
                            [{ name: '北京' }, { name: '合肥' }],
                            [{ name: '北京' }, { name: '杭州' }],
                            [{ name: '北京' }, { name: '哈尔滨' }],
                            [{ name: '北京' }, { name: '舟山' }],
                            [{ name: '北京' }, { name: '银川' }],
                            [{ name: '北京' }, { name: '衢州' }],
                            [{ name: '北京' }, { name: '南昌' }],
                            [{ name: '北京' }, { name: '昆明' }],
                            [{ name: '北京' }, { name: '贵阳' }],
                            [{ name: '北京' }, { name: '兰州' }],
                            [{ name: '北京' }, { name: '拉萨' }],
                            [{ name: '北京' }, { name: '连云港' }],
                            [{ name: '北京' }, { name: '临沂' }],
                            [{ name: '北京' }, { name: '柳州' }],
                            [{ name: '北京' }, { name: '宁波' }],
                            [{ name: '北京' }, { name: '南京' }],
                            [{ name: '北京' }, { name: '南宁' }],
                            [{ name: '北京' }, { name: '南通' }],
                            [{ name: '北京' }, { name: '上海' }],
                            [{ name: '北京' }, { name: '沈阳' }],
                            [{ name: '北京' }, { name: '西安' }],
                            [{ name: '北京' }, { name: '汕头' }],
                            [{ name: '北京' }, { name: '深圳' }],
                            [{ name: '北京' }, { name: '青岛' }],
                            [{ name: '北京' }, { name: '济南' }],
                            [{ name: '北京' }, { name: '太原' }],
                            [{ name: '北京' }, { name: '乌鲁木齐' }],
                            [{ name: '北京' }, { name: '潍坊' }],
                            [{ name: '北京' }, { name: '威海' }],
                            [{ name: '北京' }, { name: '温州' }],
                            [{ name: '北京' }, { name: '武汉' }],
                            [{ name: '北京' }, { name: '无锡' }],
                            [{ name: '北京' }, { name: '厦门' }],
                            [{ name: '北京' }, { name: '西宁' }],
                            [{ name: '北京' }, { name: '徐州' }],
                            [{ name: '北京' }, { name: '烟台' }],
                            [{ name: '北京' }, { name: '盐城' }],
                            [{ name: '北京' }, { name: '珠海' }],
                            [{ name: '上海' }, { name: '包头' }],
                            [{ name: '上海' }, { name: '北海' }],
                            [{ name: '上海' }, { name: '广州' }],
                            [{ name: '上海' }, { name: '郑州' }],
                            [{ name: '上海' }, { name: '长春' }],
                            [{ name: '上海' }, { name: '重庆' }],
                            [{ name: '上海' }, { name: '长沙' }],
                            [{ name: '上海' }, { name: '成都' }],
                            [{ name: '上海' }, { name: '丹东' }],
                            [{ name: '上海' }, { name: '大连' }],
                            [{ name: '上海' }, { name: '福州' }],
                            [{ name: '上海' }, { name: '海口' }],
                            [{ name: '上海' }, { name: '呼和浩特' }],
                            [{ name: '上海' }, { name: '合肥' }],
                            [{ name: '上海' }, { name: '哈尔滨' }],
                            [{ name: '上海' }, { name: '舟山' }],
                            [{ name: '上海' }, { name: '银川' }],
                            [{ name: '上海' }, { name: '南昌' }],
                            [{ name: '上海' }, { name: '昆明' }],
                            [{ name: '上海' }, { name: '贵阳' }],
                            [{ name: '上海' }, { name: '兰州' }],
                            [{ name: '上海' }, { name: '拉萨' }],
                            [{ name: '上海' }, { name: '连云港' }],
                            [{ name: '上海' }, { name: '临沂' }],
                            [{ name: '上海' }, { name: '柳州' }],
                            [{ name: '上海' }, { name: '宁波' }],
                            [{ name: '上海' }, { name: '南宁' }],
                            [{ name: '上海' }, { name: '北京' }],
                            [{ name: '上海' }, { name: '沈阳' }],
                            [{ name: '上海' }, { name: '秦皇岛' }],
                            [{ name: '上海' }, { name: '西安' }],
                            [{ name: '上海' }, { name: '石家庄' }],
                            [{ name: '上海' }, { name: '汕头' }],
                            [{ name: '上海' }, { name: '深圳' }],
                            [{ name: '上海' }, { name: '青岛' }],
                            [{ name: '上海' }, { name: '济南' }],
                            [{ name: '上海' }, { name: '天津' }],
                            [{ name: '上海' }, { name: '太原' }],
                            [{ name: '上海' }, { name: '乌鲁木齐' }],
                            [{ name: '上海' }, { name: '潍坊' }],
                            [{ name: '上海' }, { name: '威海' }],
                            [{ name: '上海' }, { name: '温州' }],
                            [{ name: '上海' }, { name: '武汉' }],
                            [{ name: '上海' }, { name: '厦门' }],
                            [{ name: '上海' }, { name: '西宁' }],
                            [{ name: '上海' }, { name: '徐州' }],
                            [{ name: '上海' }, { name: '烟台' }],
                            [{ name: '上海' }, { name: '珠海' }],
                            [{ name: '广州' }, { name: '北海' }],
                            [{ name: '广州' }, { name: '郑州' }],
                            [{ name: '广州' }, { name: '长春' }],
                            [{ name: '广州' }, { name: '重庆' }],
                            [{ name: '广州' }, { name: '长沙' }],
                            [{ name: '广州' }, { name: '成都' }],
                            [{ name: '广州' }, { name: '常州' }],
                            [{ name: '广州' }, { name: '大连' }],
                            [{ name: '广州' }, { name: '福州' }],
                            [{ name: '广州' }, { name: '海口' }],
                            [{ name: '广州' }, { name: '呼和浩特' }],
                            [{ name: '广州' }, { name: '合肥' }],
                            [{ name: '广州' }, { name: '杭州' }],
                            [{ name: '广州' }, { name: '哈尔滨' }],
                            [{ name: '广州' }, { name: '舟山' }],
                            [{ name: '广州' }, { name: '银川' }],
                            [{ name: '广州' }, { name: '南昌' }],
                            [{ name: '广州' }, { name: '昆明' }],
                            [{ name: '广州' }, { name: '贵阳' }],
                            [{ name: '广州' }, { name: '兰州' }],
                            [{ name: '广州' }, { name: '拉萨' }],
                            [{ name: '广州' }, { name: '连云港' }],
                            [{ name: '广州' }, { name: '临沂' }],
                            [{ name: '广州' }, { name: '柳州' }],
                            [{ name: '广州' }, { name: '宁波' }],
                            [{ name: '广州' }, { name: '南京' }],
                            [{ name: '广州' }, { name: '南宁' }],
                            [{ name: '广州' }, { name: '南通' }],
                            [{ name: '广州' }, { name: '北京' }],
                            [{ name: '广州' }, { name: '上海' }],
                            [{ name: '广州' }, { name: '沈阳' }],
                            [{ name: '广州' }, { name: '西安' }],
                            [{ name: '广州' }, { name: '石家庄' }],
                            [{ name: '广州' }, { name: '汕头' }],
                            [{ name: '广州' }, { name: '青岛' }],
                            [{ name: '广州' }, { name: '济南' }],
                            [{ name: '广州' }, { name: '天津' }],
                            [{ name: '广州' }, { name: '太原' }],
                            [{ name: '广州' }, { name: '乌鲁木齐' }],
                            [{ name: '广州' }, { name: '温州' }],
                            [{ name: '广州' }, { name: '武汉' }],
                            [{ name: '广州' }, { name: '无锡' }],
                            [{ name: '广州' }, { name: '厦门' }],
                            [{ name: '广州' }, { name: '西宁' }],
                            [{ name: '广州' }, { name: '徐州' }],
                            [{ name: '广州' }, { name: '烟台' }],
                            [{ name: '广州' }, { name: '盐城' }]
                        ]
                    }
                }
            ]
        };
        myChart_map2.setOption(option_map2);

    </script>
    <%--标线地图map(未成功)--%>
</body>
</html>
