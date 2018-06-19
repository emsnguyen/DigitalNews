<%-- 
    Document   : Home
    Created on : Jun 17, 2018, 1:18:29 AM
    Author     : lenovo
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.servletContext.contextPath}/css/SearchResult.css" rel="stylesheet" type="text/css"/>
        <title>Search Result Page</title>
    </head>
    <body>
        <div class="wrapper">
            <div class="pre-header"></div>
            <div class="header">
                <p>My digital news</p>
            </div>
            <div class="menu">
                <a href="#">News</a>
            </div>
            <div class="main">
                <div class="search-results">
                    <c:choose>
                        <c:when test="${FoundArticles.size() eq 0}">
                            <h1>No results found!</h1>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${FoundArticles}" var="fa">
                                <div class="search-item-detail">
                                    <div class="title">
                                        <a href="home?articleID=${fa.ID}">${fa.title}</a>
                                    </div>
                                    <div class="article-image">
                                        <img src="${pageContext.servletContext.contextPath}/${imgFolder}/${fa.imagePath}"
                                             alt="img"/>
                                    </div>
                                    <div class="short-description">
                                        <p>${fa.shortDescription}</p>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="paging">${paging}</div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="sidebar">
                    <div class="most-recent-news">
                        <label>Digital News</label>
                        <p class="crop-long-texts">
                            ${a.shortDescription}
                        </p>
                    </div>
                    <div class="search">
                        <label>Search</label>
                        <form action="search">
                            <!--search by title-->
                            <p><input class="search-text" name="searchQuery" type="text" value="" required="required"/>
                                <input type="submit" class="go-and-search" value="Go"/>
                            </p>
                        </form>
                    </div>
                    <div class="latest-articles">
                        <label>Last Articles</label>
                        <c:forEach items="${articles}" var="a">
                            <div class="article-link-wrapper">
                                <a class="article-link" href="home?articleID=${a.ID}">${a.title}</a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="footer">
            </div>
        </div>
    </body>
</html>