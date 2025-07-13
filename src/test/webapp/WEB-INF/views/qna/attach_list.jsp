<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<!DOCTYPE html>
	
	<c:if test="${not empty attachList}">
	  <div class="mt-3 border-top pt-2">
	    <h6 class="fw-bold mb-2">📎 첨부파일</h6>
	    <ul class="list-unstyled">
	      <c:forEach var="file" items="${attachList}">
	        <li class="mb-1">
	          <c:choose>
	            <c:when test="${file.image == 'Y'}">
	              <img src="${cp}/display?no=${file.attachId}" style="max-width: 150px;" />
	            </c:when>
	            <c:otherwise>
	              <a href="/download?fileName=${file.fileName}&origin=${file.originalName}&path=${file.path}">
	              </a>
	            </c:otherwise>
	          </c:choose>
	        </li>
	      </c:forEach>
	    </ul>
	  </div>
	</c:if>
