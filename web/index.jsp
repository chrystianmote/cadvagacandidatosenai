<%-- 
    Document   : index
    Created on : 10/10/2022, 15:24:56
    Author     : Chrystian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css">
        <link rel="stylesheet" type="text/css" href="css/tempusdominus-bootstrap-4.css">

        <title>JSP Page</title>
    </head>
    <body>


        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">App RH</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="vagas.jsp">Listar Vagas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cadvaga.jsp">Cadastrar Vagas</a>
                    </li>
                </ul>
            </div>
        </nav>
        <br/>
        <br/>
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <center>
                        <h2>Vagas</h2>   
                        <br/>
                        <br/>
                        <h6>Modulo Responsável pela vagas ofertadas pela agência de RH</h6>
                        <br/>
                        <a href="vagas.jsp" class="btn btn-info">Listar Vagas</a>
                        <a href="cadvaga.jsp" class="btn btn-info">Cadastrar Vagas</a>
                    </center>

                </div>
                <div class="col-md-3"></div>
            </div>


        </div>



        <script src="js/jquery.js" ></script>
        <script src="js/bootstrap.js" ></script>
        <script src="js/jquery.mask.js" ></script>



        <script type="text/javascript">
            $(function () {





            });



        </script>
    </body>
</html>