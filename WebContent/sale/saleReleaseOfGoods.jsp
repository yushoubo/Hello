<%@ page language="java" contentType="text/html; charset=utf-8" import="com.demo.supermarketSale.*" import="com.demo.supermarket.*" 
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
  </script>
</head>
<body>
<%String sellerName=(String)request.getSession().getAttribute("sname"); %>
<%!
  Goods goods=new Goods();
  ArrayList goodslist=new ArrayList();
  int i1;
%>

<nav class="navbar navbar-default" style="padding:20px">
<a href="../index.jsp" class=navbar-brand" style="padding:40px"><span class="glyphicon glyphicon-home">首页</a>
<button  class="btn btn-default" onclick="ret()">返回</button>
</nav>
<div class="container col-md-12" style="background-color:#EBEBEB">
<h1 style="color:#A3A3A3">已发布商品</h1>
<div class="styled-select">
<form style="padding-top:20px" action="${pageContext.request.contextPath}/GoodsControServlet?value=searchgoods&&name=<%=sellerName%>" method="post">
<span style="font-size:20px;color:#FF8C00">商品类别</span>
<select name="goodstype" id="selecttype"  class="selectpicker" style="width:250px ;height:30px;font-size:20px">
<option value="全部">全部</option>
<option value="蔬菜">蔬菜</option>
<option value="水果">水果</option>
<option value="肉品">肉品</option>
<option value="水产">水产</option>
<option value="蛋类">蛋类</option>
<option value="干货">干货</option>
</select>
<button type="submit" class="btn btn-primary btn-lg" style="width:100px ;height:50px">确定</button>
</form>
</div>
<div class="row" style="margin-top:100px">
<%
  goodslist=(ArrayList)request.getSession().getAttribute("goodslist");
  if(goodslist!=null){
  for(i1=0;i1<goodslist.size();i1++){
	  goods=(Goods)goodslist.get(i1);
	  if(goods!=null){
%>
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail" style="height:400px;width:310px">
            <div style="height:220px;width:310px; overflow:hidden; text-align:center;border:none">
            <img src="../resources/images/<%=goods.getPicture() %>"
                 class="img-responsive center-block"  style="display:inline-block; vertical-align:middle; max-height:220px; max-width:300px;">
                 </div>
            <div class="caption">
                <h3 style="color:red"><%=goods.getgoodsName() %>&nbsp;&nbsp;￥<%=goods.getgoodsPrice() %></h3>
                <p>产地：<%=goods.getsourceArea() %></p>
                <p>
                   <table>
                   <tr>
                   <td style="padding:20px" >
                    <form action="${pageContext.request.contextPath}/GoodsControServlet?value=edit&goodsID=<%=goods.getgoodsID() %>" method="post" >
                    <button type="submit" class="btn btn-primary" role="button">编辑商品 </button></form>
                    </td>
                    <td>
                    <form action="${pageContext.request.contextPath}/GoodsControServlet?value=delete&goodsID=<%=goods.getgoodsID() %>" method="post" >
                    <button type="submit" class="btn btn-default" role="button">删除商品 </button></form>
                    </td>
                    </tr>
                   </table>
                </p>
            </div>
        </div>
    </div>
    <%}}} %>
</div>





</div>
</body>
</html>