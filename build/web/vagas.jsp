<%-- 
    Document   : vagas
    Created on : 10/10/2022, 15:27:03
    Author     : Chrystian
--%>
<%@page import="java.util.List"%>
<%@page import="modelo.Vaga"%>
<%@page import="controle.VagaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Vaga> vagas = VagaControle.ListarVagas();
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.css">


        <title>AppRH - Lista de vagas</title>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <h2>Lista de vagas cadastradas</h2>   
                    <br/>
                    <table class="table table-striped">
                        <tr>
                            <th>Nome da Vaga</th>
                            <th width="30%">Descricão</th>
                            <th>Salário</th>
                            <th>Expira</th>
                            <th>Ações</th>
                        </tr>

                        <%
                            if (vagas != null) {

                                for (Vaga v : vagas) {

                                    String dtexpira = v.getData().toString();
                                    String[] dtExp = dtexpira.split("-");
                                    String dtExpBR = dtExp[2] + "/" + dtExp[1] + "/" + dtExp[0];

                                    out.print("<tr>");

                                    out.print("<td>");
                                    out.print(v.getNome());
                                    out.print("</td>");

                                    out.print("<td>");
                                    out.print(v.getDescricao());
                                    out.print("</td>");

                                    out.print("<td>");
                                    out.print(v.getSalario());
                                    out.print("</td>");

                                    out.print("<td>");
                                    out.print(dtExpBR);
                                    out.print("</td>");

                                    out.print("<td>");

                                    out.print("<div style='display:inline-block'>");
                                    out.print("<form action='VagaServlet' method='POST'>");
                                    out.print("<input name='acao' type='hidden' value='apagar' />");
                                    out.print("<input name='codigo' type='hidden' value='" + v.getCodigo() + "' />");
                                    out.print("<button class='btn btn-danger' type='submit'>Deletar</button>");
                                    out.print("</form>");
                                    out.print("</div>");

                                    out.print("&nbsp;");
                                    out.print("&nbsp;");

                                    out.print("<div style='display:inline-block'>");
                                    out.print("<form action='edtvaga.jsp' method='POST'>");
                                    out.print("<input name='acao' type='hidden' value='editar' />");
                                    out.print("<input name='codigo' type='hidden' value='" + v.getCodigo() + "' />");
                                    out.print("<button class='btn btn-info' type='submit'>Editar</button>");
                                    out.print("</form>");
                                    out.print("</div>");

                                    out.print("&nbsp;");
                                    out.print("&nbsp;");

                                    out.print("<div style='display:inline-block'>");
                                    out.print("<form action='cadcandidato.jsp' method='POST'>");
                                    out.print("<input name='acao' type='hidden' value='cadastrar' />");
                                    out.print("<input name='codigo' type='hidden' value='" + v.getCodigo() + "' />");
                                    out.print("<button class='btn btn-success' type='submit'>Adicionar Candidato</button>");
                                    out.print("</form>");
                                    out.print("</div>");

                                    out.print("</td>");

                                    out.print("</tr>");
                                }
                            }
                        %>




                    </table>

                </div>
                <div class="col-md-1"></div>
            </div>


        </div>



        <script src="js/jquery.js" ></script>
        <script src="js/bootstrap.js" ></script>
        <script src="js/jquery.mask.js" ></script>
        <script src="js/popper.js" ></script>



        <script type="text/javascript">
            $(function () {





            });



        </script>
    </body>
</html>