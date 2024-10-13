<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List"%>
<%@ page import="com.github.arseeenyyy.Point" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Form Example</title>
    </head>
    <body>
        <form action="check" method="post">
            <input name="name" placeholder="Enter your name" required/>
            <input name="age" type="number" placeholder="Enter your age" required>
            <input type="submit" value="Submit">
        </form>

        <!-- Таблица для отображения данных -->
        <h2>Submitted Data</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Age</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Извлекаем список объектов Point из сессии
                    List<Point> points = (List<Point>) session.getAttribute("points");
                    if (points != null) {
                        for (Point point : points) {
                %>
                            <tr>
                                <td><%= point.getName() %></td>
                                <td><%= point.getAge() %></td>
                            </tr>
                <% 
                        }
                    } else { 
                %>
                    <tr>
                        <td colspan="2">No data available</td>
                    </tr>
                <% 
                    } 
                %>
            </tbody>
        </table>
    </body>
</html>