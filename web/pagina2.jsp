<%-- 
    Document   : pagina2
    Created on : Jul 21, 2023, 1:57:31 PM
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
        <h1>Página 2</h1>

        <%
            String primeiroNome = request.getParameter("fname");
            String segundoNome = request.getParameter("lname");
        %>

        <p>Primeiro nome: <%= primeiroNome%></p>
        <p>Segundo nome: <%= segundoNome%> </p>

    </body>
</html>
