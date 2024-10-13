package com.github.arseeenyyy;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/check")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String age = request.getParameter("age");

        Point point = new Point(name, age);
        HttpSession session = request.getSession(); 
        List<Point> points = (List<Point>) session.getAttribute("points"); 
        if (points == null) {
            points = new ArrayList<>();
            session.setAttribute("points", points);
        }
        points.add(point);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        String jsonResponse = gson.toJson(point);

        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}
