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
        <jsp:include page="/vues/MenuNavigation.jsp" />
        
        <div class="container">
            <div class="row">
            <%
                Courriel courriel = (Courriel)request.getAttribute("pCourriel");
                
            %>
            <h3>Mail bien envoyé.</h3>
            <table class="table table-bordered table-striped table-condensed">

                    <tr><td>Message envoyé le</td><td><% out.println(" " + courriel.getDate()); %></td>  </tr>
                    <tr><td>Vente :</td><td><% out.println(" " + courriel.getDate()); %></td>  </tr>
                    <tr><td>Objet :</td><td><%out.println("Objet : " + courriel.getObjet()); %></td>  </tr>
                    <tr><td>Corps :</td><td><% out.println("Corps : " + courriel.getCorps()); %></td>  </tr>
                    <tr><td>Pièce jointe :</td><td> <%
                    for (int i=0; i < courriel.getLesPieceJointes().size(); i++){
       
                       out.println("<a href='" + request.getContextPath() + "/upload/" + courriel.getLesPieceJointes().get(i).getChemin() + "'>" + courriel.getLesPieceJointes().get(i).getChemin() + "</a>");      
                    }
                    %></td>  </tr>
                </table>
            </div>
        </div>
        <jsp:include page="/vues/footer.jsp"/>
    </body>
</html>