package controller;

import dal.ArticleDAO;
import dal.BaseDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Article;

public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArticleDAO artDB = new ArticleDAO();
        try {
            ArrayList<Article> articles = artDB.getTopMostRecent(5);
            String sArticleID = request.getParameter("articleID");
            if (sArticleID == null) {
                request.setAttribute("a", articles.get(0));
            } else {
                int id = Integer.parseInt(sArticleID);
                request.setAttribute("a", artDB.get(id));
            }
            request.setAttribute("articles", articles);
            request.setAttribute("imgFolder", BaseDAO.imgFolder);
            getServletContext().getRequestDispatcher("/WEB-INF/Home.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
            getServletContext().getRequestDispatcher("/ErrorPage.jsp").forward(request, response);
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
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
