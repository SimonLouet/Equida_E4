
<%-- 
    Document   : chevalAjouter
    Created on : 16 oct. 2018, 14:43:05
    Author     : slam
--%>
<%@page import="modele.Cheval"%>
<%@page import="modele.TypeCheval"%>
<%@page import="modele.CategVente"%>
<%@page import="modele.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="formulaires.ChevalForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <jsp:include page="/vues/Header.jsp" >
        <jsp:param name="NomPage" value="Modifier un cheval" />
    </jsp:include>

    <body>
        <jsp:include page="/vues/MenuNavigation.jsp" />
        <div class="container">
            <div class="row">
                <h3 class="teal-text">Modifier un cheval</h3>
                <%
                    Cheval unCheval = (Cheval) request.getAttribute("pCheval");
                    ChevalForm form = (ChevalForm) request.getAttribute("form");

                    if (form != null && form.getErreurs() != null) {
                        for (int i = 0; i < form.getErreurs().size(); i++) {
                            out.println(form.getErreurs().get(i) + "<br/>");
                        }
                    }
                %>
                <form class="form-inline" action="chevalModif" method="POST">
                    <div class="input-field col s12">
                        <input placeholder="Nom" id="nom" name="nom" type="text" value="<% out.println(unCheval.getNom());%>" class="validate">
                        <label for="nom">Nom</label>
                    </div>  
                    <div class="input-field col s12"> 
                        <select id="sexe" name="sexe">
                            <%
                                if (unCheval.getSexe() != null && unCheval.getSexe().equals("M")) {
                                    out.println("<option value='M' selected>Male</option>");
                                } else {
                                    out.println("<option value='M'>Male</option>");
                                }
                                if (unCheval.getSexe() != null && unCheval.getSexe().equals("F")) {
                                    out.println("<option value='F' selected>Femelle</option>");
                                } else {
                                    out.println("<option value='F'>Femelle</option>");
                                }
                            %>
                        </select>
                        <label for="sexe">Sexe</label>
                    </div>   
                    <div class="input-field col s12">
                        <input placeholder="Sire" id="sire" name="sire" type="text"value=" <% out.println(unCheval.getSire());%>" class="validate">
                        <label for="sire">Sire</label>
                    </div>   
                    <div class="input-field col s6">
                        <input placeholder="Sire du père" id="sirepere" name="sirepere" value="<%if (unCheval.getPere() != null) {
                                out.println(unCheval.getPere().getSire());
                            }%>" type="text" class="validate">
                        <label for="sirepere">Sire du père</label>
                    </div>
                    <div class="input-field col s6">
                        <input placeholder="Sire de la mère" id="siremere" name="siremere" value="<%if (unCheval.getMere() != null) {
                                out.println(unCheval.getMere().getSire());
                            }%>" type="text" class="validate">
                        <label for="siremere">Sire de la mère</label>
                    </div> 
                    <div class="input-field col s12">
                        <select id='typ_id' name="typ_id">
                            <option value="" disabled>Choose your option</option>
                            <%
                                ArrayList<TypeCheval> lesTypeCheval = (ArrayList) request.getAttribute("pLesTypeCheval");
                                for (int i = 0; i < lesTypeCheval.size(); i++) {
                                    TypeCheval tc = lesTypeCheval.get(i);
                                    out.println("<option value ='" + tc.getId() + "'");
                                    if (tc.getId() == unCheval.getTypeCheval().getId()) {
                                        out.println(" selected ");
                                    }
                                    out.println(">" + tc.getLibelle() + "</option>");
                                }
                            %>


                        </select>
                        <label>Type de cheval :</label>
                    </div> 
                    <div class="input-field col s12">
                        <input name="id" type="hidden" value='<% out.println(unCheval.getId());%>'>
                    </div>
                    <div class="input-field col s12">
                        <button class="btn waves-effect waves-light" type="submit" >Modifier
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
            </div>           
        </div> 
        <jsp:include page="/vues/footer.jsp"/>
    </body>
</html>
