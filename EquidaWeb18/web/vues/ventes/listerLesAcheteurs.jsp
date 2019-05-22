<%-- 
    Document   : listerLesClients
    Created on : 22 juin 2017, 10:23:05
    Author     : Zakina
--%>

<%@page import="modele.Acheteur"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/vues/Header.jsp" >
    <jsp:param name="NomPage" value="Liste des acheteur" />
    </jsp:include>

    <body>

        <jsp:include page="/vues/MenuNavigation.jsp" />

        <div class="container">
            <div class="row">
                <h3>Liste des Acheteurs</h3>
                <%
               ArrayList<Acheteur> lesAcheteurs = (ArrayList)request.getAttribute("pLesAcheteurs");
                %>
                <div class="col s1 offset-s11"> 
                    <a class="btn-floating btn-large waves-effect waves-light"href='../ServletClient/ajouterClient'><i class="material-icons">add</i></a>
                </div> 

                <table  class="table table-bordered table-striped table-condensed">   
                    <thead>
                        <tr>             
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th>Civilité</th>
                            <th>Code Postal</th>
                            <th>Pays</th>
                            <th>Mail</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <%
                            for(int i = 0; i < lesAcheteurs.size();i++)
                            {

                                Acheteur unAcheteur = lesAcheteurs.get(i);

                                out.println("<td>");
                                out.println(unAcheteur.getNom());
                                out.println("</td>");

                                out.println("<td>");
                                out.println(unAcheteur.getPrenom());
                                out.println("</td>");
                                
                                out.println("<td>");
                                if (unAcheteur.getTitre() != null) {
                                    out.println(unAcheteur.getTitre());
                                }
                                out.println("</td>");
                                
                                out.println("<td>");
                                out.println(unAcheteur.getUnPays().getNom());
                                out.println("</td>");

                                out.println("<td>");
                                out.println(unAcheteur.getCopos());
                                out.println("</td>");

                                out.println("<td>");
                                out.println(unAcheteur.getMail());
                                out.println("</td>");
                                

                                out.println("<td>");
                                out.println("<a class=\"waves-effect waves-light btn-small\" href ='../ServletClient/clientModif?id=" + unAcheteur.getId() + "'><i class=\"material-icons\">create</i></a>");
                                out.println("</td></tr>");

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
