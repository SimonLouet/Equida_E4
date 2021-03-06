<%-- 
    Document   : Lister les Ventes 
    Created on : 22/06/2017, 07:43
    Author     : Zakina
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modele.Lot"%>
<%@page import="modele.Cheval"%>
<%@page import="modele.Course"%>
<%@page import="modele.Participer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/vues/Header.jsp" >
        <jsp:param name="NomPage" value="Lister mes Chevaux" />
    </jsp:include>

    <body>

        <jsp:include page="/vues/MenuNavigation.jsp" />

        <div class="container">
            <div class="row">
                <h3>Lister mes chevaux</h3>
                <%
                    ArrayList<Cheval> lesChevaux = (ArrayList) request.getAttribute("pLesChevaux");
                %>
                <div class="col s1 offset-s11">  
                    <a class="btn-floating btn-large waves-effect waves-light" href='../ServletMesChevaux/chevalAjouter'><i class="material-icons">add</i></a>
                </div> 

                <table  class="table table-bordered table-striped table-condensed">  
                    <thead>
                        <tr>             
                            <th>Nom</th>
                            <th>Sexe</th>  
                            <th>Sire</th>
                            <th>Type de cheval</th>
                            <th></th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <%
                                for (int i = 0; i < lesChevaux.size(); i++) {

                                    Cheval unCheval = lesChevaux.get(i);

                                    out.println("<td>");
                                    out.println("<a href ='../ServletVentes/chevalConsulter?id=" + unCheval.getId() + "'>");
                                    out.println(unCheval.getNom());
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println(unCheval.getSexe());
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println(unCheval.getSire());
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println(unCheval.getTypeCheval().getLibelle());
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println("<a class=\"waves-effect waves-light btn-small\" href ='../ServletMesChevaux/SupprimerMesChevaux?codeCheval=" + unCheval.getId() + "'><i class=\"material-icons\">delete</i></a>");
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println("<a class=\"waves-effect waves-light btn-small\" href ='../ServletMesChevaux/chevalModif?id=" + unCheval.getId() + "'><i class=\"material-icons\">create</i></a>");
                                    out.println("</td>");


                                    out.println("</td>");
                                    out.println("</tr>");

                                }

                            %>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="/vues/footer.jsp"/>
    </body>
</html>
