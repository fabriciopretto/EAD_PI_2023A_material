<%-- 
    Document   : grafico1
    Created on : May 4, 2023, 5:45:09 PM
    Author     : pretto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            .bloco {                
                padding: 0 200px 200px 200px;
            }
        </style>

        <%
            String pontoBrasil = "'Arroio do Meio, RS', 200000, 190000";
        %>

        <-- https://developers.google.com/chart/interactive/docs/quick_start -->
        <!--<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>-->
        <script type="text/javascript" src="js/loader.js"></script>

        <script>
            google.charts.load('current', {packages: ['corechart', 'bar']});
            google.charts.setOnLoadCallback(drawBasic);
            google.charts.setOnLoadCallback(drawMultSeries);

            function drawBasic() {

                var data = new google.visualization.DataTable();
                data.addColumn('timeofday', 'Time of Day');
                data.addColumn('number', 'Motivation Level');

                data.addRows([
                    [{v: [8, 0, 0], f: '8 am'}, 1],
                    [{v: [9, 0, 0], f: '9 am'}, 2],
                    [{v: [10, 0, 0], f: '10 am'}, 3],
                    [{v: [11, 0, 0], f: '11 am'}, 4],
                    [{v: [12, 0, 0], f: '12 pm'}, 5],
                    [{v: [13, 0, 0], f: '1 pm'}, 6],
                    [{v: [14, 0, 0], f: '2 pm'}, 7],
                    [{v: [15, 0, 0], f: '3 pm'}, 8],
                    [{v: [16, 0, 0], f: '4 pm'}, 9],
                    [{v: [17, 0, 0], f: '5 pm'}, 10],
                ]);

                var options = {
                    title: 'Motivation Level Throughout the Day',
                    hAxis: {
                        title: 'Time of Day',
                        format: 'h:mm a',
                        viewWindow: {
                            min: [7, 30, 0],
                            max: [17, 30, 0]
                        }
                    },
                    vAxis: {
                        title: 'Rating (scale of 1-10)'
                    }
                };

                var chart = new google.visualization.ColumnChart(
                        document.getElementById('chart_div'));

                chart.draw(data, options);
            }

            function drawMultSeries() {
                var data = google.visualization.arrayToDataTable([
                    ['City', '2010 Population', '2000 Population'],
                    ['New York City, NY', 8175000, 8008000],
                    ['Los Angeles, CA', 3792000, 3694000],
                    ['Chicago, IL', 2695000, 2896000],
                    ['Houston, TX', 2099000, 1953000],
                    [<%= pontoBrasil%>],
                    ['Philadelphia, PA', 1526000, 1517000]
                ]);

                var options = {
                    title: 'Population of Largest U.S. Cities',
                    chartArea: {width: '50%'},
                    hAxis: {
                        title: 'Total Population',
                        minValue: 0
                    },
                    vAxis: {
                        title: 'City'
                    }
                };

                var chart = new google.visualization.BarChart(document.getElementById('chart_div_bar'));
                chart.draw(data, options);
            }
        </script>
    </head>

    <body>
        <%@include file="menu.jsp" %>

        <h1>Hello World!</h1>

        <div class="bloco">
            <div id="chart_div"></div>
            <div id="chart_div_bar"></div>
        </div>
    </body>
</html>