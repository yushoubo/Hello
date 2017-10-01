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



function validate_required(field,alerttxt)
{
with (field)
  {
  if (value==null||value=="")
    {alert(alerttxt);return false}
  else {return true}
  }
}

function validate_form2(thisform)
{
with (thisform)
  {
  if (validate_required(uploadFile,"商品使用默认图片！")==true)
  {
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
  else return true;
  }

}
</script>
</head>

<body>
<%!
  String addGoodsID;
%>
<%
  addGoodsID=(String)request.getSession().getAttribute("addgoodsid");
%>
<nav class="navbar navbar-default" style="padding:20px">
<a href="../index.jsp" class=navbar-brand" style="padding:40px"><span class="glyphicon glyphicon-home">首页</a>
<button  class="btn btn-default" onclick="ret()">返回</button>
</nav>

<div class="container" style="background-color:#CCCCCC">
<form onsubmit="return validate_form2(this)"  method="post" action="${pageContext.request.contextPath}/ImgUploadServlet?goodsID=<%=addGoodsID %>" enctype="multipart/form-data">
<div>
<h4>商品添加成功，请为您的商品添加一张图片：</h4>
 <div class="thumbnail" style="height:220px;width:300px">
            <div style="height:220px;width:220px" overflow:hidden; text-align:center; border:1px solid red;>
            <img src="../resources/images/default.jpg"
                 class="img-responsive center-block"   style="display:inline-block; vertical-align:middle; max-height:220px; max-width:250px;">
                <p>默认图片</p>
                 </div>
</div>
<input type="file" id="uploadFile" name="uploadFile" />
</div>
<div style="padding-top:20px">
<button type="submit" class="btn btn-primary btn-lg" >提交图片</button>
</div>
</form>
</div>
</body>
</html>