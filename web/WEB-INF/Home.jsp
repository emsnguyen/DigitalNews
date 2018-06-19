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
        <link href="${pageContext.servletContext.contextPath}/css/Home.css" rel="stylesheet" type="text/css"/>
        <title>Home Page</title>
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
                <div class="detailed-article">
                    <div class="title">
                        <p>${a.title}</p>
                    </div>
                    <div class="article-image">
                        <img src="${pageContext.servletContext.contextPath}/${imgFolder}/${a.imagePath}" alt="../${imgFolder}/${a.imagePath}"/>
                    </div>
                    <div class="content">
                        ${a.content}
                    </div>
                    <hr>
                    <div class="author">
                        <span class="comment-icon"></span>
                        <span class="time-icon"></span>
                        <span class="author-name">${a.author.name} | <fmt:formatDate type="both" value="${a.datePublished}"
                                                           pattern="MMM dd yyyy - h:mma"/></span>
                    </div>
                </div>
                <div class="sidebar">
                    <!--<div class="comment-icon"></div>-->
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
                            <p>
                                <input name="searchQuery" type="text" value="" required="required"/>
                                <input class="go-and-search" type="submit" value="Go"/></p>
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