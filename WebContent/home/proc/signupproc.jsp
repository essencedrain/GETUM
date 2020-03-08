<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Date" %>
<%@ page import="com.getum.member.*" %>
<%
request.setCharacterEncoding("utf-8");
MemberDTO memberDTO = new MemberDTO();

String m_id = request.getParameter("m_id");
String m_pwd = request.getParameter("m_pwd");
String m_name = request.getParameter("m_name");
String m_email = request.getParameter("m_email");
String m_hp = request.getParameter("m_hp");

memberDTO.setM_id(m_id);
memberDTO.setM_pwd(m_pwd);
memberDTO.setM_name(m_name);
memberDTO.setM_email(m_email);
memberDTO.setM_hp(m_hp);

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String now = year + "-" + month + "-" + day;
java.sql.Date m_birthday = java.sql.Date.valueOf(now);

memberDTO.setM_birthday(m_birthday);

%>

<html>
<body>

<%= memberDTO.getM_id() %>
<%= memberDTO.getM_pwd() %>
<%= memberDTO.getM_name() %>
<%= memberDTO.getM_email() %>
<%= memberDTO.getM_hp() %>
</body>
</html>