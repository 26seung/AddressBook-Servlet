<%@page import="book.BookOracle"%>
<%@page import="book.BookDao"%>
<%@page import="book.BookData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%

String name = request.getParameter("name");
String hp = request.getParameter("hp");
String tel = request.getParameter("tel");


BookData data = new BookData(name,hp,tel);
BookDao dao = new BookOracle();

dao.insert(data);

response.sendRedirect(request.getContextPath() + "/adress/");


%>



