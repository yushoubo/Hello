<%@ page language="java" contentType="text/html; charset=utf-8" import="com.demo.supermarketSale.*" import="com.demo.supermarket.*" 
	pageEncoding="utf-8"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>支农网上生鲜超市</title>
      <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
      <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
      <link href="../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">   


<script>
function doclick(){
	document.getElementById("saveinfor").style.display="block";
	var arr=document.getElementsByTagName("input"); 
	  for(var i=0;i<arr.length;i++){ 
	   if(arr[i].id.indexOf("infor")>-1){ 
	    arr[i].readOnly=false;
	   } 
	  } 
	  if(document.getElementById("idtext_1").value.length==0){
	  var arr2=document.getElementsByTagName("input"); 
	  for(var i=0;i<arr2.length;i++){ 
	   if(arr2[i].id.indexOf("idtext")>-1){ 
	    arr2[i].readOnly=false;
	   } 
	  } 
	  }
}

function infor1(){
	alert("信息修改成功！");
}

function searchbyselect(){
	if(document.getElementById("selectsearchoption").value=="date")
   { document.getElementById("tip").innerHTML="查询格式如： 2017-04-03" }
   else if(document.getElementById("selectsearchoption").value=="id")
   { document.getElementById("tip").innerHTML="查询格式如：201704020001" }
   else
   { document.getElementById("tip").innerHTML="查询格式如： 黄瓜" }
}


function validate_required(field,alerttxt)
{
with (field)
  {
  if (value==null||value=="")
    {alert(alerttxt);return false}
  else {return true}
  }
}
function validate_form(thisform)
{
with (thisform)
  {
	if (validate_required(realName,"请填写真实姓名！")==false)
    {realName.focus();return false}
	if (validate_required(idnumber,"请填写身份证号！")==false)
    {idnumber.focus();return false}
  if (validate_required(Phone,"请填写电话号码！")==false)
    {Phone.focus();return false}
  if (validate_required(postCode,"请填写邮编！")==false)
  {postCode.focus();return false}
  if (validate_required(Province,"请填写省份！")==false)
  {Province.focus();return false}
  if (validate_required(City,"请填写城市！")==false)
  {City.focus();return false}
  if (validate_required(District,"请填写区县！")==false)
  {District.focus();return false}
  if (validate_required(Street,"请填写街道！")==false)
  {Street.focus();return false}
  if (validate_required(Address,"请填写详细地址！")==false)
  {Address.focus();return false}
  if (validate_required(sellerIntro,"请填写卖家简介！")==false)
  {sellerIntro.focus();return false}
  }
alert("信息修改成功！");
}



function validate_form2(thisform)
{
with (thisform)
  {
  if (validate_required(addGoodsName,"请填写商品名称！")==false)
    {addGoodsName.focus();return false}
  if (validate_required(addGoodsCount,"请填写商品数量！")==false)
  {addGoodsCount.focus();return false}
  if (validate_required(addGoodsPrice,"请填写商品单价！")==false)
  {addGoodsPrice.focus();return false}
  if (validate_required(addStoreWay,"请填写运输中存储！")==false)
  {addStoreWay.focus();return false}
  if (validate_required(addSourceArea,"请填写原产地！")==false)
  {addSourceArea.focus();return false}
  if (validate_required(addGoodsType,"请选择商品类别！")==false)
  {addGoodsType.focus();return false}
  if (validate_required(addLeastAmount,"请填写起送量！")==false)
  {addLeastAmount.focus();return false}
  if (validate_required(addLargeAmount,"请填写大量采购起送量！")==false)
  {addLargeAmount.focus();return false}
  if (validate_required(addLargePrice,"请填写大量采购价！")==false)
  {addLargePrice.focus();return false}
  if (validate_required(addGoodsSize,"请填写商品规格！")==false)
  {addGoodsSize.focus();return false}
  if (validate_required(addGoodsIntro,"请填写商品简介！")==false)
  {addGoodsIntro.focus();return false}
  }
}


</script>   
</head>
<body>
<%String sellerName=(String)request.getSession().getAttribute("sname"); %>
<div id="myCarousel" class="carousel slide">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   

	<!-- 轮播（Carousel）项目 -->
	<div align="center" class="carousel-inner">
		<div class="item active" style="background:#46ad37">
		<img src="../resources/images/top1.png"  alt="First slide" >
		</div>
		<div class="item">
		<img src="../resources/images/top2.png" alt="Second slide">
		</div>
		<div class="item" style="background:#9ab536">
		<img src="../resources/images/top3.png"  alt="Third slide">
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="carousel-control left" href="#myCarousel" data-slide="prev">‹</a>
	<a class="carousel-control right" href="#myCarousel" data-slide="next">›</a>
