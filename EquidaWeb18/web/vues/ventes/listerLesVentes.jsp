<%-- 
    Document   : Lister les Ventes 
    Created on : 22/06/2017, 07:43
    Author     : Zakina
--%>


<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.lang.System"%>
<%@page import="java.util.Date"%>
<%@page import="modele.Vente"%>
<%@page import="modele.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modele.Compte"%>
 <%Compte compte = (Compte)request.getSession().getAttribute("Compte");%>
<!DOCTYPE html>
<html>
    <jsp:include page="/vues/Header.jsp" >
        <jsp:param name="NomPage" value="Liste les ventes" />
    </jsp:include>

    <body>

        <jsp:include page="/vues/MenuNavigation.jsp" />

        <div class="container">
            <div class="row">
                <h3 >Liste des ventes</h3>
                <%
                    
                    SimpleDateFormat formatter=new SimpleDateFormat("yyy-MM-dd");
                    SimpleDateFormat formatterfr=new SimpleDateFormat("dd/MM/yyyy");
                    ArrayList<Vente> lesVentes = (ArrayList) request.getAttribute("pLesVentes");
                    ArrayList<CategVente> lesCategVentes = (ArrayList) request.getAttribute("pLesCategVentes");
                %>

                <form class="form-inline" action="listerLesVentes" method="GET">
                    <div class="col s5">
                        <select name="codeCat" size="1">
                            <option value="">Toutes les ventes</option>
                            <%
                                for (int i = 0; i < lesCategVentes.size(); i++) {
                                    CategVente uneCategVente = lesCategVentes.get(i);
                                    out.print("<option value='");
                                    out.print(uneCategVente.getCode());
                                    out.print("'>");
                                    out.print(uneCategVente.getLibelle());
                                }
                            %>
                        </select>
                        <label for="codeCat">Categorie : </label>
                    </div>
                    <div class="col s2">    
                        <button class="btn waves-effect waves-light" type="submit">Filtrer
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
                <%
                    if(compte != null && compte.getRole().equals("ADMIN")){
                %>
                <div class="col s1 offset-s4">  

                    <a class="btn-floating btn-large waves-effect waves-light"href='../ServletVentes/ajouterVente'><i class="material-icons">add</i></a>

                </div>  
                <%
                    }
                %>
                <table  class="table table-bordered table-striped table-condensed">  
                    <thead>
                        <tr>             
                            <th>Numéro</th>
                            <th>Nom</th>
                            <th>Date de Début de la Vente</th>
                            <th>Date de Fin de la Vente</th>
                            <th>Date de Début de l'Inscription</th>
                            <th>Lieu</th>
                            <th>Catégorie</th>  

                            <th></th>
                    <br>
                    <br>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <%

                            for(int i = 0; i < lesVentes.size();i++)
                            {


                                Vente uneVente = lesVentes.get(i);
                                out.println("<tr><td>");
                                out.println(uneVente.getId());
                                out.println("</a></td>");

                                out.println("<td>");
                                out.println(uneVente.getNom());
                                out.println("</td>");
                                
                                String DateDebutVenteBase = uneVente.getDateDebutVente();
                                Date DateDebutVente = formatter.parse(DateDebutVenteBase);
                                DateDebutVenteBase = formatterfr.format(DateDebutVente);
                                out.println("<td>");
                                out.println(DateDebutVenteBase);
                                out.println("</td>");
                                
                                String DateFinVenteBase = uneVente.getDateFinVente();
                                Date DateFinVente = formatter.parse(DateFinVenteBase);
                                DateFinVenteBase = formatterfr.format(DateFinVente);
                                out.println("<td>");
                                out.println(DateFinVenteBase);
                                out.println("</td>");
                                       
                                String DateDebutInscripBase = uneVente.getdateDebutInscrip();
                                Date DebutInscripVente = formatter.parse(DateDebutInscripBase);
                                DateDebutInscripBase = formatterfr.format(DebutInscripVente);
                                out.println("<td>");
                                out.println(DateDebutInscripBase);
                                out.println("</td>");
                     
                                out.println("<td>");
                                out.println(uneVente.getUnLieu().getVille() );
                                out.println("</td>");

                                out.println("<td>");
                                out.println(uneVente.getUneCategVente().getLibelle());
                                out.println("</td>");
                                
                                out.println("<td><a href ='../ServletVentes/listerLesChevaux?codeVente="+ uneVente.getId()+ "'>");
                                out.println("Lister les Chevaux");
                                out.println("</td>");
                                    
                                if(compte != null && compte.getRole().equals("ADMIN")){
                                    out.println("<td><a href ='../ServletVentes/listerLesClients?codeCat="+ uneVente.getUneCategVente().getCode()+ "'>");
                                    out.println("Lister les clients interessés");
                                    out.println("</td>");

                                    out.println("<td><a href ='../ServletVentes/listerLesCourriel?codeVente="+ uneVente.getId()+ "'>");
                                    out.println("Lister les Couriels envoyés");
                                    out.println("</td>");      



                                    out.println("<td>");
                                    out.println("<a class=\"waves-effect waves-light btn-small\" href ='../ServletVentes/SupprimerUneVente?codeVente="+ uneVente.getId()+ "'><i class=\"material-icons\">delete</i></a>");
                                    out.println("</td>");

                                    out.println("<td>");
                                    out.println("<a class=\"waves-effect waves-light btn-small\" href ='../ServletVentes/venteModifier?codeVente="+ uneVente.getId()+ "' ><i class=\"material-icons\">create</i></a>");
                                    out.println("</td>");
                                }
                            }
                            %>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>
        <jsp:include page="/vues/footer.jsp" />
    </body>
</html>
