<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.github.arseeenyyy.util.Point" %>
<!DOCTYPE html>
<html lang="en">    
    <head>
        <meta charset="UTF-8">
        <meta name="author" content="Rubtsov Arseniy Dmitrievich">
        <meta name="description" content="Web-programming, lab2">
        <meta name="keywords" content="ITMO, Web-programming, VT">
        <title>Laboratory work no. 2 | Web-programming | ResultPage </title>
        <style>
        </style>
    </head>
    <body>
        <header>
            <h1>Web - programming | Laboratory no. 2 | Var no. 115218 </h1>
            <div id="credit">
                <a href="https://github.com/arseeenyyy">Rubtsov Arseniy Dmitrievich | P3206</a>
            </div>
        </header>

        <table border="1">
            <tr>
                <th>X</th>
                <th>Y</th>
                <th>R</th>
                <th>Current Time</th>
                <th>Execution Time</th>
                <th>Hit result</th>
            </tr>

            <%
                List<Point> points = (List<Point>) session.getAttribute("points");
                if (points != null) {
                    for (Point point : points) {
            %>
                        <tr>
                            <td><%= point.getX() %></td>
                            <td><%= point.getY() %></td>
                            <td><%= point.getR() %></td>
                            <td><%= new java.util.Date() %></td>
                            <td><%= point.getExecutionTime() %></td>
                            <td><%= point.getResult() ? "Yes" : "No" %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="6">No data available</td>
                </tr>
            <%
                }
            %>
        </table>

        <div>
            <a href="index.jsp">Return to main page</a>
        </div>
    </body>
</html>
