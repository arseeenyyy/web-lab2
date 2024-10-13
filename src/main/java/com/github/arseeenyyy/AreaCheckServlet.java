package com.github.arseeenyyy;

import com.github.arseeenyyy.util.Checker;
import com.github.arseeenyyy.util.Point;
import com.github.arseeenyyy.util.Validator;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        long startTime = System.nanoTime(); 
        try {
            int x = Integer.parseInt(request.getParameter("x")); 
            float y = Float.parseFloat(request.getParameter("y")); 
            int r = Integer.parseInt(request.getParameter("r"));

            if (Validator.validateX(x) && Validator.validateY(y) && Validator.validateR(r)) {
                boolean isHit = Checker.isHit(x, y, r);
                long endTime = System.nanoTime();
                Point point = new Point(x, y, r, isHit, endTime - startTime);
                HttpSession session = request.getSession(); 
                List<Point> points = (List<Point>) session.getAttribute("points");
                if (points == null) {
                    points = new ArrayList<>();
                    session.setAttribute("points", points);
                }
                points.add(point);
                buildMessage(response);
                Gson gson = new Gson();
                String jsonResponse = gson.toJson(point);
                PrintWriter writer = response.getWriter();
                writer.println(jsonResponse);
                writer.flush();
            }
        } catch (IOException exception) {

        }
    }
    private void buildMessage(HttpServletResponse response) {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
    }
}