</div>

<!-- 控制按钮 -->

<script>
	$('.carousel').carousel({interval:5000});
    $('.carousel').carousel();
</script>
 <div class="container">
 <nav class="navbar navbar-default" style="padding:20px">
<a href="../index.jsp" class=navbar-brand" style="padding:40px" ><span class="glyphicon glyphicon-home">首页</a>

<ul id="myTab" class="nav nav-tabs" style="padding:20px">

<li class="active">
<a href="#sellerinfo" tabindex="-1" data-toggle="tab" ><span class="glyphicon glyphicon-user"></span> 我的信息</a>
</li>

<li class="dropdown"><a href="#" id="myTabDrop2" class="dropdown-toggle"  data-toggle="dropdown"><span class="glyphicon glyphicon-folder-close">商品管理<span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop2">
<li ><a href="#releaseofgoods" tabindex="-1" data-toggle="tab" >
<form action="${pageContext.request.contextPath}/GoodsControServlet?value=release&sellerName=<%=sellerName %>" method="post" ><button style="border:none;background-color:#FFFFFF" type="submit" >已发布商品</button> </form></a></li>
<li><a href="#addgoods" tabindex="-1" data-toggle="tab">添加商品</a></li>
</ul>
</li>


<li class="dropdown"><a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-th">订单管理<span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
<li><a href="#allorder" tabindex="-1" data-toggle="tab">全部订单</a></li>
<li><a href="#waitpayorder" tabindex="-1" data-toggle="tab">待付款订单</a></li>
<li><a href="#waitsendorder" tabindex="-1" data-toggle="tab">待发货订单</a></li>
<li><a href="#sendorder" tabindex="-1" data-toggle="tab">已发货订单</a></li>
<li><a href="#cancelorder" tabindex="-1" data-toggle="tab">已取消订单</a></li>
<li><a href="#ordersearch" tabindex="-1" data-toggle="tab">订单查询</a></li>
</ul>
</li>
</ul>








<%! 
  Order order=new Order();
  ArrayList list=new ArrayList();
  int i;
%>









<div id="myTabContent" class="tab-content">




<div class="tab-pane fade in active" id="sellerinfo">
<div class="container" >
 
<%!
  SellerInfo info=new SellerInfo();
  String[] sellerinfo=new String[13];
%>
<% 
  sellerinfo=info.SellerInfo(sellerName);
%>
<p id="warning">卖家信息      可进行编辑</p>
<form onsubmit="return validate_form(this)" action="${pageContext.request.contextPath}/EditSellerInfoServlet?userName=<%=sellerinfo[2] %>" method="post" align="center">

<table  border="0" cellspacing="0" style="border-collapse:collapse">
<tr>
<td style="padding:20px" class="col-sm-3 col-md-3" >卖家编号:</td>
<td class="col-sm-3 col-md-3"><input type="text"  readOnly value="<%=sellerinfo[0] %>"></td>

<td style="padding:20px" class="col-sm-3 col-md-3">注册时间：</td>
<td class="col-sm-3 col-md-3"><input type="text" readOnly value="<%=sellerinfo[1]%>" ></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">真实姓名:</td>
<td class="col-sm-3 col-md-2"><input type="text" name="realName" readOnly id="idtext_1" value="<%=sellerinfo[3] %>"></td>

<td style="padding:20px" class="col-sm-3 col-md-2">身份证号：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="idnumber" readOnly id="idtext_2" value="<%=sellerinfo[4]%>"></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">用户昵称：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="userNmae" readOnly value="<%=sellerinfo[2]%>"></td>

<td style="padding:20px" class="col-sm-3 col-md-2">电话号码：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="Phone" readOnly id="infor_1" value="<%=sellerinfo[5]%>"></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">邮编:</td>
<td class="col-sm-3 col-md-2"><input type="text" name="postCode"  readOnly id="infor_2" value="<%=sellerinfo[6] %>"></td>

<td style="padding:20px" class="col-sm-3 col-md-2">省份：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="Province"  readOnly id="infor_3" value="<%=sellerinfo[7]%>"></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">城市：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="City"  readOnly id="infor_4" value="<%=sellerinfo[8]%>"></td>

<td style="padding:20px" class="col-sm-3 col-md-2">区县：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="District"  readOnly id="infor_5" value="<%=sellerinfo[9]%>"></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">街道：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="Street"  readOnly id="infor_6" value="<%=sellerinfo[10]%>"></td>

<td style="padding:20px" class="col-sm-3 col-md-2">详细地址：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="Address"  readOnly id="infor_7" value="<%=sellerinfo[11]%>"></td>
</tr>
<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">卖家简介：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="sellerIntro"  readOnly id="infor_8" value="<%=sellerinfo[12]%>"></td>
</tr>


