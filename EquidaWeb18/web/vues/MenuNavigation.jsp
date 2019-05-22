<%-- 
    Document   : ClientAjouter
    Created on : 22/06, 16:35:27
    Author     : Zakina
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Presentation.LienMenu"%>
<%@page import="modele.Compte"%>
<%
    Compte compte = (Compte)request.getSession().getAttribute("Compte");
    
    ArrayList<LienMenu> lien = new ArrayList(){};
    
    LienMenu accueil = new LienMenu("../ServletAccueil/Accueil", "Accueil" );
    lien.add(accueil);
    
    LienMenu ventes = new LienMenu("../ServletVentes/listerLesVentes", "Ventes" );
    lien.add(ventes);
    
    if(compte != null && compte.getRole().equals("CLIENT")){
        LienMenu mails = new LienMenu("../ServletVentes/creerMail", "Mails" );
        lien.add(mails);

        LienMenu MesChevaux = new LienMenu("../ServletMesChevaux/listerMesChevaux", "Mes chevaux" );
        lien.add(MesChevaux);
    }
    
    if(compte != null && compte.getRole().equals("ADMIN")){
        LienMenu parametres = new LienMenu(null, "Paramètres");
        lien.add(parametres);

        LienMenu paramTypeChevaux = new LienMenu("../ServletAdministrateur/listerParamTypeCheval", "Type chevaux");
        parametres.addUnEnfant(paramTypeChevaux);

        LienMenu paramCourse = new LienMenu("../ServletAdministrateur/listerParamCourse", "Courses");
        parametres.addUnEnfant(paramCourse);

        LienMenu paramCategVente = new LienMenu("../ServletAdministrateur/listerParamCategVente", "Categorie de vente");
        parametres.addUnEnfant(paramCategVente);

        LienMenu paramLieu = new LienMenu("../ServletAdministrateur/listerParamLieu", "Lieu de vente");
        parametres.addUnEnfant(paramLieu);

        LienMenu paramPays = new LienMenu("../ServletAdministrateur/listerParamPays", "Pays");
        parametres.addUnEnfant(paramPays);

        LienMenu client = new LienMenu(null, "Clients" );
        lien.add(client);

        LienMenu clients = new LienMenu("../ServletClient/listerLesClients", "Clients" );
        client.addUnEnfant(clients);

        LienMenu vendeurs = new LienMenu("../ServletClient/listerLesVendeurs", "Vendeurs" );
        client.addUnEnfant(vendeurs);

        LienMenu acheteurs = new LienMenu("../ServletClient/listerLesAcheteurs", "Acheteurs" );
        client.addUnEnfant(acheteurs);
    }
    
    
    
    
%>




        <%
        for(int i = 0; i < lien.size();i++){
            out.println(lien.get(i).getDropdownHTML());
        }
        %>

        <nav>
            <div class = "nav-wrapper">
                <ul id = "nav-mobile" class = "right hide-on-med-and-down">  
                    <%
                    for(int i = 0; i < lien.size();i++){
                        out.println(lien.get(i).getNavHTML());
                    }
                    %>
                </ul>
                <ul>
                    <%
                    
                    if(compte != null){
                    
            
                        out.println("<li><a href ='../ServletAccueil/Profil'> <i class=\"material-icons\">account_circle</i></a></li>");
                        out.println("<li><a href ='../ServletAccueil/Deconnexion'> <i class=\"material-icons\">exit_to_app</i></a></li>");
                        out.println("" + compte.getUnClient().getPrenom() +" "+ compte.getUnClient().getNom() + "");
                    }else{
                        out.println("<li><a href ='../ServletAccueil/Connexion'> <i class=\"material-icons\">account_circle</i></a></li>");


                    }
                    %>
                </ul>
            </div>
        </nav>

                
<div id="index-banner" class="parallax-container">
    <div class="section no-pad-bot">
      <div class="container">
        <br><br>
        <h1 class="header center">Equida</h1>
        <div class="row center">
          <h5 class="header col s12 light">Société spécialisée dans la vente aux enchères de chevaux de course</h5>
        </div>
        <br><br>

      </div>
    </div>
    
    <div class="parallax"><img src="<%= request.getContextPath()%>/img/476264.jpg" alt="Unsplashed background img 1"></div>
  </div>
