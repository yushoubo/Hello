<%@ page language="java" import="com.demo.supermarket.*" import="com.demo.supermarketSale.*"  contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
    <%@page import="java.util.*"%>
    <%@page import="java.text.SimpleDateFormat" %>
   <%@page errorPage="saleError.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>֧ũ�������ʳ���</title>
      <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
      <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
      <link href="../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">   
  
  <script>
  function cancelinfor(){
	  alert("�����ѳɹ�ȡ����")
  }
  function confirminfor(){
	  alert("�����ѳɹ�ȷ�ϣ��뾡�췢����")
  }
  function sendinfor(){
	  alert("�����ѳɹ�������")
  }
  </script>
  
</head>
<body>


<%!
   String id;
   ArrayList list=new ArrayList();
   ArrayList goodslist=new ArrayList();
   Order order=new Order();
   Goods goods=new Goods();
   Composition composition=new Composition();
   String status;
%>

<%
  id=request.getParameter("id");
  OrderSearch t=new OrderSearch();
  OrderSearch m=new OrderSearch();
  list=t.SearchOrderDetails(id);
  goodslist=m.SearchOrderGood(id);
  order=(Order)list.get(0);
  status=order.getorderStatus().trim();  
  
%>
<div class="container"  >
<div class="table-responsive">
<table class="table table-striped table-hover">
<caption style="font-size:30px;padding:30px;color:#0000FF" >��������</caption>
<tr style="color:#FF0000;background-color:#D3D3D3" >
<td>�������</td>
<td>�ջ�������</td>
<td>��ϵ��ʽ</td>
<td>����״̬</td></tr>

<tr>
<td><%=order.getorderID() %></td>
<td><%=order.getreceiverName() %></td>
<td><%=order.getPhone() %></td>
<td id="status"><%=status %></td>
</tr>

<tr style="color:#FF0000;background-color:#D3D3D3" >
<td>����ʱ��</td>
<td>����ʱ��</td>
<td>ȷ��ʱ��</td>
<td>����ʱ��</td></tr>

<tr>
<td><%=order.getcreatTime() %></td>

<% if(order.getpayTime()==null){ %>
<td>δ����</td>
<%}else{ %>
<td><%=order.getpayTime() %></td>
<%} %>

<% if(order.getconfirmTime()==null){ %>
<td>δȷ��</td>
<%}else{ %>
<td><%=order.getconfirmTime()%></td>
<%} %>

<% if(order.getdeliveryTime()==null){ %>
<td>δ����</td>
<%}else{ %>
<td><%=order.getdeliveryTime() %></td>
<%} %>
</tr>

</table>
</div>
</div>

<div  class="container" >
<div class="table-responsive" style="padding-bottom:20px">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" align="center" style="padding:20px" class="tooltip-test" data-toggle="tooltip" title="���չ��/�۵������а�������Ʒ�б�">��Ʒ�б�</a>    
        <div id="collapseOne" class="panel-collapse collapse ">
            <div class="panel-body">
            <table class="table table-striped table-hover">
            <tr style="color:#FF0000;background-color:#90EE90">
            <td>��Ʒ���</td>
            <td>��Ʒ����</td>
            <td>��Ʒ���</td>
            <td>��Ʒ����</td>
            <td>��Ʒ����</td>
            <td>��Ʒ�ܼ�</td>
            <%
            for(int i=0;i<goodslist.size();i+=2){
              goods=(Goods)goodslist.get(i);
	          composition=(Composition)goodslist.get(i+1);
            %>
                <tr>
                <td><a href="#"><%=goods.getGoodsID() %></a></td>
                <td><%=goods.getGoodsName() %></td>
                <td><%=goods.getGoodsType() %></td>
                <td><%=goods.getGoodsPrice() %></td>
                <td><%=composition.getgoodsAmount() %></td>
                <td><%=goods.getGoodsPrice()*composition.getgoodsAmount() %></td></tr>
                <%} %>
                 </table>
            </div>
        </div>
 </div>
 </div>
 
 
 <div  class="container" >  
 <div class="table-responsive">
<table class="table table-striped table-hover">

<tr style="color:#FF0000;background-color:#D3D3D3" >
<td>�˷�</td>
<td>�ϼƼ۸�</td>
</tr>

<tr>
<td><%=order.getshipCost() %></td>
<td><%=order.getallPrice() %></td>
</tr>
</table>
</div>
</div>


 <div  class="container" > 
 <div class="table-responsive"> 
<table class="table table-striped table-hover">

<tr style="color:#FF0000;background-color:#D3D3D3" >
<td>�ջ���ַ</td>
<td>�ʱ�</td>
</tr>

<tr>
<td><%=order.getProvince() %>-<%=order.getCity() %>-<%=order.getDistrict() %>-<%=order.getStreet() %>-<%=order.getAddress() %>-<%=order.getDistrict() %></td>
<td><%=order.getPostcode() %></td>
</tr>

</table>
<div >
<%if(!status.equals("������ȡ��")) {%>
<form action="${pageContext.request.contextPath}/OrderControServlet" align="right">
  <input type="text" name="contro" value="0"  style="display:none">
  <input type="text" name="id" value="<%=order.getorderID() %>" style="display:none">
  <input type="submit" style="width:150px;height:50px" class="btn btn-warning"  onclick="cancelinfor()" value="ȡ������"/>
</form>
<%} %>
<p></p>
<%if(status.equals("�ȴ�����ȷ��")) {%>
<form action="${pageContext.request.contextPath}/OrderControServlet"  align="right">
   <input type="text" name="contro" value="1" style="display:none">
  <input type="text" name="id" value="<%=order.getorderID() %>" style="display:none">
  <input type="submit" style="width:150px;height:50px" class="btn btn-primary" onclick="confirminfor()" value="ȷ�϶���"/>
</form>
<%} if(status.equals("�ȴ����ҷ���")) { %>
<p></p>
<form action="${pageContext.request.contextPath}/OrderControServlet"  align="right">
   <input type="text" name="contro" value="2" style="display:none">
  <input type="text" name="id" value="<%=order.getorderID() %>" style="display:none">
  <input type="submit" style="width:150px;height:50px" class="btn btn-primary" onclick="sendinfor()"  value="����"/>
</form>
<%} %>
</div>
</div>
</div>



</body>
</html>