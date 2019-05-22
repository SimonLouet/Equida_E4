<%-- 
    Document   : listerLesClients
    Created on : 12 oct. 2018, 06:42:02
    Author     : slam
--%>
<%@page import="modele.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/vues/Header.jsp" >
        <jsp:param name="NomPage" value="Liste les ventes" />
    </jsp:include>

    <body>

        <jsp:include page="/vues/MenuNavigation.jsp" />

        <div class="container">
            <div class="row">
                <h3>Liste des clients</h3>
                <%
                    ArrayList<Client> lesClients = (ArrayList) request.getAttribute("pLesClients");
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

                        <%
                            for (int i = 0; i < lesClients.size(); i++) {

                                Client unClient = lesClients.get(i);

                                out.println("<tr><td>");
                                out.println(unClient.getNom());
                                out.println("</td>");

                                out.println("<td>");
                                out.println(unClient.getPrenom());
                                out.println("</td>");

                                out.println("<td>");
                                if (unClient.getTitre() != null) {
                                    out.println(unClient.getTitre());
                                }
                                out.println("</td>");


                                out.println("<td>");
                                out.println(unClient.getCopos());
                                out.println("</td>");

                                out.println("<td>");
                                out.println(unClient.getUnPays().getNom());
                                out.println("</td>");

                                out.println("<td>");
                                out.println(unClient.getMail());
                                out.println("</td>");


                                out.println("<td>");
                                out.println("<a class=\"waves-effect waves-light btn-small\" href ='../ServletClient/clientModif?id=" + unClient.getId() + "'><i class=\"material-icons\">create</i></a>");
                                out.println("</td></tr>");

                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="/vues/footer.jsp"/>
    </body>
</html>