</table>
<table>
<tr>
<td style="padding:20px"><p  class="btn btn-default btn-lg" onclick="doclick()">修改信息</p></td>
<td><button  type="submit" class="btn btn-primary btn-lg" style="display:none" id="saveinfor" >保存修改</button></td>
</tr>
</table>
</form>
</div>
</div>


<div class="tab-pane fade " id="addgoods">



<div class="container" >
<%!
  String addGoodsID;
%>
<%
  GoodsID id=new GoodsID();
  addGoodsID=id.GoodsID();
%>

<form onsubmit="return validate_form2(this)" id="goodsinforform" method="post" action="${pageContext.request.contextPath}/GoodsControServlet?value=add&sellerName=<%=sellerName%>&addGoodsID=<%=addGoodsID %>">

<table border="4" >
<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">商品编号:</td>
<td class="col-sm-3 col-md-2"><input type="text"  disabled placeholder=<%=addGoodsID %>></td>

<td style="padding:20px" class="col-sm-3 col-md-2">商品名称：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="addGoodsName" placeholder="请输入商品名称" ><span style="color:red;font-size:20px">*</span></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">商品数量：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="addGoodsCount" placeholder="请输入商品数量"><span style="color:red;font-size:20px">*</span></td>

<td style="padding:20px" class="col-sm-3 col-md-2">商品单价:</td>
<td class="col-sm-3 col-md-2"><input type="text" name="addGoodsPrice" placeholder="请输入商品单价"><span style="color:red;font-size:20px">*</span></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">运输中存储：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="addStoreWay" placeholder="请输入运输中存储"><span style="color:red;font-size:20px">*</span></td>

<td style="padding:20px" class="col-sm-3 col-md-2">原产地：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="addSourceArea" placeholder="请输入商品原产地"><span style="color:red;font-size:20px">*</span></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">商品类别:</td>
<td class="col-sm-3 col-md-2"><select name="addGoodsType" class="selectpicker" style="width:150px ;height:40px">
<option value="蔬菜">蔬菜</option>
<option value="水果">水果</option>
<option value="肉品">肉品</option>
<option value="水产">水产</option>
<option value="蛋类">蛋类</option>
<option value="干货">干货</option>
</select><span style="color:red;font-size:20px">*</span></td>

<td style="padding:20px" class="col-sm-3 col-md-2">起送量：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="addLeastAmount" placeholder="请输入商品起送量"><span style="color:red;font-size:20px">*</span></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">大量采购起送量：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="addLargeAmount" placeholder="请输入大量采购起送量"><span style="color:red;font-size:20px">*</span></td>

<td style="padding:20px" class="col-sm-3 col-md-2">大量采购价：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="addLargePrice" placeholder="请输入大量采购价"><span style="color:red;font-size:20px">*</span></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">商品规格：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="addGoodsSize" placeholder="请输入商品规格/g"><span style="color:red;font-size:20px">*</span></td>

<td style="padding:20px" class="col-sm-3 col-md-2">商品简介：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="addGoodsIntro" placeholder="请输入商品简介"><span style="color:red;font-size:20px">*</span></td>
</tr>
</table>

<button type="submit" onclick="addpic()" class="btn btn-primary" >确认添加 </button>
</form>

</div>
</div>





<div class="tab-pane fade " id="allorder">
<div class="container">
<div class="table-responsive">
<table class="table table-striped table-hover">
<caption>待发货订单</caption>
<tr class="active">
<td>订单编号</td>
<td>收货人姓名</td>
<td>创建时间</td>
<td>订单状态</td></tr>
<%
   OrderSearch all=new OrderSearch();
   list=all.SearchAllOrder(sellerName);
   
   for(i=0;i<list.size();i++){
	   order=(Order)list.get(i);
	   if(order.getorderStatus()=="卖家已发货"){
%>
<tr class="success" >
<%}else{ %>
<tr >
<%} %>
<td>
<a href="saleOrderDetails.jsp?id=<%=order.getorderID() %>" target="_blank" class="tooltip-test" data-toggle="tooltip" title="点击查看订单详情"><%=order.getorderID() %></a></td>
<td><%=order.getreceiverName() %></td>
<td><%=order.getcreatTime()%></td>
<td><%=order.getorderStatus()%></td>

</tr>
<%
   }
%>


</table>
</div>
</div>
   </div>
   
   
 <div class="tab-pane fade " id="waitpayorder"> 
