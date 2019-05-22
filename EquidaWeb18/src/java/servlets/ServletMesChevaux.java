/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.CategVenteDAO;
import database.ChevauxDAO;
import database.ClientDAO;
import database.CourrielDAO;
import database.EnchereDAO;
import database.LieuDAO;

import database.LotDAO;
import database.PieceJointeDAO;
import database.Utilitaire;
import database.VenteDAO;
import database.PaysDAO;
import database.TypeChevalDAO;

import formulaires.CourrielForm;
import formulaires.VenteForm;
import formulaires.ChevalForm;
import formulaires.ChevalVenteForm;
import formulaires.VenteForm;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modele.Client;
import modele.Vendeur;
import modele.Acheteur;
import modele.Vente;
import modele.Courriel;
import modele.CategVente;
import modele.Cheval;
import modele.Enchere;
import modele.Compte;
import modele.Client;
import modele.Lieu;
import modele.Lot;
import modele.PieceJointe;
import modele.Pays;
import modele.TypeCheval;


/**
 *
 * @author Zakina Classe Servlet permettant d'executer les fonctionnalités
 * relatives aux ventes : Fonctionnalités implémentées : lister les ventes
 * lister les clients d'une vente passée en paramètre
 */
public class ServletMesChevaux extends HttpServlet {
    
    private static final String UPLOAD_DIRECTORY = "upload";

    Connection connection;

    @Override
    public void init() {
        ServletContext servletContext = getServletContext();
        connection = (Connection) servletContext.getAttribute("connection");
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        //try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        /*out.println("<!DOCTYPE html>");
         out.println("<html>");
         out.println("<head>");
         out.println("<title>Servlet ServletVentes</title>");            
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet ServletVentes at " + request.getContextPath() + "</h1>");
         out.println("</body>");
         out.println("</html>");
         }*/
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = request.getRequestURI();
        Compte compte = (Compte) request.getSession().getAttribute("Compte");
        
