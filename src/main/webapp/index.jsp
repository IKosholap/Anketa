<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Anketa</title>
    </head>
    <body>
        <% Map params = (HashMap) session.getAttribute("params"); %>

        <% if (params == null || "".equals(params)) { %>
         <form action="/anketa" method="POST">
             Name: <input type="text" name="name"><br>
             Surname: <input type="text" name="surname"><br>
             Age: <input type="text" name="age"><br>
             Du you like pizza? <select name="question1">
                                 <option value="yes">Yes</option>
                                 <option value="no">No</option>
                                </select>

             Do you like pasta? <select name="question2">
                                 <option value="yes">Yes</option>
                                 <option value="no">No</option>
                                </select>
             <input type="submit" />
         </form>
        <% } else if(params.get("name")=="" || params.get("name")=="" || params.get("name")=="") { %>

            <H1>Sorry please input correct information</H1>
            <br>Click this link to <a href="/anketa?a=exit"> refill the form</a>

        <% } else { %>
            <h1>Hello <%= params.get("surname") %> <%= params.get("name")%></h1>
            <br>your age is <%= params.get("age")%>
            <br>You like pizza- <%= params.get("answer1")%>
            <br>You like pasta- <%= params.get("answer2")%>
            <br>Click this link to <a href="/anketa?a=exit"> refill the form</a>
        <% } %>
    </body>
</html>