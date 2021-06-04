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
        <link rel="stylesheet" type="text/css" href="css/css/style_gestor.css">
    </head>
    <body>
         <jsp:include page="header.jsp"/>
        <h1 class="center">Systel voice!</h1>

        <script type="text/javascript" src="js/Highcharts-7.0.3/code/highcharts.js"></script>
        <script type="text/javascript" src="js/Highcharts-7.0.3/code/modules/exporting.js"></script>
        <script type="text/javascript" src="js/Highcharts-7.0.3/code/modules/export-data.js"></script>

        <figure class="highcharts-figure">
            <div class="row">

                <div class="col s12 hoverable card">
                    <div id="container2"></div>
                    <p class="highcharts-description">
                        SI: <b id="cont_votos_si"></b> <br>
                        NO: <b id="cont_votos_no"></b> <br>
                        Cantidad de encuestados de salida: <b id="cont_votos"></b>
                    </p>
                </div>
                <div class="col s12 hoverable card">
                    <div id="container3"></div>
                    <p class="highcharts-description">
                        nada
                    </p>
                </div>

                <div class="col s12 hoverable card">
                    <div id="container4"></div>
                    <p class="highcharts-description">
                        nada
                    </p>
                </div>

            </div>
        </figure>

        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript">

            function select_grafica1() {
                let params = {
                    action: "grafica1",
                    id_trabajo: id_puesto2_usuario
                };
                $.ajax({
                    type: "POST",
                    url: "ControllerGraficas",
                    data: params,
                    dataType: "json",
                    success: function (response) {
                        console.log(response);

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
                                        ['SI', parseInt(response[0].valor)],
                                        ['NO', parseInt(response[1].valor)]
                                    ]
                                }]
                        });
                        $("#cont_votos").empty();
                        $("#cont_votos_si").empty();
                        $("#cont_votos_no").empty();
                        $("#cont_votos").append(parseInt(response[0].valor) + parseInt(response[1].valor));
                        $("#cont_votos_si").append(parseInt(response[0].valor));
                        $("#cont_votos_no").append(parseInt(response[1].valor));

                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }

            function select_grafica2() {
                let params = {
                    action: "grafica2",
                    id_trabajo: id_puesto2_usuario
                };
                $.ajax({
                    type: "POST",
                    url: "ControllerGraficas",
                    data: params,
                    dataType: "json",
                    success: function (response) {
                        console.log(response);

                        Highcharts.chart('container3', {
                            chart: {
                                type: 'column'
                            },
                            title: {
                                text: 'Grafica de votos'
                            },
                            subtitle: {
                                text: 'Source: SystelVoice.com'
                            },
                            xAxis: {
                                categories: [
                                    'Candidatos'
                                ],
                                crosshair: true
                            },
                            yAxis: {
                                min: 0,
                                title: {
                                    text: 'Respuesta'
                                }
                            },
                            tooltip: {
                                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                                        '<td style="padding:0"><b>{point.y:.0f} votos</b></td></tr>',
                                footerFormat: '</table>',
                                shared: true,
                                useHTML: true
                            },
                            plotOptions: {
                                column: {
                                    pointPadding: 0.2,
                                    borderWidth: 0
                                }
                            },
                            series: response
                        });

                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }


            function graficaavance() {
                let params = {
                    action: "graficaavance",
                    id_trabajo: id_puesto2_usuario
                };
                $.ajax({
                    type: "POST",
                    url: "ControllerGraficas",
                    data: params,
                    dataType: "json",
                    success: function (response) {
                        console.log(response);
                        let _data_graf = [
                            [],
                            [],
                            [],
                            [],
                            [],
                            [],
                            [],
                            [],
                            []
                        ];
                        for (let row of response) {
                            _data_graf[0].push(parseInt(row.cand1));
                            _data_graf[1].push(parseInt(row.cand2));
                            _data_graf[2].push(parseInt(row.cand3));
                            _data_graf[3].push(parseInt(row.cand4));
                            _data_graf[4].push(parseInt(row.cand5));
                            _data_graf[5].push(parseInt(row.cand6));
                            _data_graf[6].push(parseInt(row.cand7));
                            _data_graf[7].push(parseInt(row.cand8));
                            _data_graf[8].push(row.fecha_min);
                        }
                        console.log(_data_graf);

                        Highcharts.chart('container4', {
                            chart: {
                                type: 'line'
                            },
                            title: {
                                text: 'Votos por tiempos'
                            },
                            subtitle: {
                                text: 'Source: WorldClimate.com'
                            },
                            xAxis: {
                                categories: _data_graf[8]
                            },
                            yAxis: {
                                title: {
                                    text: 'Votos'
                                }
                            },
                            plotOptions: {
                                line: {
                                    dataLabels: {
                                        enabled: true
                                    },
                                    enableMouseTracking: false
                                }
                            },
                            series: [{
                                    name: 'Cand 1',
                                    data: _data_graf[0]
                                }, {
                                    name: 'Cand 2',
                                    data: _data_graf[1]
                                }, {
                                    name: 'Cand 3',
                                    data: _data_graf[2]
                                }, {
                                    name: 'Cand 4',
                                    data: _data_graf[3]
                                }, {
                                    name: 'Cand 5',
                                    data: _data_graf[4]
                                }, {
                                    name: 'Cand 6',
                                    data: _data_graf[5]
                                }, {
                                    name: 'Cand 7',
                                    data: _data_graf[6]
                                }, {
                                    name: 'Cand 8',
                                    data: _data_graf[7]
                                }
                            ]
                        });

                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }

            $(document).ready(function () {
                graficaavance();
                select_grafica1();
                select_grafica2();
//                calcular();
            });











        </script>
    </body>
</html>
