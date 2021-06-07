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
        <style>
            .highcharts-credits {
                display: none !important;
            }
            .page-footer{
                background: linear-gradient(to left, #8acaf9, #007edd);
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <script type="text/javascript" src="js/Highcharts-7.0.3/code/highcharts.js"></script>
        <script type="text/javascript" src="js/Highcharts-7.0.3/code/modules/exporting.js"></script>
        <script type="text/javascript" src="js/Highcharts-7.0.3/code/modules/export-data.js"></script>

        <figure class="highcharts-figure">
            <div class="row">

                <div class="col s12 hoverable card">
                    <div class="col s12">
                        <div class="col s6 right-align">
                            SI: <b id="cont_votos_si"></b>
                        </div>
                        <div class="col s6 left-align">
                            NO: <b id="cont_votos_no"></b>
                        </div>
                    </div>
                    <br>
                    <div id="container2"></div>
                    <p class="highcharts-description">
                        Cantidad de encuestados de salida: <b id="cont_votos"></b>
                    </p>
                    <p class="highcharts-description center-align">
                        "ENCUESTA PRIVADA, NO AUTORIZADA SU DISTRIBUCIÓN,  QUEDA PROHIBIDA SU REPRODUCCIÓN TOTAL O PARCIAL AL HACER REFERENCIA DEL AUTOR" TODOS LOS DERECHOS RESERVADOS, ENCUESTA NO REGISTRADA ANTE LA AUTORIDAD ELECTORAL.
                    </p>
                </div>
                <div class="col s12 hoverable card">
                    <div id="container3"></div>
                    <p class="highcharts-description center-align">
                        "ENCUESTA PRIVADA, NO AUTORIZADA SU DISTRIBUCIÓN,  QUEDA PROHIBIDA SU REPRODUCCIÓN TOTAL O PARCIAL AL HACER REFERENCIA DEL AUTOR" TODOS LOS DERECHOS RESERVADOS, ENCUESTA NO REGISTRADA ANTE LA AUTORIDAD ELECTORAL.
                    </p>
                </div>

                <div class="col s12 hoverable card">
                    <div id="container4"></div>
                    <p class="highcharts-description center-align">
                        "ENCUESTA PRIVADA, NO AUTORIZADA SU DISTRIBUCIÓN,  QUEDA PROHIBIDA SU REPRODUCCIÓN TOTAL O PARCIAL AL HACER REFERENCIA DEL AUTOR" TODOS LOS DERECHOS RESERVADOS, ENCUESTA NO REGISTRADA ANTE LA AUTORIDAD ELECTORAL.
                    </p>
                </div>
                
                <div class="col s12 hoverable card">
                    <div id="container5"></div>
                    <p class="highcharts-description center-align">
                        "ENCUESTA PRIVADA, NO AUTORIZADA SU DISTRIBUCIÓN,  QUEDA PROHIBIDA SU REPRODUCCIÓN TOTAL O PARCIAL AL HACER REFERENCIA DEL AUTOR" TODOS LOS DERECHOS RESERVADOS, ENCUESTA NO REGISTRADA ANTE LA AUTORIDAD ELECTORAL.
                    </p>
                </div>

            </div>
        </figure>

        <footer class="page-footer">

            <div class="footer-copyright center-align">
                <div class="container">
                        "ENCUESTA PRIVADA, NO AUTORIZADA SU DISTRIBUCIÓN,  QUEDA PROHIBIDA SU REPRODUCCIÓN TOTAL O PARCIAL AL HACER REFERENCIA DEL AUTOR" TODOS LOS DERECHOS RESERVADOS, ENCUESTA NO REGISTRADA ANTE LA AUTORIDAD ELECTORAL.
                </div>
            </div>
        </footer>

        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/menu.js"></script>
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
                        $("#cont_votos_si").append( (( parseInt(response[0].valor) / ( parseInt(response[0].valor) + parseInt(response[1].valor) ) ) * 100).toFixed(1) + "%" );
                        $("#cont_votos_no").append( (( parseInt(response[1].valor) / ( parseInt(response[0].valor) + parseInt(response[1].valor) ) ) * 100).toFixed(1) + "%" );

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
                                text: 'Grafica de votos 2021'
                            },
                            subtitle: {
                                text: 'Nayarit'
                            },
                            xAxis: {
                                type: 'category'
                            },
                            yAxis: {
                                title: {
                                    text: 'Total percent market share'
                                }

                            },
                            legend: {
                                enabled: false
                            },
                            plotOptions: {
                                series: {
                                    borderWidth: 0,
                                    dataLabels: {
                                        enabled: true,
                                        format: '{point.y:.1f}%'
                                    }
                                }
                            },

                            tooltip: {
                                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
                            },

                            "series": [
                                        {
                                            "name": "Browsers",
                                            "colorByPoint": true,
                                            "data": response
                                        }
                                    ]
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
                                text: 'Nayarit'
                            },
                            xAxis: {
                                categories: _data_graf[8]
                            },
                            yAxis: {
                                title: {
                                    text: '% Votos'
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
                            colors: ['#7F1E57', '#1b8cf7', '#ff8300', '#d8ea36', '#f4122e', '#ffb308', '#5a2a7c', '#ed62a1'],
                            series: [{
                                    name: 'MIGUEL ÁNGEL NAVARRO QUINTERO de MORENA, PT, PARTIDO VERDE, NUEVA ALIANZA',
                                    data: _data_graf[0]
                                }, {
                                    name: 'GLORIA NÚÑEZ del PAN-PRI,PRD',
                                    data: _data_graf[1]
                                }, {
                                    name: 'IGNACIO FLORES DE MOVIMIENTO CIUDADANO',
                                    data: _data_graf[2]
                                }, {
                                    name: 'ÁGUEDA GALICIA DE LEVÁNTATE NAYARIT',
                                    data: _data_graf[3]
                                }, {
                                    name: 'NAYAR MAYORQUÍN DE RSP',
                                    data: _data_graf[4]
                                }, {
                                    name: 'VÍCTOR CHÁVEZ, DE VIVA NAYARIT',
                                    data: _data_graf[5]
                                }, {
                                    name: 'NATALIA ROJAS DEL PES',
                                    data: _data_graf[6]
                                }, {
                                    name: 'BRICET TAYZÁN DE FUERZA POR MÉXICO',
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
            
            
            function graficaavance2() {
                let params = {
                    action: "graficaavance2",
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

                        Highcharts.chart('container5', {
                            chart: {
                                type: 'line'
                            },
                            title: {
                                text: 'Votos por tiempos'
                            },
                            subtitle: {
                                text: 'Nayarit'
                            },
                            xAxis: {
                                categories: _data_graf[8]
                            },
                            yAxis: {
                                title: {
                                    text: '% Votos'
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
                            colors: ['#7F1E57', '#1b8cf7', '#ff8300', '#d8ea36', '#f4122e', '#ffb308', '#5a2a7c', '#ed62a1'],
                            series: [{
                                    name: 'MIGUEL ÁNGEL NAVARRO QUINTERO de MORENA, PT, PARTIDO VERDE, NUEVA ALIANZA',
                                    data: _data_graf[0]
                                }, {
                                    name: 'GLORIA NÚÑEZ del PAN-PRI,PRD',
                                    data: _data_graf[1]
                                }, {
                                    name: 'IGNACIO FLORES DE MOVIMIENTO CIUDADANO',
                                    data: _data_graf[2]
                                }, {
                                    name: 'ÁGUEDA GALICIA DE LEVÁNTATE NAYARIT',
                                    data: _data_graf[3]
                                }, {
                                    name: 'NAYAR MAYORQUÍN DE RSP',
                                    data: _data_graf[4]
                                }, {
                                    name: 'VÍCTOR CHÁVEZ, DE VIVA NAYARIT',
                                    data: _data_graf[5]
                                }, {
                                    name: 'NATALIA ROJAS DEL PES',
                                    data: _data_graf[6]
                                }, {
                                    name: 'BRICET TAYZÁN DE FUERZA POR MÉXICO',
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
                Highcharts.setOptions({
                    colors: ['#7F1E57', '#1b8cf7', '#ff8300', '#d8ea36', '#f4122e', '#ffb308', '#5a2a7c', '#ed62a1']
                });
                graficaavance();
                select_grafica1();
                select_grafica2();
                graficaavance2();
//                calcular();
            });











        </script>
    </body>
</html>
