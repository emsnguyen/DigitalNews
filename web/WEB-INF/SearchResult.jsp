<%-- 
    Document   : Home
    Created on : Jun 17, 2018, 1:18:29 AM
    Author     : lenovo
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="t" tagdir="/WEB-INF/tags/" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result Page</title>
        <link href="${pageContext.servletContext.contextPath}/css/SearchResult.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <t:GenericPage>
            <jsp:attribute name="left">
                <div class="search-results">
                    <c:choose>
                        <c:when test="${FoundArticles.size() eq 0}">
                            <h1 class="noResultsFound">No results found!</h1>
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
            </jsp:attribute>
        </t:GenericPage>
    </body>
</html>