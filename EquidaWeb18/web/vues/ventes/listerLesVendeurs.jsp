<%-- 
    Document   : listerLesClients
    Created on : 16 october 2018, 10:23:05
    Author     : Simon
--%>


<%@page import="modele.Vendeur"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/vues/Header.jsp" >
        <jsp:param name="NomPage" value="Liste des vendeurs" />
    </jsp:include>

    <body>

        <jsp:include page="/vues/MenuNavigation.jsp" />

        <div class="container">
            <div class="row">
                <h3>Liste des Vendeur</h3>
                <%
                    ArrayList<Vendeur> lesVendeurs = (ArrayList) request.getAttribute("pLesVendeurs");
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
                                for (int i = 0; i < lesVendeurs.size(); i++) {

                                    Vendeur unVendeur = lesVendeurs.get(i);
                                    out.println("<tr><td>");
                                    out.println(unVendeur.getId());
                                    out.println("</a></td>");

                                    out.println("<td>");
                                    out.println(unVendeur.getNom());
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println(unVendeur.getPrenom());
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println(unVendeur.getUnPays().getNom());
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println(unVendeur.getCopos());
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println(unVendeur.getMail());
                                    out.println("</td>");
                                    
                                    
                                    out.println("<td>");
                                    out.println("<a class=\"waves-effect waves-light btn-small\" href ='../ServletClient/clientModif?id=" + unVendeur.getId() + "'><i class=\"material-icons\">create</i></a>");
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
