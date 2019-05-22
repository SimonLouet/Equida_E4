<%-- 
    Document   : venteAjouter
    Created on : 16 oct. 2018, 07:40:25
    Author     : slam
--%>

<%@page import="modele.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.Lieu"%>
<%@page import="formulaires.VenteForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
        <jsp:include page="/vues/Header.jsp" >
            <jsp:param name="NomPage" value="Ajouter une vente" />
        </jsp:include>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouter une vente </title>
    </head>
    <body>
        <jsp:include page="/vues/MenuNavigation.jsp" />
        <div class="container">
            <div class="row">
                <h3>Ajouter une vente</h3>

                <%
                    //Vente vente=(Vente)request.getAttribute("vente");
                    VenteForm form = (VenteForm) request.getAttribute("form");

                    if (form != null && form.getErreurs() != null) {
                        for (int i = 0; i < form.getErreurs().size(); i++) {
                            out.println(form.getErreurs().get(i) + "<br/>");
                        }
                    }

                %>

                <form class="form-inline" action="ajouterVente" method="POST">
                     
                    <div class="input-field col s6">
                        <input id="id" type="text" name="id"  size="30" maxlength="30">
                        <label for="id">Numéro : </label>
                    </div>
                    <div class="input-field col s12">
                        <input id="nom" type="text" name="nom"  size="30" maxlength="30">
                        <label for="nom">Nom : </label>
                    </div>
                    <div class="input-field col s6">
                        <input id="dtdebut"  type="date"  name="dtdebut" type="text" class="datepicker">      
                        <label for="dtdebut">Date de début de la vente : </label>
                    </div>
                    <div class="input-field col s6">
                        <input id="dtfin"  type="date"  name="dtfin" type="text" class="datepicker">
                        <label for="dtfin">Date de fin de la vente : </label>
                    </div>
                    <div class="input-field col s12">
                        <input id="dtdebutinscrip"  type="text"  name="dtdebutinscrip" type="text" class="datepicker">
                        <label for="dtdebutinscrip">Date de début des inscriptions : </label>
                    </div>
                    <div class="input-field col s12">
                        <select id="idLieu" name="idLieu" >
                            <%                                ArrayList<Lieu> lesLieux = (ArrayList) request.getAttribute("pLesLieux");
                                for (int i = 0; i < lesLieux.size(); i++) {
                                    Lieu l = lesLieux.get(i);
                                    out.println("<option value='" + l.getId() + "'>" + l.getVille() + "</option>");
                                }
                            %>
                        </select>
                        <label for="lieu">Lieu : </label>
                    </div>
                    <div class="input-field col s12">
                        <select name="categVente" size="5">
                        <%
                            ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
                            for (int i=0; i<lesCategVente.size();i++){
                                CategVente cv = lesCategVente.get(i);
                                out.println("<option value ='" + cv.getCode() + "'>" + cv.getLibelle() + "</option>"); 

                            }
                        %>
                        </select>
                        <label for="categvente">Catégorie Vente : </label>
                    </div>
                    <div class="input-field col s12">  
                        <button class="btn waves-effect waves-light" type="submit" name="valider">Valider<i class="material-icons right">send</i></button>
                    </div>
                   
                </form>
            </div>
        </div>
        <jsp:include page="/vues/footer.jsp"/>
    </body>
</html>