<div class="container">
<div class="table-responsive">
<table class="table table-striped table-hover">
<caption>待付款订单</caption>
<tr>
<td>订单编号</td>
<td>收货人姓名</td>
<td>创建时间</td>
<td>订单状态</td></tr>
<%
  
   OrderSearch pay=new OrderSearch();
   list=pay.SearchWaitPayOrder(sellerName);
  
   for(i=0;i<list.size();i++){
	   order=(Order)list.get(i);
%>
<tr>
<td>
<a href="saleOrderDetails.jsp?id=<%=order.getorderID() %>" target="_blank" class="tooltip-test" data-toggle="tooltip" title="点击查看订单详情"><%=order.getorderID() %></a></td>
<td><%=order.getreceiverName() %></td>
<td><%=order.getcreatTime()%></td>
<td><%=order.getorderStatus()%></td>

</tr>
<%
   }
%>


</table>
</div>
</div>
   </div>
   
   
    <div class="tab-pane fade " id="waitsendorder">
  
<div class="container">
<div class="table-responsive">
<table class="table table-striped table-hover">
<caption>待发货订单</caption>
<tr>
<td>订单编号</td>
<td>收货人姓名</td>
<td>创建时间</td>
<td>订单状态</td></tr>
<%
   OrderSearch wait=new OrderSearch();
   list=wait.SearchWaitSendOrder(sellerName);
   int i;
   for(i=0;i<list.size();i++){
	   order=(Order)list.get(i);
%>
<tr>
<td>
<a href="saleOrderDetails.jsp?id=<%=order.getorderID() %>" target="_blank" class="tooltip-test" data-toggle="tooltip" title="点击查看订单详情"><%=order.getorderID() %></a></td>
<td><%=order.getreceiverName() %></td>
<td><%=order.getcreatTime()%></td>
<td><%=order.getorderStatus()%></td>

</tr>
<%
   }
%>


</table>
</div>
</div>
   </div>
   
   
    <div class="tab-pane fade " id="sendorder">
  
<div class="container">

<div class="table-responsive">
<table class="table table-striped table-hover">
<caption>已发货订单</caption>
<tr>
<td>订单编号</td>
<td>收货人姓名</td>
<td>创建时间</td>
<td>订单状态</td></tr>
<%
   OrderSearch send=new OrderSearch();
   list=send.SearchSendOrder(sellerName);
   for(i=0;i<list.size();i++){
	   order=(Order)list.get(i);
%>
<tr>
<td>
<a href="saleOrderDetails.jsp?id=<%=order.getorderID() %>" target="_blank" class="tooltip-test" data-toggle="tooltip" title="点击查看订单详情"><%=order.getorderID() %></a></td>
<td><%=order.getreceiverName() %></td>
<td><%=order.getcreatTime()%></td>
<td><%=order.getorderStatus()%></td>

</tr>
<%
   }
%>


</table>
</div>
</div>
   </div>
   
   
   <div class="tab-pane fade " id="cancelorder">
  
<div class="container">

<div class="table-responsive">
<table class="table table-striped table-hover">
<caption>已取消订单</caption>
<tr>
<td>订单编号</td>
<td>收货人姓名</td>
<td>创建时间</td>
<td>订单状态</td></tr>
<%
   OrderSearch cancel=new OrderSearch();
   list=cancel.SearchCancelOrder(sellerName);
   for(i=0;i<list.size();i++){
	   order=(Order)list.get(i);
%>
<tr>
<td>
<a href="saleOrderDetails.jsp?id=<%=order.getorderID() %>" target="_blank" class="tooltip-test" data-toggle="tooltip" title="点击查看订单详情"><%=order.getorderID() %></a></td>
<td><%=order.getreceiverName() %></td>
<td><%=order.getcreatTime()%></td>
<td><%=order.getorderStatus()%></td>

</tr>
<%
   }
%>


</table>
</div>
</div>
   </div>
   
   
   
   
   
    <div class="tab-pane fade " id="ordersearch">
  
<div class="container">
<form action="${pageContext.request.contextPath}/SearchOrderServlet?userName=<%=sellerinfo[2] %>" method="post" style="height:400px"> 
<div class="input-prepend input-append">
<span class="add-on"><select name="select" id="selectsearchoption" onclick="searchbyselect()" class="selectpicker" style="width:150px ;height:40px">
<option value="id">订单编号</option>
<option value="date" >下单日期</option>
<option value="name">商品标题</option>
</select></span>

<input type="text"  style="width:300px" name="input"  placeholder="输入查询内容,支持模糊查询" class="span2 search-query input-lg">
<span class="add-on">
<button type="submit" class="btn btn-success"  style="width:100px;height:50px"><span class="glyphicon glyphicon-search">查询</span></button>&nbsp;&nbsp;<span id="tip" style="color:#6E6E6E">查询格式如：201704020001</span>
</form>
</div>
<div id="search">
</div>
   </div>
   
   
   
  

</div>
</nav>
</div>




</body>
</html>