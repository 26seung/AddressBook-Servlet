<%@page import="book.BookOracle"%>
<%@page import="book.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
String name = request.getParameter("name");

BookDao dao = new BookOracle();


dao.search(name);

//리스트 페이지로 리다이렉트
response.sendRedirect(request.getContextPath() + "/adress/");


%>