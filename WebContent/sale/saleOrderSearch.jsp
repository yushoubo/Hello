<%@ page language="java" import="com.demo.supermarketSale.*" import="com.demo.supermarket.*"  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*"%>
    <%@page errorPage="saleError.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>支农网上生鲜超市</title>
      <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
      <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
      <link href="../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">   

  <script>
  function ret(){
	  window.location.href="saleMain.jsp";
  }

  function searchbyselect(){
  	if(document.getElementById("selectsearchoption").value=="date")
     { document.getElementById("tip").innerHTML="查询格式如： 2017-04-03" }
     else if(document.getElementById("selectsearchoption").value=="id")
     { document.getElementById("tip").innerHTML="查询格式如：201704020001" }
     else
     { document.getElementById("tip").innerHTML="查询格式如： 黄瓜" }
  }
  </script> 
   
   
   
</head>
<body>
<%
  String userName=(String)request.getSession().getAttribute("sellername");
%>
<nav class="navbar navbar-default" style="padding:20px">
<a href="../index.jsp" class=navbar-brand" style="padding:40px"><span class="glyphicon glyphicon-home">首页</a>
<button  class="btn btn-default" onclick="ret()">返回</button>
</nav>
<div class="container">
 

</div>


<div class="container" id="">
<form action="${pageContext.request.contextPath}/SearchOrderServlet?userName=<%=userName %>" method="post"> 
<div class="input-prepend input-append">
<span class="add-on"><select name="select" id="selectsearchoption" onclick="searchbyselect()" class="selectpicker" style="width:150px ;height:40px">
<option value="id">订单编号</option>
<option value="date">下单日期</option>
<option value="name">商品标题</option>
</select></span>

<input type="text" style="width:300px" name="input" placeholder="输入查询内容，支持模糊查询" class="span2 search-query input-lg">
<span class="add-on">
<button type="submit" class="btn btn-success"  style="width:100px;height:50px"><span class="glyphicon glyphicon-search">查询</span></button>&nbsp;&nbsp;<span id="tip" style="color:#6E6E6E">查询格式如：201704020001</span>
</form>
</div>
<%! 
  Order order=new Order();
  
%>
<div  class="table-responsive">
<table  class="table table-striped table-hover">
<caption>查询结果</caption>
<tr>
<td>订单编号</td>
<td>收货人姓名</td>
<td>创建时间</td>
<td>订单状态</td></tr>

<%
   ArrayList b=new ArrayList();
   b=(ArrayList)request.getSession().getAttribute("list");
   int k=0;
   if(b.size()!=0){k=b.size();}
  for(int i=0;i<k;i++){
	  order=(Order)b.get(i);
%>
<tr>
<td>
<a href="saleOrderDetails.jsp?id=<%=order.getorderID() %>" target="_blank"><%=order.getorderID() %></a></td>
<td><%=order.getreceiverName()%></td>
<td><%=order.getcreatTime()%></td>
<td><%=order.getorderStatus()%></td>
</tr>
<% }%>
</table>



</div>


</body>
</html>