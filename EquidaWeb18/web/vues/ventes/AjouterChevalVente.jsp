<%-- 
    Document   : chevalAjouter
    Created on : 16 oct. 2018, 14:43:05
    Author     : slam
--%>

<%@page import="formulaires.ChevalVenteForm"%>
<%@page import="modele.Cheval"%>
<%@page import="modele.Vente"%>
<%@page import="modele.TypeCheval"%>
<%@page import="modele.CategVente"%>
<%@page import="modele.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="formulaires.ChevalForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <jsp:include page="/vues/Header.jsp" >
        <jsp:param name="NomPage" value="Ajouter un cheval à une vente" />
    </jsp:include>

    <body>
        <jsp:include page="/vues/MenuNavigation.jsp" />
        <div class="container">
            <div class="row">
                <h3>Ajouter un lot</h3>
                <%
                    ChevalVenteForm form = (ChevalVenteForm) request.getAttribute("form");

                    if (form != null && form.getErreurs() != null) {
                        for (int i = 0; i < form.getErreurs().size(); i++) {
                            out.println(form.getErreurs().get(i) + "<br/>");
                        }
                    }
                %>
                <form class="form-inline" action="AjouterChevalVente" method="POST">
                    <div class="input-field col s12">
                        <select id='cheval' name="cheval">
                            <option value="" disabled selected>Choisir un cheval</option>
                            <%
                                ArrayList<Cheval> mesChevaux = (ArrayList) request.getAttribute("pLesChevaux");
                                for (int i = 0; i < mesChevaux.size(); i++) {
                                    Cheval cheval = mesChevaux.get(i);
                                    out.println("<option value ='" + cheval.getId() + "'>" + cheval.getNom() + "</option>");

                                }
                            %>
                        </select>
                        <label>Cheval :</label>
                    </div>
                    <div class="input-field col s12">
                        <select id='vente' name="vente">
                            <option value="" disabled selected>Choisir une vente</option>
                            <%
                                ArrayList<Vente> lesVentes = (ArrayList) request.getAttribute("pLesVentes");
                                for (int i = 0; i < lesVentes.size(); i++) {
                                    Vente vente = lesVentes.get(i);
                                    out.println("<option value ='" + vente.getId() + "'>" + vente.getNom() + "</option>");

                                }
                            %>
                        </select>
                    </div>

                    <div class="input-field col s12">
                        <input placeholder="prixdepart" id="prixdepart" name="prixdepart" type="number" class="validate">
                        <label for="prixdepart">Prix de départ :</label>
                    </div> 

                    <div class="input-field col s6">  
                        <button class="btn waves-effect waves-light" type="submit" name="valider">Valider<i class="material-icons right">send</i></button>
                    </div>
                </form>
            </div>           
        </div>        
    </body>
</html>
