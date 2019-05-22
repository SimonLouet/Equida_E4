<%-- 
    Document   : lieuVenteModifier
    Created on : 20 nov. 2018, 14:32:49
    Author     : Coco
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modele.Lieu"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier un lieu de vente</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h3>Modifier un lieu de vente</h3>

                <%
                Lieu unLieuVente = (Lieu)request.getAttribute("pLieuVente");
                %>

                <form class="table table-bordered table-striped table-condensed" action="paysModif?id=<% out.println(unPays.getCode());%>" method="POST">

                    <label id="ville" name="ville">Ville du lieu de vente :</label> 
                    <input value="<% out.println(unLieuVente.getVille());%>" id="ville" name="ville" />


                    <label id="nbBoxes" name="nbBoxes">Nombre de boxes du lieu de vente :</label> 
                    <input value="<% out.println(unLieuVente.getNbBoxes());%>" id="nbBoxes" name="nbBoxes" />


                    <label id="commentaire" name="commentaire">Commentaire du lieu de vente :</label> 
                    <input value="<% out.println(unLieuVente.getCommentaire());%>" id="commentaire" name="commentaire" />


                    <div class="input-field col-s6">  
                        <button class="btn waves-effect waves-light" type="submit" name="valider">Valider<i class="material-icons right">send</i></button>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="/vues/footer.jsp"/>
    </body>
</html>
