<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%@ include file = "menu.jsp" %>

        <script type="text/javascript">

            var requisicao = false;

            try {
                requisicao = new XMLHttpRequest();
            } catch (tryParaMicrosoft) {
                try {
                    requisicao = new ActiveXObject("Msxml2.XMLHTTP"); // objeto Microsoft
                } catch (tryParaOutros) {
                    try {
                        requisicao = new ActiveXObject("Microsoft.XMLHTTP"); // objeto Outros
                    } catch (failed) {
                        requisicao = false;
                    }
                }
            }

            if (!requisicao)
                alert("Erro incializando XMLHttpRequest!");

            function getCategorias() {

                var url = "ServletAjaxManual?categ=t";

                requisicao.open("GET", url, true);
                requisicao.onreadystatechange = atualizarPagina;
                requisicao.send(null);
            }

            function atualizarPagina() {
                if (requisicao.readyState == 4) {
                    if (requisicao.status == 200) {

                        var conteudo = "";
                        var response = requisicao.responseText.split("|");

                        for (i = 0; i < response.length; i++) {
                            conteudo += response[i] + "\n";
                        }

                        document.getElementById("texto").value = conteudo;
                        document.getElementById("retornoAjax").innerHTML = conteudo;

                    } else
                        alert("Error: Status " + requisicao.status);
                }
            }
        </script> 
    </head>
    <body>
        <input type="button" value="Consultar categorias" size="30" name="botao" onClick="getCategorias();" />

        <br>

        <textarea id="texto" cols=40 rows=10>      
        </textarea>  

        <div id="retornoAjax">
        </div>
    </body>
</html>
