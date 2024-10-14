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
        <link rel="stylesheet" href="stylesheet.css" type="text/css">
    </head>
    <body>
        <table id="result-table">
            <tr>
                <th>X</th>
                <th>Y</th>
                <th>R</th>
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
                            <td><%= point.getExecutionTime() %></td>
                            <td><%= point.getResult() ? "hit" : "miss" %></td>
                        </tr>
            <%
                    }
                } else {
            %>
            <%
                }
            %>
        </table>
    </body>
</html>
