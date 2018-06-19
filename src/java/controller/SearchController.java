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
import utils.HtmlHelper;

public class SearchController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String searchQuery = request.getParameter("searchQuery");
            if (searchQuery == null) {
                request.setAttribute("searchError", "Please enter something to search");
                getServletContext().getRequestDispatcher("/WEB-INF/Home.jsp").forward(request, response);
                return;
            }
            ArticleDAO artDB = new ArticleDAO();
            ArrayList<Article> FoundArticles = artDB.search(searchQuery);
            ArrayList<Article> articles = artDB.getTopMostRecent(5);
            request.setAttribute("articles", articles);
            if (articles.size() > 0) {
                request.setAttribute("a", articles.get(0));
            }
            request.setAttribute("imgFolder", BaseDAO.imgFolder);
            request.setAttribute("FoundArticles", FoundArticles);

            if (FoundArticles.size() > 0) {
                //paging
                int pageSize = Integer.parseInt(BaseDAO.pageSize);
                int pageGap = Integer.parseInt(BaseDAO.pageGap);
                String sCurrentPage = request.getParameter("page");
                int page;
                if (sCurrentPage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(sCurrentPage);
                }
                int totalRecords = FoundArticles.size();
                int totalPage = totalRecords / pageSize + ((totalRecords % pageSize > 0) ? 1 : 0);
                int start = (page - 1) * pageSize + 1;
                int end = start + pageSize - 1;
                FoundArticles = artDB.search(searchQuery, start, end);
                String paging = HtmlHelper.paging(searchQuery, totalPage, pageGap, page);
                request.setAttribute("FoundArticles", FoundArticles);
                request.setAttribute("paging", paging);
            }
            getServletContext().getRequestDispatcher("/WEB-INF/SearchResult.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
            getServletContext().getRequestDispatcher("/ErrorPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
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
