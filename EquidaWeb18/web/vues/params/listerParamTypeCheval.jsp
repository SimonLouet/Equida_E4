<%-- 
    Document   : paramRace
    Created on : 19 oct. 2018, 10:29:34
    Author     : Coco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modele.TypeCheval"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/vues/Header.jsp" >
        <jsp:param name="NomPage" value="Liste les ventes" />
    </jsp:include>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paramètre des Races</title>
    </head>
    <body>
        <jsp:include page="/vues/MenuNavigation.jsp" />
        
       
        <div class="container">
            <div class="row">
                <%
            ArrayList<TypeCheval> lesTypeChevaux = (ArrayList)request.getAttribute("pLesTypeChevaux");
            %>
           
            <table  class="table table-bordered table-striped table-condensed">  
               <thead>
                   <tr>
                       <th>L'ID de la race</th>
                       <th>Le nom de la race</th>
                       <th>Description de la race</th>
                   </tr>
               </thead>
               <tbody>
                   <tr>
                       <%
                       for(int i = 0; i < lesTypeChevaux.size();i++)
                       {

                           TypeCheval unTypeCheval = lesTypeChevaux.get(i);
                           out.println("<tr><td>");
                           out.println(unTypeCheval.getId());
                           out.println("</td></tr>");
                           
                           out.println("<tr><td>");
                           out.println(unTypeCheval.getLibelle());
                           out.println("</td></tr>");
                           
                           out.println("<tr><td>");
                           out.println(unTypeCheval.getDescription());
                           out.println("</td></tr>");
                       }
                       %>
                   </tr>
               </tbody>
            </table>
            </div>
        </div>
    </body>
</html>