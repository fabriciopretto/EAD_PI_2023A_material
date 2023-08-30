<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <%@ include file = "menu.jsp" %>
        <!-- JQUERY-->
        <script src="js/jquery-3.4.1.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(document).ready(function () {

                $('#botaoAjax').click(function ()
                {
                    $.get("ServletAjaxManual?categ=t", function (resultado) {
                        $("#retornoAjax").html(resultado);
                    });
                }
                );

                $('#botaoAjax2').click(function ()
                {
                    $.get("sucesso.jsp", function (resultado) {
                        $("#retornoAjax2").html(resultado);
                    });
                }
                );

                $('#botaoAjax3').click(function ()
                {
                    $('#lista').hide("slow");
                }
                );

                $('#botaoAjax4').click(function ()
                {
                    $('#lista').show("slow");
                }
                );

                $('#pesquisaCateg').click(function ()
                {
                    var id = $('#idCateg').val();
                    var url = "acao?a=consultaCateg&id=".concat(id);
                    $.get(url, function (resultado) {
                        $("#descricaoCateg").val(resultado);
                    });
                }
                );
            });
        </script>
    </head>
    <body>
        <h3>Chamadas JQuery</h3>

        <table class="responsive" border="1">
            <th>Ação</th>
            <th>Resultado</th>

            <tr>
                <td>
                    <input type="button" value="Ajax - JQuery 1" name="botaoAjax" id="botaoAjax"/>
                </td>
                <td>
                    <div id="retornoAjax"></div>
                </td>                    
            </tr>
            <tr>
                <td>
                    <input type="button" value="Ajax - JQuery 2" name="botaoAjax2" id="botaoAjax2"/>
                </td>
                <td>
                    <div id="retornoAjax2"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" value="Esconde lista" name="botaoAjax3" id="botaoAjax3"/>            
                    <br>
                    <input type="button" value="Exibe lista" name="botaoAjax4" id="botaoAjax4"/>
                </td>
                <td>
                    <div id="lista">
                        <ul>
                            <li>Item 1</li>
                            <li>Item 2</li>
                            <li>Item 3</li>
                            <li>Item 4</li>
                        </ul>
                    </div>
                </td>
            </tr>
        </table>

        <br>
        <br>
        <h4>Consulta de dados via JQuery</h4>        
        <label>Código categoria</label>
        <input type="text" name="idCateg" id="idCateg">
        <input type="button" value="Consultar" name="pesquisaCateg" id="pesquisaCateg"/>
        <input type="text" name="descricaoCateg" id="descricaoCateg">
    </body>
</html>

