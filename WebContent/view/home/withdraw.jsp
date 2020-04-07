<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%
String m_id = request.getParameter("m_id");
Connection conn = com.getum.util.DBConnection.getCon();
com.getum.member.model.MemberDAO dao = com.getum.member.model.MemberDAO.getInstance();

dao.withdraw(conn, m_id);

session.invalidate();
response.sendRedirect("/GETUM/view/home/index.jsp");
%>