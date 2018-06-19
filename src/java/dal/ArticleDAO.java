package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Article;
import model.Author;

/**
 *
 * @author lenovo
 */
public class ArticleDAO extends BaseDAO {

    public Article get(int ID) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "SELECT article.ID\n"
                    + "      ,[Title]\n"
                    + "      ,[AuthorID], author.Name\n"
                    + "      ,[Content]\n"
                    + "      ,[DatePublished]\n"
                    + "      ,[ImagePath], ShortDescription\n"
                    + "  FROM [Article] article, Author author\n"
                    + "  WHERE article.AuthorID = author.ID\n"
                    + "  AND article.ID = (?)";
            connection = getConnection();
            ps = connection.prepareStatement(query);
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                Article a = new Article();
                a.setID(rs.getInt("ID"));
                Author u = new Author();
                u.setID(rs.getInt("AuthorID"));
                u.setName(rs.getString("Name"));
                a.setAuthor(u);
                a.setTitle(rs.getString("Title"));
                a.setContent(rs.getString("Content"));
                a.setDatePublished(rs.getDate("DatePublished"));
                a.setImagePath(rs.getString("ImagePath"));
                a.setShortDescription(rs.getString("ShortDescription"));
                return a;
            }
            close(connection, ps, rs);
        } catch (Exception ex) {
            close(connection, ps, rs);
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return null;
    }

    public ArrayList<Article> getTopMostRecent(int num) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Article> articles = new ArrayList<>();
        try {
            String query = "SELECT TOP (?) article.ID\n"
                    + "      ,[Title]\n"
                    + "      ,[AuthorID], author.Name\n"
                    + "      ,[Content]\n"
                    + "      ,[DatePublished]\n"
                    + "      ,[ImagePath], ShortDescription\n"
                    + "  FROM [Article] article, Author author\n"
                    + "  WHERE article.AuthorID = author.ID\n"
                    + "  ORDER BY DatePublished DESC";
            connection = getConnection();
            ps = connection.prepareStatement(query);
            ps.setInt(1, num);
            rs = ps.executeQuery();
            while (rs.next()) {
                Article a = new Article();
                a.setID(rs.getInt("ID"));
                Author u = new Author();
                u.setID(rs.getInt("AuthorID"));
                u.setName(rs.getString("Name"));
                a.setAuthor(u);
                a.setTitle(rs.getString("Title"));
                a.setContent(rs.getString("Content"));
                a.setDatePublished(rs.getDate("DatePublished"));
                a.setImagePath(rs.getString("ImagePath"));
                a.setShortDescription(rs.getString("ShortDescription"));
                articles.add(a);
            }
            close(connection, ps, rs);
        } catch (Exception ex) {
            close(connection, ps, rs);
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return articles;
    }

    public ArrayList<Article> search(String searchQuery) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Article> articles = new ArrayList<>();
        try {
            String query = "SELECT article.ID\n"
                    + "      ,[Title]\n"
                    + "      ,[AuthorID], author.Name\n"
                    + "      ,[Content]\n"
                    + "      ,[DatePublished]\n"
                    + "      ,[ImagePath], ShortDescription\n"
                    + "  FROM [Article] article, Author author\n"
                    + "  WHERE article.Title LIKE (?)"
                    + " AND article.AuthorID = author.ID\n";
            connection = getConnection();
            ps = connection.prepareStatement(query);
            String value = "%" + searchQuery + "%";
            ps.setString(1, value);
            rs = ps.executeQuery();
            while (rs.next()) {
                Article a = new Article();
                a.setID(rs.getInt("ID"));
                Author u = new Author();
                u.setID(rs.getInt("AuthorID"));
                u.setName(rs.getString("Name"));
                a.setAuthor(u);
                a.setTitle(rs.getString("Title"));
                a.setContent(rs.getString("Content"));
                a.setDatePublished(rs.getDate("DatePublished"));
                a.setImagePath(rs.getString("ImagePath"));
                a.setShortDescription(rs.getString("ShortDescription"));
                articles.add(a);
            }
            close(connection, ps, rs);
        } catch (Exception ex) {
            close(connection, ps, rs);
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return articles;
    }

    public ArrayList<Article> search(String searchQuery, int start, int end) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Article> articles = new ArrayList<>();
        try {
            String query = "select RN\n"
                    + "	, ID\n"
                    + "      ,[Title]\n"
                    + "      ,[AuthorID], Name\n"
                    + "      ,[Content]\n"
                    + "      ,[DatePublished]\n"
                    + "      ,[ImagePath]\n"
                    + "      ,[ShortDescription]\n"
                    + "  FROM \n"
                    + "(select ROW_NUMBER() over (order by art.ID asc) as RN\n"
                    + "	, art.ID\n"
                    + "      ,[Title]\n"
                    + "      ,[AuthorID], au.Name\n"
                    + "      ,[Content]\n"
                    + "      ,[DatePublished]\n"
                    + "      ,[ImagePath]\n"
                    + "      ,[ShortDescription]\n"
                    + "  FROM [Article] art, Author au\n"
                    + "  WHERE art.AuthorID = au.ID\n"
                    + "  )  AS X\n"
                    + "  WHERE RN between ? and ?\n"
                    + "  AND Title LIKE ?";
            connection = getConnection();
            ps = connection.prepareStatement(query);
            String value = "%" + searchQuery + "%";
            ps.setInt(1, start);
            ps.setInt(2, end);
            ps.setString(3, value);
            rs = ps.executeQuery();
            while (rs.next()) {
                Article a = new Article();
                a.setID(rs.getInt("ID"));
                Author u = new Author();
                u.setID(rs.getInt("AuthorID"));
                u.setName(rs.getString("Name"));
                a.setAuthor(u);
                a.setTitle(rs.getString("Title"));
                a.setContent(rs.getString("Content"));
                a.setDatePublished(rs.getDate("DatePublished"));
                a.setImagePath(rs.getString("ImagePath"));
                a.setShortDescription(rs.getString("ShortDescription"));
                articles.add(a);
            }
            close(connection, ps, rs);
        } catch (Exception ex) {
            close(connection, ps, rs);
            Logger.getLogger(ArticleDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return articles;
    }
}
