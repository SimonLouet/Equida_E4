<%-- 
    Document   : ClientAjouter
    Created on : 22/06, 16:35:27
    Author     : Zakina
--%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.lang.System"%>
<%@page import="java.util.Date"%>
<%@page import="modele.Vente"%>
<%@page import="modele.Compte"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/vues/Header.jsp" >
        <jsp:param name="NomPage" value="Accueil" />
    </jsp:include>

    <body>

        <jsp:include page="/vues/MenuNavigation.jsp" />

        <div class="container">
            <div class="row">
                <%
                    Calendar c = Calendar.getInstance();
                    Date date = c.getTime();

                %>

                <div class="row">
                    <h3 >Présentation</h3>

                    Créée en 2006, Equida est une société spécialisée dans la vente aux enchères de chevaux de course. 
                    Avec un effectif de vingt-sept personnes, la société a réalisé en 2012 un chiffre d’affaires de 87 millions d’euros.
                    Ses clients sont des vendeurs de chevaux, principalement des haras, des entraîneurs et de grands propriétaires de chevaux,
                    situés en France et à l’étranger. Pour être plus proche de sa clientèle étrangère, elle s’appuie sur une quinzaine de correspondants
                    répartis dans de nombreux pays comme l’Irlande, la Turquie, ou encore le Japon.
                </div>
            </div>
            <%                ArrayList<Vente> lesVentes = (ArrayList) request.getAttribute("pLesVentes");

            %>
            <!--Affichage des ventes-->
            <div class="row">
                <h3 >Vente à venir</h3>
                <table>
                    <thead>
                    <th>Nom</th>
                    <th>Catégorie</th>
                    <th>Date début</th>
                    </thead>

                    <tbody>
                        <%                        
                            boolean venteApresDateJour = false;
                            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat formatterfr = new SimpleDateFormat("dd/MM/yyyy");
                            
                            for (int i = 0; i < lesVentes.size(); i++) {
                                Vente uneVente = lesVentes.get(i);

                                //SOUS LE JDK 1.8 
                                LocalDate dateJourld = java.time.LocalDate.now();
                                String dateJourString = dateJourld.toString();

                                String dateVenteString = uneVente.getDateDebutVente();

                               
                                Date dateVente = formatter.parse(dateVenteString);
                                Date dateJour = formatter.parse(dateJourString);

                                
                                if (dateVente.after(dateJour)) {
                                    //affichage d'une vente
                                    out.println("<tr><td>");
                                    out.println(uneVente.getNom());
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println(uneVente.getUneCategVente().getLibelle());
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println(formatterfr.format(dateVente));
                                    out.println("</td>");

                                    //s'il y a une vente pas afficher "pas de vente prévus"
                                    venteApresDateJour = true;
                                }
                            }
                            //Pas de Vente prévus
                            if (venteApresDateJour == false) {
                                out.println("<tr><td colspan =4 style='text-align:center';>");
                                out.println("<h4><strong>Pas de vente prévus</strong></h4>");
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
