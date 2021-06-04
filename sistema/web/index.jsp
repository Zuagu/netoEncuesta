<%@page contentType="text/html" pageEncoding="UTF-8"%>                                                                                                                                                                                 
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Encuestas</title>
        <!--icono de la pestaña del explorador-->
        <link rel="shortcut icon" href="image/">
        <link rel="apple-touch-icon" href="">
        <link href="css/css/icons-material.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/login_1_1.css">
    </head>
    <body id="loginjsp">
        <div class="wrapper col s12 m12 l12">
            <div class="login-text">
                <button class="cta"><i class="material-icons">arrow_downward</i></button>
                <div class="input-field text">
                    <form id="login" class="" style="" name="login" action="/sistema/main.jsp" method="post">
                        <h3 class="center">Inicia</h3>
                        <div class="input-field col s12 m12 l12">
                            <input id="ip" type="hidden">
                            <input id="id_perfil" name="id_perfil" type="hidden" value="2">
                            <input placeholder="Usuario" id="id_usuario" name="id_usuario" type="text" class="validate" style="background-color: white !important; border-radius:4px;color: black;width: 95%;">
                            <label for="usuario" class="color:white !important;">Usuario</label>
                        </div>
                        <div class="input-field col s12 m12 l12">
                            <input placeholder="Contraseña" name="password" id="password" type="text" class="validate" style="background-color: white !important; border-radius:4px;color: black; width: 95%;">
                            <label for="password" class="color:white !important;">Contraseña</label>
                        </div>
                        <a id="iniciar_sesion" class="boton_login z-depth-2 hoverable">Acceder</a>
                    </form>
                </div>
            </div>
            <div class="call-text" style="background-color: #ffffff;">
                <div class="col s10 m10 l10 offset-s1 center">
                   <img  width="100%" src="image/exitpoll.jpg" style=""> 
                </div>
            </div>

        </div>
        <%
            //System.out.println(request.getSession().getAttribute("id_usuario"));

            if (request.getSession().getAttribute("id_usuario") != null) {
                out.write("<script> location.replace('" + request.getSession().getAttribute("puesto") + ".jsp'); </script>");
            }
        %>
        <script src="js/js/jquery-2.2.4.min.js"></script>
        <script src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/login_2.js"></script>
    </body>
</html>

