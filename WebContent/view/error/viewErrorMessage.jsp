<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
에러발생<br>
에러타입:<%= exception.getClass().getName() %><br>
에러메세지:<%= exception.getMessage() %>
</body>
</html>