<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.Connection" %>
<%@ page import="java.security.MessageDigest" %>
    
<%
String m_id=request.getParameter("m_id");
String m_pwd=request.getParameter("m_pwd");
String recentPwd=request.getParameter("recentPwd");
String newPwd=request.getParameter("newPwd");
int check = 999;

//해시 확인
String saltedPass = "ypl"+recentPwd;
String resultPass = null;


try {
    MessageDigest digest = MessageDigest.getInstance("SHA-256");
    byte[] hash = digest.digest(saltedPass.getBytes("UTF-8"));

    StringBuilder hexString = new StringBuilder();
    for (int i: hash) {
    	if(Integer.toHexString(0xFF & i).length() == 2) {
            hexString.append(Integer.toHexString(0xFF & i));
    	}else {
            hexString.append ( 0x00 + Integer.toHexString(0xFF & i));
    	}
    }
    resultPass = hexString+"";
} catch (Exception e) {
    System.out.println("비밀번호변경 해시처리 에러: "+e);
}//try


if(resultPass.equals(m_pwd)) {
	//비번일치
	Connection conn = com.getum.util.DBConnection.getCon();
	com.getum.member.model.MemberDAO dao = com.getum.member.model.MemberDAO.getInstance();
	// 1:성공 / 0:변경에러
	check = dao.changePwd(conn, newPwd, m_id);
}else {
	//비번불일치
	check = -1;
}



%>

{
 "check":<%=check%>
}
