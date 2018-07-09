<%-- 
    Document   : Home
    Created on : Jun 17, 2018, 1:18:29 AM
    Author     : lenovo
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.servletContext.contextPath}/css/Home.css" rel="stylesheet" type="text/css"/>
        <title>Home Page</title>
    </head>
    <body>
        <t:GenericPage>
            <jsp:attribute name="left">
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
            </jsp:attribute>
        </t:GenericPage>
    </body>
</html>