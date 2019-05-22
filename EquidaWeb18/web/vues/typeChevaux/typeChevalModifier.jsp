<%-- 
    Document   : typeChevalModifier
    Created on : 9 nov. 2018, 11:04:05
    Author     : Coco
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modele.TypeCheval"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier la race du cheval</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h3>Modifier le type de cheval</h3>

                <%
                TypeCheval unTypeCheval = (TypeCheval)request.getAttribute("pTypeCheval");
                %>

                <form class="table table-bordered table-striped table-condensed" action="typeChevalModif?id=<% out.println(unTypeCheval.getId());%>" method="POST">
                    <label id="id" name="id">ID de la race :</label> 
                    <input value="<% out.println(unTypeCheval.getId());%>" id="id" name="id" />

                    <label id="prenom" name="prenom">PRENOM :</label> 
                    <input value="<% out.println(unTypeCheval.getLibelle());%>" id="prenom" name="prenom" />


                    <label id="description" name="description">Description de la race :</label> 
                    <input value="<% out.println(unTypeCheval.getDescription());%>" id="description" name="description" />


                    <div class="input-field col-s6">  
                        <button class="btn waves-effect waves-light" type="submit" name="valider">Valider<i class="material-icons right">send</i></button>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="/vues/footer.jsp"/>
    </body>
</html>
