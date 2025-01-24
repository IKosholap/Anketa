package com.example.anketa;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.http.*;

public class AnketaServlet extends HttpServlet {

    public AnketaServlet() {
    }



    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map params = new HashMap();

        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String age = request.getParameter("age");
        String uns1 = request.getParameter("question1");
        String uns2 = request.getParameter("question2");

        params.put("name", name);
        params.put("surname", surname);
        params.put("age", age);
        params.put("answer1", uns1);
        params.put("answer2", uns2);

        HttpSession session = request.getSession(true);
        session.setAttribute("params", params);

        response.sendRedirect("index.jsp");
    }



    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String exit = request.getParameter("a");
        HttpSession session = request.getSession(false);

        if ("exit".equals(exit) && (session != null))
            session.removeAttribute("params");

        response.sendRedirect("index.jsp");

    }
    public void destroy() {
    }
}