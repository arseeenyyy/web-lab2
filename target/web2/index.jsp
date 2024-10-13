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
        <form id="dataForm">
            <input id="name" name="name" placeholder="Enter your name" required/>
            <input id="age" name="age" type="number" placeholder="Enter your age" required>
            <button id="submit" type="submit">Submit</button>
        </form>

        <!-- Таблица для отображения данных -->
        <h2>Submitted Data</h2>
        <table border="1" id="resultTable">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Age</th>
                </tr>
            </thead>
            <tbody>
                <!--  -->
            </tbody>
        </table>
        <script src="index.js"></script>
    </body>
</html>
