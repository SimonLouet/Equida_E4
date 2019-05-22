<%-- 
    Document   : paysModifier
    Created on : 20 nov. 2018, 13:37:17
    Author     : Coco
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modele.Pays"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier un pays</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h3>Modifier un pays</h3>

                <%
                Pays unPays = (Pays)request.getAttribute("pPays");
                %>

                <form class="table table-bordered table-striped table-condensed" action="paysModif?id=<% out.println(unPays.getCode());%>" method="POST">
                    <label id="code" name="code">Code du pays :</label> 
                    <input value="<% out.println(unPays.getCode());%>" id="code" name="code" />

                    <label id="nom" name="nom">Nom du pays:</label> 
                    <input value="<% out.println(unPays.getNom());%>" id="nom" name="nom" />

                    <div class="input-field col-s6">  
                        <button class="btn waves-effect waves-light" type="submit" name="valider">Valider<i class="material-icons right">send</i></button>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="/vues/footer.jsp"/>
    </body>
</html>