        if(compte != null && compte.getRole().equals("CLIENT")){
            if(url.equals("/EquidaWeb18/ServletMesChevaux/listerMesChevaux"))
            {  
                int codeAcheteur = compte.getUnClient().getId();
                ArrayList<Cheval> lesChevaux = ChevauxDAO.getLesChevaux(connection, "" + codeAcheteur);
                request.setAttribute("pLesChevaux", lesChevaux);
                getServletContext().getRequestDispatcher("/vues/ventes/listerMesChevaux.jsp").forward(request, response);
            }
            
            if (url.equals("/EquidaWeb18/ServletMesChevaux/chevalModif")) {
                ArrayList<TypeCheval> lesTypeCheval = TypeChevalDAO.getLesTypeChevaux(connection);
                request.setAttribute("pLesTypeCheval", lesTypeCheval);

                int codeCheval = Integer.parseInt(request.getParameter("id"));
                Cheval unCheval = ChevauxDAO.getUnCheval(connection, codeCheval);
                unCheval.setId(codeCheval);
                request.setAttribute("pCheval", unCheval);

                getServletContext().getRequestDispatcher("/vues/ventes/chevalModif.jsp").forward(request, response);
            }
            
            if(url.equals("/EquidaWeb18/ServletMesChevaux/SupprimerMesChevaux"))
            {  
                int codeCheval = Integer.parseInt(request.getParameter("codeCheval"));

                ChevauxDAO.DeleteUnChevaux(connection, codeCheval);

                int codeAcheteur = compte.getUnClient().getId();
                ArrayList<Cheval> lesChevaux = ChevauxDAO.getLesChevaux(connection, "" + codeAcheteur);
                request.setAttribute("pLesChevaux", lesChevaux);
                getServletContext().getRequestDispatcher("/vues/ventes/listerMesChevaux.jsp").forward(request, response);
            }

            if (url.equals("/EquidaWeb18/ServletMesChevaux/chevalAjouter")) {

                ArrayList<Pays> lesPays = PaysDAO.getLesPays(connection);
                request.setAttribute("pLesPays", lesPays);

                ArrayList<TypeCheval> lesTypeCheval = TypeChevalDAO.getLesTypeChevaux(connection);
                request.setAttribute("pLesTypeCheval", lesTypeCheval);
                this.getServletContext().getRequestDispatcher("/vues/ventes/chevalAjouter.jsp").forward(request, response);     
            }
            if (url.equals("/EquidaWeb18/ServletMesChevaux/AjouterChevalVente") ) {
                int codeAcheteur = compte.getUnClient().getId();
                ArrayList<Cheval> lesChevaux = ChevauxDAO.getLesChevaux(connection, "" + codeAcheteur);
                ArrayList<Vente> lesVentes = VenteDAO.getLesVentes(connection);
                request.setAttribute("pLesChevaux", lesChevaux);
                request.setAttribute("pLesVentes", lesVentes);
                getServletContext().getRequestDispatcher("/vues/ventes/AjouterChevalVente.jsp").forward(request, response);
            }
        }else{
            getServletContext().getRequestDispatcher("/vues/Permission.jsp").forward(request, response);

        }
        
        
        

        
        
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException 
    {
        

        Compte compte = (Compte) request.getSession().getAttribute("Compte");
       String url = request.getRequestURI();
       
       
        if (url.equals("/EquidaWeb18/ServletMesChevaux/chevalModif")) {

            ChevalForm form = new ChevalForm();

            /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
            Cheval unCheval = form.ajouterCheval(request);

            /* Stockage du formulaire et de l'objet dans l'objet request */
            request.setAttribute("form", form);
            //request.setAttribute( "pClient", unClient );

            if (form.getErreurs().isEmpty()) {
                if (unCheval.getMere() != null) {
                    unCheval.setMere(ChevauxDAO.getCheval(connection, unCheval.getMere().getSire()));
                } else {
                    unCheval.setMere(null);
                }

                if (unCheval.getPere() != null) {
                    unCheval.setPere(ChevauxDAO.getCheval(connection, unCheval.getPere().getSire()));
                } else {
                    unCheval.setPere(null);
                }
                // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du client 

                Cheval chevalVerif = ChevauxDAO.modifierCheval(connection, unCheval);

                request.setAttribute("pCheval", chevalVerif);
                this.getServletContext().getRequestDispatcher("/vues/ventes/chevalConsulter.jsp").forward(request, response);
            } else {
                ArrayList<TypeCheval> lesTypeCheval = TypeChevalDAO.getLesTypeChevaux(connection);
                request.setAttribute("pLesTypeCheval", lesTypeCheval);

                int codeCheval = Integer.parseInt(request.getParameter("id"));
                unCheval = ChevauxDAO.getUnCheval(connection, codeCheval);
                unCheval.setId(codeCheval);
                request.setAttribute("pCheval", unCheval);

                getServletContext().getRequestDispatcher("/vues/ventes/chevalModif.jsp").forward(request, response);
            }
        }
        

        if (url.equals("/EquidaWeb18/ServletMesChevaux/chevalAjouter")) {

            ChevalForm form = new ChevalForm();

            /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
            Cheval unCheval = form.ajouterCheval(request);

            /* Stockage du formulaire et de l'objet dans l'objet request */
            /* Stockage du formulaire et de l'objet dans l'objet request */
            request.setAttribute("form", form);
            //request.setAttribute( "pClient", unClient );

            if (form.getErreurs().isEmpty()) {
                if (unCheval.getMere() != null) {
                    unCheval.setMere(ChevauxDAO.getCheval(connection, unCheval.getMere().getSire()));
                } else {
                    unCheval.setMere(null);
                }

                if (unCheval.getPere() != null) {
                    unCheval.setPere(ChevauxDAO.getCheval(connection, unCheval.getPere().getSire()));
                } else {
                    unCheval.setPere(null);
                }
                // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du client 

                Cheval chevalVerif = ChevauxDAO.ajouterCheval(connection, unCheval);

                
                unCheval = ChevauxDAO.getUnCheval(connection, chevalVerif.getId() );
                request.setAttribute("pCheval", unCheval);
                this.getServletContext().getRequestDispatcher("/vues/ventes/chevalConsulter.jsp").forward(request, response);
            } else {
                ArrayList<Pays> lesPays = PaysDAO.getLesPays(connection);
                request.setAttribute("pLesPays", lesPays);

                ArrayList<TypeCheval> lesTypeCheval = TypeChevalDAO.getLesTypeChevaux(connection);
                request.setAttribute("pLesTypeCheval", lesTypeCheval); 
                this.getServletContext().getRequestDispatcher("/vues/ventes/chevalAjouter.jsp").forward(request, response);
            }

        }
        if (url.equals("/EquidaWeb18/ServletMesChevaux/AjouterChevalVente")) {
            ChevalVenteForm form = new ChevalVenteForm();

            /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
            Lot unLot = form.ajouterLot(request);

            /* Stockage du formulaire et de l'objet dans l'objet request */
            request.setAttribute("form", form);
            //request.setAttribute( "pClient", unClient );

            if (form.getErreurs().isEmpty()) {
                Vendeur vendeur = new Vendeur();
                vendeur.setId(compte.getUnClient().getId());
                unLot.setUnVendeur(vendeur);
                // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du client 

                LotDAO.ajouterLot(connection, unLot);
                response.sendRedirect("/EquidaWeb18/ServletAccueil/Accueil");
            } else {
                if (compte != null) {
                    int codeAcheteur = compte.getUnClient().getId();
                    ArrayList<Cheval> lesChevaux = ChevauxDAO.getLesChevaux(connection, "" + codeAcheteur);
                    ArrayList<Vente> lesVentes = VenteDAO.getLesVentes(connection);
                    request.setAttribute("pLesChevaux", lesChevaux);
                    request.setAttribute("pLesVentes", lesVentes);
                    getServletContext().getRequestDispatcher("/vues/ventes/AjouterChevalVente.jsp").forward(request, response);
                }
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    
    public String getServletInfo() {
        return "Short description";
    }

    public void destroy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //fermeture
            System.out.println("Connexion fermée");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erreur lors de l’établissement de la connexion");
        } finally {
            //Utilitaire.fermerConnexion(rs);
            //Utilitaire.fermerConnexion(requete);
            Utilitaire.fermerConnexion(connection);
        }
    }
}
