<%-- 
    Document   : cadcandidato
    Created on : 10/10/2022, 15:27:37
    Author     : Chrystian
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="controle.CandidatoControle"%>
<%@page import="modelo.Candidato"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Vaga"%>
<%@page import="controle.VagaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    Vaga vg = new Vaga();
    List<Candidato> candidatospVaga = new ArrayList();
    String acao = "";
    String codigo = "";

    if (request.getParameter("acao") != null && request.getParameter("codigo") != null) {

        acao = request.getParameter("acao");
        codigo = request.getParameter("codigo");
        vg = VagaControle.BuscarPorID(Long.parseLong(codigo));
        if (vg == null) {
            vg = new Vaga();
        }
        candidatospVaga = CandidatoControle.ListarCandidatosPorVaga(Long.parseLong(codigo));
        if (candidatospVaga == null) {
            candidatospVaga = new ArrayList();
        }

    }


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

            <h1> Detalhes da Vaga:</h1>
            <br/>

            <table >
                <tr>
                    <th>Nome da Vaga:</th>
                    <td><%= vg.getNome()%></td>

                </tr>

                <tr>

                    <th>Descricão</th>
                    <td><%= vg.getDescricao()%></td>

                </tr>
                <tr>
                    <th>Expira Em:</th>

                    <td><%= vg.getData()%></td>

                </tr>
                <tr>
                    <th>Salário</th>
                    <td><%= vg.getSalario()%></td>
                </tr>

            </table>
            <br/>


            <div class="row">
                <div class="col-md-12"> 
                    <h2>Cadastrar Candidato:</h2>
                </div>
            </div>
            <br/>
            <form action="">
                <div class="row">
                    <div class="col-md-4"> 
                        <label ><strong>Nome do Candidato</strong></label>
                        <input type="text" placeholder="Nome Completo" name="nome" class="form-control" />
                    </div>
                    <div class="col-md-4"> 
                        <label ><strong>RG</strong></label>
                        <input type="text" name="rg" 
                               placeholder="Somente números, sem traços..." 
                               class="form-control" />
                    </div>
                    <div class="col-md-4"> 
                        <label><strong>E-mail</strong></label>
                        <input type="text"
                               placeholder="email@emiail.com" 
                               name="email" class="form-control" />
                    </div>
                </div>
                <button style="margin: 15px 0;" type="submit" class="btn btn-info">Adicionar Candidato</button>
            </form>

            <br/><br/>

            <div class="row">

                <div class="col-md-12">
                    <h2>Inscritos:</h2>   
                    <br/>
                    <table width="100%">
                        <tr>
                            <th>Nome do Candidato</th>
                            <th>RG</th>
                            <th>Email</th>
                        </tr>

                        <%
                            if (candidatospVaga != null) {

                                for (Candidato c : candidatospVaga) {

                                   

                                    out.print("<tr>");

                                    out.print("<td>");
                                    out.print(c.getNomeCandidato());
                                    out.print("</td>");

                                    out.print("<td>");
                                    out.print(c.getRg());
                                    out.print("</td>");

                                    out.print("<td>");
                                    out.print(c.getEmail());
                                    out.print("</td>");

                                   

                                    out.print("<td>");

                                    out.print("<div style='display:inline-block'>");
                                    out.print("<form action='CandidatoServlet' method='POST'>");
                                    out.print("<input name='acao' type='hidden' value='apagar' />");
                                    out.print("<input name='codigo' type='hidden' value='" + c.getId()+ "' />");
                                    out.print("<button class='btn btn-danger' type='submit'>Deletar</button>");
                                    out.print("</form>");
                                    out.print("</div>");
                                   

                                    out.print("</td>");

                                    out.print("</tr>");
                                }
                            }
                        %>




                    </table>

                </div>

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