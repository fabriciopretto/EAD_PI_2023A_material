<%-- 
    Document   : index
    Created on : Jul 21, 2023, 1:44:05 PM
    Author     : pretto
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <form action="pagina2.jsp" method="post">
            <label for="fname">First name:</label><br>
            <input type="text" id="fname" name="fname"><br>
            
            <label for="lname">Last name:</label><br>
            <input type="text" id="lname" name="lname">
            
            <input type="submit" value="Enviar">
        </form>


        <hr> 
        <hr> 
        <hr> 
        <hr> 
              

        <%
            int idade = 23;
            Date dataAtual = new Date();
        %>

        <p>Idade: <%= idade%></p>
        <p>Idade: <%= dataAtual%></p>

        <%
            for (int i = 0; i < 10; i++) {
        %>
        <p>Dentro do FOR.</p>
        <p>Idade: <%= i%></p>
        <%
            }
        %>

    </body>
</html>
