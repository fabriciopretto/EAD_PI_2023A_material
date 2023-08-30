<%-- 
    Document   : cadPessoa
    Created on : Mar 23, 2023, 9:20:16 PM
    Author     : pretto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%@include file="menu.jsp" %>

        <h1>Consulta XXX</h1>

        <form>
            <label for="codigo">Código</label>
            <input type="text" id="codigo" name="codigo">

            <label for="descricao">Descrição</label>
            <input type="text" id="descricao" name="descricao">

            <label for="data_ini">Data inicial</label>
            <input type="date" id="data_ini" name="data_ini">

            <label for="data_fim">Data fim</label>
            <input type="date" id="data_fim" name="data_fim">

            <br><br>

            <input type="submit" value="Pesquisar">

            <hr>

            <table class="table">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Editar</th>
                        <th scope="col">Excluir</th>
                        <th scope="col">#</th>
                        <th scope="col">Descrição</th>
                        <th scope="col">Data Inicial</th>
                        <th scope="col">Data Final</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a href="" class="btn btn-info">ED</a></td>
                        <td><a href="" class="btn btn-danger">EX</a></td>
                        <th scope="row">1</th>
                        <td>Categ 1</td>
                        <td>01/01/2023</td>
                        <td>10/01/2023</td>
                    </tr>
                    <tr>
                        <td><a href="" class="btn btn-info">ED</a></td>
                        <td><a href="" class="btn btn-danger">EX</a></td>
                        <th scope="row">2</th>
                        <td>Categ 2</td>
                        <td>03/01/2023</td>
                        <td>07/02/2023</td>
                    </tr>
                    <tr>
                        <td><a href="" class="btn btn-info">ED</a></td>
                        <td><a href="" class="btn btn-danger">EX</a></td>
                        <th scope="row">3</th>
                        <td>Categ 3</td>
                        <td>16/01/2023</td>
                        <td>22/01/2023</td>
                    </tr>
                </tbody>
            </table>

        </form>


    </body>
</html>
