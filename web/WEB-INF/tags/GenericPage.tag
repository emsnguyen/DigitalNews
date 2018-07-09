<%-- 
    Document   : GenericPage
    Created on : Jul 9, 2018, 10:55:25 PM
    Author     : lenovo
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.servletContext.contextPath}/css/GenericPage.css" rel="stylesheet" type="text/css"/>
<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="left" fragment="true"%>
<div class="wrapper">
    <div class="pre-header"></div>
    <div class="header">
        <p>My digital news</p>
    </div>
    <div class="menu">
        <a href="#">News</a>
    </div>
    <div class="main">
        <div class="left">
            <jsp:invoke fragment="left"/>
        </div>
        <div class="right">
            <div class="most-recent-news">
                <label>Digital News</label>
                <p>
                    ${a.shortDescription}
                </p>
            </div>
            <div class="search">
                <label>Search</label>
                <form action="search">
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
    <div class="footer"></div>