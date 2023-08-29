<%-- 
    Document   : categoria
    Created on : Aug 23, 2023, 10:18:34 AM
    Author     : pretto
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="entidade.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <%
        Categoria c = (Categoria) request.getAttribute("categoria");

        if (c == null) {
            c = new Categoria();
        }
    %>

    <body>

        <%@include file="menu.jsp" %>
        
        <h1>Cadastro de categoria</h1>

        <form method="post" action="acao?a=salvarCateg">
            <label for="codigo">Código</label><br>
            <input type="text" id="codigo" name="codigo" readonly="" value="<%= c.getCodigo()%>"><br>

            <label for="descricao">Descrição</label><br>
            <input type="text" id="descricao" name="descricao" value="<%= c.getDescricao()%>">

            <br> <br>
            <input type="submit" name="salvar" value="Salvar">
        </form>


        <h3>Listagem das categorias</h3>

        <%            ArrayList<Categoria> categs = new CategoriaDAO().consultar();
        %>

        <table class="table">
            <th>Código</th>
            <th>Descrição</th>
            <th>Editar</th>
            <th>Excluir</th>
                <%
                    for (int i = 0; i < categs.size(); i++) {
                %>
            <tr>
                <td><%= categs.get(i).getCodigo()%></td>
                <td><%= categs.get(i).getDescricao()%></td>      
                <td><a href="acao?a=editarCateg&id=<%= categs.get(i).getCodigo()%>" class="btn btn-success">Editar</a></td>
                <td><a href="acao?a=excluirCateg&id=<%= categs.get(i).getCodigo()%>" class="btn btn-danger">Excluir</a></td>
            </tr>
            <%
                }
            %>

        </table>
    </body>
</html>
