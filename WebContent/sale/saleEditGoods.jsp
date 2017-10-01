<%@ page language="java" contentType="text/html; charset=utf-8" import="com.demo.supermarketSale.*" import="com.demo.supermarket.*" 
	pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page errorPage="saleError.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>支农网上生鲜超市</title>
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
      <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
      <link href="../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet"> 

  <style>
input::-webkit-input-placeholder{color:#436EEE;}
input:-moz-placeholder{color:#436EEE;}

</style>

<script>
function doclick(){
	document.getElementById("saveinfor").style.display="block";
	document.getElementById("infor_6").style.display="none";
	document.getElementById("selecttype").style.display="block";
	var arr=document.getElementsByTagName("input"); 
	  for(var i=0;i<arr.length;i++){ 
	   if(arr[i].id.indexOf("infor")>-1){ 
	    arr[i].readOnly=false;
	   } 
	  } 
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
  if (validate_required(name,"请填写商品名称！")==false)
    {name.focus();return false}
  if (validate_required(count,"请填写商品数量！")==false)
  {count.focus();return false}
  if (validate_required(price,"请填写商品单价！")==false)
  {price.focus();return false}
  if (validate_required(storeWay,"请填写运输中存储！")==false)
  {storeWay.focus();return false}
  if (validate_required(sourceArea,"请填写原产地！")==false)
  {sourceArea.focus();return false}
  if (validate_required(type,"请填写商品类别！")==false)
  {type.focus();return false}
  if (validate_required(leastAmount,"请填写起送量！")==false)
  {leastAmount.focus();return false}
  if (validate_required(largeAmount,"请填写大量采购起送量！")==false)
  {largeAmount.focus();return false}
  if (validate_required(largePrice,"请填写大量采购价！")==false)
  {largePrice.focus();return false}
  if (validate_required(goodsSize,"请填写商品规格！")==false)
  {goodsSize.focus();return false}
  if (validate_required(goodsIntro,"请填写商品简介！")==false)
  {goodsIntro.focus();return false}
  else{alert("商品信息修改成功！");return true}
  }

}


function validate_form2(thisform)
{
with (thisform)
  {
  if (validate_required(uploadFile,"请选择一张图片！")==false)
    {uploadFile.focus();return false}
  var fileName = document.getElementById("uploadFile").value;  
 
  //截取文件后缀名  
  var file_suffix = fileName.substr(fileName.length-3);  
 
    
  //在这里进行判断，如果上传的文件类型不是你所规定的文件后缀类型，则返回false，否则return或者什么也不写，会提交到后台  
  //假如你允许上传的文件类型是.dll的，那你就进行判断  
  if(file_suffix != "jpg"&&file_suffix != "png"&&file_suffix != "gif"){  
      alert("您上传的文件类型不被允许，请重传，只允许上传.jpg或.png或.gif格式图片");  
      return false;  
  }  
  else{alert("图片提交成功！");return true}
  }

}
</script> 

</head>

<body>
<nav class="navbar navbar-default" style="padding:20px">

<form  style="padding:10px" action="${pageContext.request.contextPath}/GoodsControServlet?value=release&sellerName=<%=request.getSession().getAttribute("sname") %>" method="post">
<a href="../index.jsp" class=navbar-brand" style="padding:20px"><span class="glyphicon glyphicon-home">首页</a>
<input type="submit"  class="btn btn-default" value="返回">
</form>
</nav>

<div class="container" style="padding-bottom:100px">
<%!
  Goods goods=new Goods();
  String goodsname;
%>
<%
  goods=(Goods)request.getSession().getAttribute("goods");
%>
<form onsubmit="return validate_form(this)" action="${pageContext.request.contextPath}/GoodsControServlet?value=saveedit&goodsID=<%=goods.getgoodsID() %>" method="post" >

<table border="4" >
<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">商品编号:</td>
<td class="col-sm-3 col-md-2"><input type="text"  disabled value="<%=goods.getgoodsID() %>"></td>

<td style="padding:20px" class="col-sm-3 col-md-2">商品名称：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="name" readOnly id="infor_1" value="<%=goods.getgoodsName().trim()%>" ></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">商品数量：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="count" readOnly id="infor_2" value="<%=goods.getgoodsCount()%>"></td>

<td style="padding:20px" class="col-sm-3 col-md-2">商品单价:</td>
<td class="col-sm-3 col-md-2"><input type="text" name="price" readOnly id="infor_3" value="<%=goods.getgoodsPrice() %>"></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">运输中存储：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="storeWay" readOnly id="infor_4" value="<%=goods.getstoreWay().trim()%>"></td>

<td style="padding:20px" class="col-sm-3 col-md-2">原产地：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="sourceArea" readOnly id="infor_5" value="<%=goods.getsourceArea().trim()%>"></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">商品类别:</td>
<td  class="col-sm-3 col-md-2"><input type="text"  readOnly id="infor_6" value="<%=goods.getgoodsType().trim() %>">


<select name="type" id="selecttype"  class="selectpicker" style="width:150px ;height:40px;display:none">
<option value="<%=goods.getgoodsType()%>">原类别：<%=goods.getgoodsType()%></option>
<option value="蔬菜">蔬菜</option>
<option value="水果">水果</option>
<option value="肉品">肉品</option>
<option value="水产">水产</option>
<option value="蛋类">蛋类</option>
<option value="干货">干货</option>
</select></td>


<td style="padding:20px" class="col-sm-3 col-md-2">起送量：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="leastAmount" readOnly id="infor_7" value="<%=goods.getleastAmount()%>"></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">大量采购起送量：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="largeAmount" readOnly id="infor_8" value="<%=goods.getlargeAmount()%>"></td>

<td style="padding:20px" class="col-sm-3 col-md-2">大量采购价：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="largePrice" readOnly id="infor_9" value="<%=goods.getlargePrice()%>"></td>
</tr>

<tr>
<td style="padding:20px" class="col-sm-3 col-md-2">商品规格：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="goodsSize" readOnly id="infor_10" value="<%=goods.getgoodsSize().trim()%>"></td>

<td style="padding:20px" class="col-sm-3 col-md-2">商品简介：</td>
<td class="col-sm-3 col-md-2"><input type="text" name="goodsIntro" readOnly id="infor_11" value="<%=goods.getgoodsIntro().trim()%>"></td>
</tr>
</table>

<div style="padding:20px">
<table>
<tr><td><p   class="btn btn-default btn-lg" onclick="doclick()">修改信息</p></td>
<td style="padding:20px"></td>
<td><button type="submit" class="btn btn-primary btn-lg" style="display:none" id="saveinfor" >保存修改</button></td>
</table>
</div>

</form>

<form onsubmit="return validate_form2(this)" method="post" action="${pageContext.request.contextPath}/ImgUploadServlet?goodsID=<%=goods.getgoodsID() %>" enctype="multipart/form-data">
<div>
<h4>商品图片：</h4>
 <div class="thumbnail" style="height:220px;width:310px">
            <div style="height:220px;width:310px overflow:hidden; text-align:center; border:none">
            <img src="../resources/images/<%=goods.getPicture() %>" 
                 class="img-responsive center-block"   style="display:inline-block; vertical-align:middle; max-height:220px; max-width:300px;">
                 </div>
</div>
<input type="file" id="uploadFile" name="uploadFile" />
</div>
<div style="padding-top:20px">
<button type="submit" class="btn btn-primary btn-lg">提交图片</button>
</div>
</form>

</div>
</div>
</body>
</html>