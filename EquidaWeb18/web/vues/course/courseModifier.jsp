<%-- 
    Document   : courseModifier
    Created on : 20 nov. 2018, 15:46:33
    Author     : Coco
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modele.Course"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier une course</title>
    </head>
    <body>
        
        <div class="container">
            <div class="row">
                <h3>Modifier une course</h3>

                <%
                Course unCourse = (Course)request.getAttribute("pCourse");
                %>

                <form class="table table-bordered table-striped table-condensed" action="paysModif?id=<% out.println(unCourse.getId());%>" method="POST">
                    <label id="id" name="id">Id de la course :</label> 
                    <input value="<% out.println(unCourse.getId());%>" id="id" name="id" />


                    <label id="nom" name="nom">Nom de la course:</label> 
                    <input value="<% out.println(unCourse.getNom());%>" id="nom" name="nom" />


                    <label id="lieu" name="lieu">Lieu de la course:</label> 
                    <input value="<% out.println(unCourse.getLieu());%>" id="lieu" name="lieu" />


                    <label id="date" name="date">Date de la course:</label> 
                    <input value="<% out.println(unCourse.getDate());%>" id="date" name="date" />


                    <div class="input-field col-s6">  
                        <button class="btn waves-effect waves-light" type="submit" name="valider">Valider<i class="material-icons right">send</i></button>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="/vues/footer.jsp"/>
    </body>
</html>