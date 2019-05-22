<%-- 
    Document   : ClientAjouter
    Created on : 22/06, 16:35:27
    Author     : Zakina
--%>

<%@page import="formulaires.ConnexionForm"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/vues/Header.jsp" >
        <jsp:param name="NomPage" value="Permissions" />
    </jsp:include>

    <body>

        <jsp:include page="/vues/MenuNavigation.jsp" />

        <div class="container">
            <div class="row">
                <h1>Vous n'avez pas la permission d'accéder à cette page !</h1>
                
            </div>
        </div>

    </body>
</html>
