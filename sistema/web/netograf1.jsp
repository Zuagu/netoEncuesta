<%-- 
    Document   : netograf1
    Created on : 2/06/2021, 05:57:41 PM
    Author     : zuagu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Graficas</title>
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
    </head>
    <body>
        <h1 class="center">Systel voice!</h1>

        <script type="text/javascript" src="js/Highcharts-7.0.3/code/highcharts.js"></script>

        <figure class="highcharts-figure">
            <div class="row">
                <div class="col s12 hoverable card">
                    <div id="container"></div>
                    <p class="highcharts-description">
                        Descripcion
                    </p>
                </div>
                
                <div class="col s12 hoverable card">
                    <div id="container2"></div>
                    <p class="highcharts-description">
                        Descripcion
                    </p>
                </div>

            </div>
        </figure>
        <script type="text/javascript">

            function select_grafica1() {
                let params = {
                    action: "select_buscar_cuentas"
                };
                $.ajax({
                    type: "POST",
                    url: "ControllerGraficas",
                    data: params,
                    dataType: "json",
                    success: function (cuentas) {
                        console.log(cuentas);
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }

//            $(document).ready(function () {
//                select_grafica1();
//
//            });

            Highcharts.chart('container', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: 'Browser market shares in January, 2018'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                accessibility: {
                    point: {
                        valueSuffix: '%'
                    }
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        name: 'Brands',
                        colorByPoint: true,
                        data: [{
                                name: 'Chrome',
                                y: 61.41,
                                sliced: true,
                                selected: true
                            }, {
                                name: 'Internet Explorer',
                                y: 11.84
                            }]
                    }]
            });





            Highcharts.chart('container2', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: 0,
                    plotShadow: false
                },
                title: {
                    text: '¿Fue usted<br>a votar?',
                    align: 'center',
                    verticalAlign: 'middle',
                    y: 60
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                accessibility: {
                    point: {
                        valueSuffix: '%'
                    }
                },
                plotOptions: {
                    pie: {
//                        colors: [
//                            '#50B432',
//                            '#ED561B',
//                            '#DDDF00',
//                            '#24CBE5',
//                            '#64E572',
//                            '#FF9655',
//                            '#FFF263',
//                            '#6AF9C4'
//                        ],
                        dataLabels: {
                            enabled: true,
                            distance: -50,
                            style: {
                                fontWeight: 'bold',
                                color: 'white'
                            }
                        },
                        startAngle: -90,
                        endAngle: 90,
                        center: ['50%', '75%'],
                        size: '110%'
                    }
                },
                series: [{
                        type: 'pie',
                        name: '¿Fue usted a votar?',
                        innerSize: '50%',
                        data: [
                            ['SI', 99],
                            ['NO', 259]
                        ]
                    }]
            });

        </script>
        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
    </body>
</html>
