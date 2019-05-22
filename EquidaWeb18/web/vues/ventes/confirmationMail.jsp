<%-- 
    Document   : envoyerMail
    Created on : 6 nov. 2018, 13:28:44
    Author     : slam
--%>
<%@page import="modele.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.Courriel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/vues/Header.jsp" >
    <jsp:param name="NomPage" value="Création du mail" />
    </jsp:include>
    
    <body>
        
        <div class="container">
            <div class="row">
                <div class="container">
                    <h5>Le mail a bien été envoyé</h5>
                </div>
            </div>
        </div>
        <jsp:include page="/vues/MenuNavigation.jsp" />
    </body>
</html>