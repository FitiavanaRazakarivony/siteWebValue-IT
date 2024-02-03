package servlet;

import java.io.*;

import Connexion.Connexion;
import table.visiteur;

import javax.servlet.http.*;
import java.sql.*;

import java.util.logging.Level;
import java.util.logging.Logger;
import table.annonce;
import table.nosmetier;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class insertionAnnonce extends HttpServlet {
    private String message;

    @Override
    public void init() {
        message = "Hello World!";
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        

    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        PrintWriter out = response.getWriter();
        Connection bdd = Connexion.connect();
        HttpSession session = request.getSession();

        String Sai_annonce = request.getParameter("annonce");     
        String id_nosMet = request.getParameter("id_nosMet");    

        String typeAnnonce = request.getParameter("typeAnn");       
        
        try{
            session.setAttribute("erreur", 0);
                try{
                    annonce.insertionAnnonce(Sai_annonce,typeAnnonce,id_nosMet, bdd);
                    //message valider
                    request.setAttribute("etat","valider");
                    response.sendRedirect("admin/dashbord/annonce.jsp?etat=1");
                } catch(Exception e){
                    //message erreur
                    response.sendRedirect("admin/dashbord/annonce.jsp?etat=0");
                }
               
        } catch (Exception e) {
             //message erreur
             response.sendRedirect("admin/dashbord/annonce.jsp?etat=0");
              
        }
        
    }

    @Override
    public void destroy() {
    }

    private void setAttribute(String erreur1) {
        throw new UnsupportedOperationException("Not supported yet."); // To change body of generated methods, choose
                                                                       // Tools | Templates.
    }
}