<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.getum.order.service.OrderSuccessRequest"%>
<%@ page import="com.getum.cart.service.CartRequest"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./jspf/_essentialHead.jspf" %>
</head>
<body>
<!--  ======================= Start Header Area ============================== -->
<%@ include file="./jspf/_header.jspf" %>
<!--  ======================= End Header Area ============================== -->


<!--  ======================= Start Main Area ================================ -->
<main class="site-main">
<!--  ======================= Start orderSuccess Area =======================  -->

<section class="orderSuccess-area">
<div class="container">
	<div class="py-5">
		<h1>주문 완료</h1>
        <table class="table">
		        <tr>
		            <td>${orderResult.r_no}</td>
		        </tr>
		        <tr>
		            <td>${orderResult.r_name}</td>
		        </tr>
		        <tr>
		            <td>${orderResult.r_hp}</td>
		        </tr>
		        <tr>
		            <td>${orderResult.r_addr1}</td>
		        </tr>
		        <tr>
		            <td>${orderResult.r_addr2}</td>
		        </tr>
		        <tr>
		            <td>${orderResult.r_post}</td>
		        </tr>
		        <tr>
		            <td>${orderResult.r_request}</td>
		        </tr>
		        <%
		        OrderSuccessRequest temp = (OrderSuccessRequest)request.getAttribute("orderResult");
		        Hashtable<String, CartRequest> hcart = temp.getHcart();
		        Enumeration hcartKey = hcart.keys();
		        CartRequest cReq = null;
		        	while(hcartKey.hasMoreElements()){
		        		cReq = (CartRequest) hcart.get(hcartKey.nextElement());
		        %>
			        <tr>
			            <td><%= cReq.getName() %></td>
			            <td><%= cReq.getManufacture() %></td>
			            <td><%= cReq.getPrice() %></td>
			            <td><%= cReq.getQuantity() %></td>
			        </tr>	
			        <tr>
			        	<td><%= cReq.getImgName() %></td>
			        </tr>
		        <%
		        	}//while
		        %>
		</table>
	</div>
</div>
</section>

<!--  ======================= End orderSuccess Area =======================  -->
</main>
<!--  ======================= END Main Area ================================ -->


<!--  ======================= Start footer Area ================================ -->

<%@ include file="./jspf/_footer.jspf" %>

<!--  ======================= END footer Area ================================ -->


<%@ include file="./jspf/_essentialFoot.jspf" %>

</body>
</html>