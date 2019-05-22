<%-- 
    Document   : ClientAjouter
    Created on : 22/06, 16:35:27
    Author     : Zakina
--%>

<%@page import="modele.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.Pays"%>
<%@page import="formulaires.ClientForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
        <jsp:include page="/vues/Header.jsp" >
            <jsp:param name="clientModif" value="Modifier un Client" />
        </jsp:include>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Client Ajouter</title>
    </head>
    <body>
        <jsp:include page="/vues/MenuNavigation.jsp" />
        <div class="container">
            <div class="row">

                <h3>Inscrire un nouveau client</h3>
                <%
                ClientForm form = (ClientForm)request.getAttribute("form");
            
                if(form != null && form.getErreurs() != null){
            %>
            <div class="card-panel red lighten-1">
                    <ul>
                        <%
                        for(int i = 0; i < form.getErreurs().size();i++)
                        {
                        
                            out.println("<li>" + form.getErreurs().get(i) + "<li/>");
                        }
                        %>
                    </ul>
            </div>
            <%
                }
            %>
                
                <form class="form-inline" action="ajouterClient" method="POST">
                    <div class="input-field col s12">
                        <select id="civilite" name="civilite">
                            <option value='M.'>Monsieur</option>
                            <option value='Mme'>Madame</option>
                            <option value='Mlle'>Mademoiselle</option>
                        </select>
                        <label for="civilite">Civilité : </label>
                    </div>
                    <div class="input-field col s6">

                        <input id="nom" type="text" name="nom"  size="30" maxlength="30">
                        <label for="nom">Nom : </label>
                    </div>
                    <div class="input-field col s6">
                        <input id="prenom"  type="text"  name="prenom" size="30" maxlength="30">      
                        <label for="prenom">Prénom : </label>
                    </div>
                    <div class="input-field col s12">
                        <input id="rue"  type="text"  name="rue" size="30" maxlength="50">
                        <label for="rue">Rue : </label>
                    </div>
                    <div class="input-field col s12">
                        <input id="copos"  type="text"  name="copos" size="5" maxlength="5">
                        <label for="copos">Code postal : </label>
                    </div>
                    <div class="input-field col s12">
                        <input id="ville"  type="text"  name="ville" size="40" maxlength="40">
                        <label for="ville">Ville : </label>
                    </div>
                    <div class="input-field col s12">
                        <input id="mail"  type="text"  name="mail" size="40" maxlength="40">
                        <label for="ville">Mail : </label>
                    </div>

                    <div class="input-field col s12">
                        <select id="codePays" name="codePays">
                            <%
                                out.println("<option value ='default' selected disabled> Veuillez Choisir un Pays </option>");
                                ArrayList<Pays> lesPays = (ArrayList) request.getAttribute("pLesPays");
                                for (int i = 0; i < lesPays.size(); i++) {
                                    Pays p = lesPays.get(i);
                                    out.println("<option value='" + p.getCode() + "'>" + p.getNom() + "</option>");
                                }
                            %>
                        </select>
                        <label for="pays">Pays : </label>
                    </div>

                    <div class="input-field col s12">
                        <select id="categ" name="categVente"  multiple>
                            <%
                                out.println("<option value ='default' selected disabled> Veuillez Choisir une Catégorie </option>");
                                ArrayList<CategVente> lesCategVente = (ArrayList) request.getAttribute("pLesCategVente");
                                //affiche les categories de la bdd
                                for (int i = 0; i < lesCategVente.size(); i++) {
                                    //variable valeur bdd
                                    CategVente cv = lesCategVente.get(i);
                                    out.println("<option value ='" + cv.getCode() + "'>" + cv.getLibelle() + "</option>");

                                }
                            %>
                        </select>
                        <label id="categ" name="categVente">Catégorie(s) de vente :</label>
                    </div>
                    <div class="input-field col s6">  
                        <button class="btn waves-effect waves-light" type="submit" name="valider">Valider<i class="material-icons right">send</i></button>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="/vues/footer.jsp"/>
    </body>
</html>
