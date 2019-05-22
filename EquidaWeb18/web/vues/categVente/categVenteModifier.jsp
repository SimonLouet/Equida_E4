<%-- 
    Document   : categVenteModifier
    Created on : 23 nov. 2018, 08:31:39
    Author     : Coco
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modele.CategVente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier une catégorie de vente</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h3>Modifier une catégorie de vente</h3>

                <%
                CategVente unCategVente = (CategVente)request.getAttribute("pCategVente");
                %>

                <form class="table table-bordered table-striped table-condensed" action="paysModif?id=<% out.println(unCategVente.getCode());%>" method="POST">
                    <label id="code" name="code">Code du pays :</label> 
                    <input value="<% out.println(unCategVente.getCode());%>" id="code" name="code" />


                    <label id="nom" name="libelle">Nom du pays:</label> 
                    <input value="<% out.println(unCategVente.getLibelle());%>" id="libelle" name="libelle" />


                    <INPUT TYPE="submit" NAME="valider" VALUE="valider">
                      </td></tr>
                </form>
            </div>
        </div>
        <jsp:include page="/vues/footer.jsp"/>
    </body>
</html>
