<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Juros Simples</title>
</head>
<body>
    <div style="text-align: center; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
        <h1>Calculo de juros simples</h1>
        <a href="index.jsp">Voltar para página inicial</a>
        <br>
        <a href="JurosCompostos.jsp">Calcular juros compostos</a>
        <br><br>
        <form action="JurosSimples.jsp" method="post">
            Valor do emprestimo: <input type="text" name="principal"><br>
            Taxa de juros (em %): <input type="text" name="taxa"><br>
            Tempo (em meses): <input type="text" name="tempo"><br>
            <input type="submit" value="Calcular">
        </form>
        <%
            try {
                String principalStr = request.getParameter("principal");
                String taxaStr = request.getParameter("taxa");
                String tempoStr = request.getParameter("tempo");

                if (principalStr != null && taxaStr != null && tempoStr != null) {
                    // Substituir vírgula por ponto
                    principalStr = principalStr.replace(',', '.');
                    taxaStr = taxaStr.replace(',', '.');

                    double principal = Double.parseDouble(principalStr.trim());
                    double taxa = Double.parseDouble(taxaStr.trim());
                    int tempo = Integer.parseInt(tempoStr.trim());

                    DecimalFormat df = new DecimalFormat("#.##");

                    double juros;
                    double montante;
        %>
        <table style="border: 1px solid black; margin-left: auto; margin-right: auto;">
            <tr>
                <th>Mês</th>
                <th>Juros no mês</th>
                <th>Montante no mês</th>
            </tr>
            <%
                for (int i = 1; i <= tempo; i++) {
                    juros = principal * taxa / 100;
                    montante = principal + juros;

                    out.println("<tr>");
                    out.println("<td>" + i + "</td>");
                    out.println("<td>" + df.format(juros) + "</td>");
                    out.println("<td>" + df.format(montante) + "</td>");
                    out.println("</tr>");
                }
            %>
        </table>
        <h3>Montante total: <%= df.format(principal + (principal * taxa * tempo / 100)) %></h3>
        <%
                }
            } catch (Exception e) {
                out.println("POR FAVOR DIGITE PARAMETROS VALIDOS");
            }
        %>
    </div>
</body>
</html>
