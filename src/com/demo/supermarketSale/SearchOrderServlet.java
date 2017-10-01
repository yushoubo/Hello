package com.demo.supermarketSale;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.supermarket.Dao;
import com.demo.supermarket.Order;

/**
 * Servlet implementation class SearchOrderServlet
 */

public class SearchOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		
		String value=request.getParameter("select");
		String searchvalue=request.getParameter("input");
		searchvalue = new String(searchvalue.getBytes("iso-8859-1"),"utf-8");  
		String username=request.getParameter("userName");
		username= new String(username.getBytes("iso-8859-1"),"utf-8");
		
		
		System.out.println("接收到请求:name="+value+"  searchvalue="+searchvalue);
		
	    Dao dao=new Dao();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sqlstr=null;
	    ArrayList list=new ArrayList();
		int i=0;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH-mm-ss E");   
 
		if(value.equals("date")){
		    sqlstr="use onlineMarket select orderID,receiverName,creatTime,orderStatus from [Order]a,Seller b,[User] c  WHERE Convert(varchar(100),a.creatTime,120) LIKE '%"+searchvalue+"%' AND a.sellerID=b.sellerID AND b.userID=c.userID AND c.userName='"+username+"'";
		}
		else if(value.equals("id")){
			  sqlstr="use onlineMarket select orderID,receiverName,creatTime,orderStatus from [Order]a,Seller b,[User] c WHERE a.orderID LIKE '%"+searchvalue+"%' AND a.sellerID=b.sellerID AND b.userID=c.userID AND c.userName='"+username+"'";
		}
		else if(value.equals("name")){
			sqlstr="use onlineMarket select a.orderID,receiverName,creatTime,orderStatus from [Order] a,Composition b,Goods c,Seller d,[User] e WHERE a.orderID=b.orderID AND b.goodsID=c.goodsID AND c.goodsName like '%"+searchvalue+"%' AND a.sellerID=d.sellerID AND d.userID=e.userID AND e.userName='"+username+"'";       
		}
	    try{
		 conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
			pstmt= conn.prepareStatement(sqlstr);
			rs=pstmt.executeQuery();
			while(rs.next()){	
				Order order=new Order();
			    order.setorderID(rs.getString("orderID"));
			    order.setreceiverName(rs.getString("receiverName"));
			    order.setcreatTime(sdf.format(rs.getTimestamp("creatTime")));
			    order.setorderStatus(rs.getString("orderStatus"));
			    list.add(order);
			   // list.add(order);
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
        Order a=new Order();
		for(int j=0;j<list.size();j++){
			a=(Order)list.get(j);
			System.out.println(a.getorderID()+" "+a.getreceiverName()+" "+a.getcreatTime()+" "+a.getorderStatus());
		}
		session.setAttribute("list", list);
		session.setAttribute("sellername", username);
		response.sendRedirect(request.getContextPath()+"/sale/saleOrderSearch.jsp");
		//request.getRequestDispatcher("/sale/searchByDate.jsp").forward(request,response); 

		
	}

}
