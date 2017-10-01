package com.demo.supermarketSale;

import java.io.File;
import java.util.List;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.supermarket.Dao;
import com.demo.supermarket.Goods;
import com.demo.supermarket.Order;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * Servlet implementation class GoodsControServlet
 */
public class GoodsControServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   // 上传文件存储目录
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsControServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
    public ArrayList<Goods> releaseOfGoods(String sellerName){
    	    Dao dao=new Dao();
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sqlstr=null;
		    ArrayList<Goods> list=new ArrayList<Goods>();
		    sqlstr="use onlineMarket select goodsID,goodsName,goodsPrice,sourceArea,Picture from [Goods]a,Seller b,[User]c  where  a.sellerID=b.sellerID AND b.userID=c.userID AND c.userName='"+sellerName+"'";
	      
			
	        System.out.println(sqlstr);
	        
		    try{
			    conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
				pstmt= conn.prepareStatement(sqlstr);
				rs=pstmt.executeQuery();
				while(rs.next()){	
					Goods goods=new Goods();
					goods.setgoodsID(rs.getString("goodsID"));
				    goods.setgoodsName(rs.getString("goodsName"));
				    goods.setgoodsPrice(rs.getFloat("goodsPrice"));
				    goods.setsourceArea((rs.getString("sourceArea")));
				    goods.setpicture(rs.getString("Picture"));
				    list.add(goods);
				   // list.add(order);
				}
			}catch (SQLException e){
				e.printStackTrace();
			}
	        
			return list;
			//session.setAttribute("list", list);
			//response.sendRedirect(request.getContextPath()+"/sale/OrderSearch.jsp");
    }
    
    public ArrayList<Goods> searchGoods(String sellerName,String type){
	    Dao dao=new Dao();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sqlstr=null;
	    ArrayList<Goods> list=new ArrayList<Goods>();
	    sqlstr="use onlineMarket select goodsID,goodsName,goodsPrice,sourceArea,Picture from [Goods]a,Seller b,[User]c  where  a.sellerID=b.sellerID AND b.userID=c.userID AND c.userName='"+sellerName+"' AND a.goodsType='"+type+"'";                                          
      
		
        System.out.println(sqlstr);
        
	    try{
		    conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
			pstmt= conn.prepareStatement(sqlstr);
			rs=pstmt.executeQuery();
			while(rs.next()){	
				Goods goods=new Goods();
				goods.setgoodsID(rs.getString("goodsID"));
			    goods.setgoodsName(rs.getString("goodsName"));
			    goods.setgoodsPrice(rs.getFloat("goodsPrice"));
			    goods.setsourceArea((rs.getString("sourceArea")));
			    goods.setpicture(rs.getString("Picture"));
			    list.add(goods);
			   // list.add(order);
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
        
		return list;
		//session.setAttribute("list", list);
		//response.sendRedirect(request.getContextPath()+"/sale/OrderSearch.jsp");
}
    
    
    public Goods goodsDetails(String goodsID){
	    Dao dao=new Dao();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sqlstr=null;
		Goods goods=new Goods();
		sqlstr="use onlineMarket select * from [Goods] where goodsID='"+goodsID+"'";
		
	    try{
		    conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
			pstmt= conn.prepareStatement(sqlstr);
			rs=pstmt.executeQuery();
			while(rs.next()){	
				goods.setgoodsID(rs.getString("goodsID"));
			    goods.setgoodsName(rs.getString("goodsName"));
				goods.setgoodsCount(rs.getFloat("goodsCount"));
			    goods.setgoodsPrice(rs.getFloat("goodsPrice"));
			    goods.setstoreWay(rs.getString("storeWay"));
			    goods.setsourceArea((rs.getString("sourceArea")));
			    goods.setgoodsType(rs.getString("goodsType"));
			    goods.setleastAmount(rs.getFloat("leastAmount"));
			    goods.setlargeAmount(rs.getFloat("largeAmount"));
			    goods.setlargePrice(rs.getFloat("largePrice"));
			    goods.setsellerID(rs.getString("sellerID"));
			    goods.setgoodsSize(rs.getString("goodsSize"));
			    goods.setgoodsIntro(rs.getString("goodsIntro"));
			    goods.setpicture(rs.getString("Picture"));
			  
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
        
		return goods;
		}
    
    public void saveEdit(String[] name,String[] values){
	    Dao dao=new Dao();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sqlstr=null;
		String[] values2=new String[12];
		sqlstr="use onlineMarket select goodsName,goodsCount,goodsPrice,storeWay,sourceArea,goodsType,leastAmount,largeAmount,largePrice,goodsSize,goodsIntro from [Goods] where goodsID='"+values[0]+"'";
		
	    try{
		    conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
			pstmt= conn.prepareStatement(sqlstr);
			rs=pstmt.executeQuery();
			while(rs.next()){	
				values2[1]=rs.getString("goodsName");
				values2[2]=rs.getString("goodsCount");
				values2[3]=rs.getString("goodsPrice");
				values2[4]=rs.getString("storeWay");
				values2[5]=rs.getString("sourceArea");
				values2[6]=rs.getString("goodsType");
				values2[7]=rs.getString("leastAmount");
				values2[8]=rs.getString("largeAmount");
				values2[9]=rs.getString("largePrice");
				values2[10]=rs.getString("goodsSize");
				values2[11]=rs.getString("goodsIntro");
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
		for(int i=1;i<name.length;i++){
			if(values[i].equals("")||values[i].equals(null)){
				values[i]=values2[i];
			}
		}
		
		sqlstr="use onlineMarket update [Goods] set goodsName='"+values[1]+"',goodsCount="+values[2]+",goodsPrice="+values[3]+",storeWay='"+values[4]+"',sourceArea='"+values[5]+"',goodsType='"+values[6]+"',leastAmount="+values[7]+",largeAmount="+values[8]+",largePrice="+values[9]+",goodsSize='"+values[10]+"',goodsIntro='"+values[11]+"'  where goodsID='"+values[0]+"'";
		
	    try{
		    conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
			pstmt= conn.prepareStatement(sqlstr);
			rs=pstmt.executeQuery();
			
		}catch (SQLException e){
			e.printStackTrace();
		}
	  
	
        
}
    
    public void addGoods(String[] values){
	    Dao dao=new Dao();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sqlstr=null;
		
		sqlstr="use onlineMarket insert into [Goods] values('"+values[0]+"','"+values[1]+"','"+values[2]+"','"+values[3]+"','"+values[4]+"','"+values[5]+"',getdate(),'"+values[7]+"','"+values[8]+"','"+values[9]+"','"+values[10]+"','"+values[11]+"','default.jpg','"+values[12]+"','"+values[13]+"')";
		
	    try{
		    conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
			pstmt= conn.prepareStatement(sqlstr);
			rs=pstmt.executeQuery();
			while(rs.next()){	
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
	  
	}
    
    public void deleteGoods(String goodsID){
	    Dao dao=new Dao();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sqlstr=null;
		
		sqlstr="use onlineMarket delete from Goods where goodsID='"+goodsID+"'";
		
	    try{
		    conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
			pstmt= conn.prepareStatement(sqlstr);
			rs=pstmt.executeQuery();
			while(rs.next()){	
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
	  
	}
		
    
    
    public String sellerID(String sellerName){
	    Dao dao=new Dao();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sqlstr=null;
		String sellerID=null;
		sqlstr="use onlineMarket select sellerID from [User] a,[Seller] b where a.userID=b.userID AND a.userName='"+sellerName+"' ";
		
	    try{
		    conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
			pstmt= conn.prepareStatement(sqlstr);
			rs=pstmt.executeQuery();
			while(rs.next()){	
				sellerID=rs.getString("sellerID");
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
        
		return sellerID;
		
}
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		System.out.println("接收到请求：Goods");
		String value=request.getParameter("value");
		String sellerName=(String)request.getSession().getAttribute("sname");//改
		//session.setAttribute("sellerName", sellerName);
		System.out.println(sellerName);
		ArrayList<Goods> goodslist=new ArrayList<Goods>();
		if(value.equals("release"))
	{ 
	    goodslist=releaseOfGoods(sellerName);
		Goods a=new Goods();
		for(int j=0;j<goodslist.size();j++){
			a=(Goods)goodslist.get(j);
			System.out.println(a.getGoodsName()+" "+a.getGoodsPrice()+" "+a.getSourceArea()+" "+a.getPicture());
		}
		session.setAttribute("goodslist", goodslist);
		response.sendRedirect(request.getContextPath()+"/sale/saleReleaseOfGoods.jsp");
	}
		else if(value.equals("searchgoods"))
		{ 
			String type=request.getParameter("goodstype");
			type= new String(type.getBytes("iso-8859-1"),"utf-8"); 
			String name=request.getParameter("name");
			name= new String(name.getBytes("iso-8859-1"),"utf-8"); 
			if(type.equals("全部")){
				goodslist=releaseOfGoods(name);
			}
			else goodslist=searchGoods(name,type);
			Goods a=new Goods();
			for(int j=0;j<goodslist.size();j++){
				a=(Goods)goodslist.get(j);
				System.out.println(a.getGoodsName()+" "+a.getGoodsPrice()+" "+a.getSourceArea()+" "+a.getPicture());
			}
			session.setAttribute("goodslist", goodslist);
			response.sendRedirect(request.getContextPath()+"/sale/saleReleaseOfGoods.jsp");
		}
		else if(value.equals("edit")){
			//System.out.println("goods edit:");
			String goodsID=request.getParameter("goodsID");
			Goods goods=new Goods();
			goods=goodsDetails(goodsID);
			//System.out.println(goods.getGoodsName()+" "+goods.getGoodsPrice()+" "+goods.getSourceArea()+" "+goods.getPicture());
			session.setAttribute("goods", goods);
			response.sendRedirect(request.getContextPath()+"/sale/saleEditGoods.jsp");
		}
		else if(value.equals("saveedit")){
			String[] name={"goodsID","goodsName","goodsCount","goodsPrice","storeWay","sourceArea","goodsType","leastAmount","largeAmount","largePrice","goodsSize","goodsIntro"};
			String[] values=new String[12];
			values[0]=request.getParameter("goodsID");
			values[1]=request.getParameter("name");
			values[1]= new String(values[1].getBytes("iso-8859-1"),"utf-8");  
			values[2]=request.getParameter("count");
			values[3]=request.getParameter("price");
			values[4]=request.getParameter("storeWay");
			values[4]= new String(values[4].getBytes("iso-8859-1"),"utf-8"); 
			values[5]=request.getParameter("sourceArea");
			values[5]= new String(values[5].getBytes("iso-8859-1"),"utf-8"); 
			values[6]=request.getParameter("type");
			values[6]= new String(values[6].getBytes("iso-8859-1"),"utf-8"); 
			values[7]=request.getParameter("leastAmount");
			values[8]=request.getParameter("largeAmount");
			values[9]=request.getParameter("largePrice");
			values[10]=request.getParameter("goodsSize");
			values[11]=request.getParameter("goodsIntro");
			values[11]= new String(values[11].getBytes("iso-8859-1"),"utf-8"); 
			saveEdit(name,values);
		    
			Goods goods=new Goods();
			goods=goodsDetails(values[0]);
			//System.out.println(goods.getGoodsName()+" "+goods.getGoodsPrice()+" "+goods.getSourceArea()+" "+goods.getPicture());
			session.setAttribute("goods", goods);
			response.sendRedirect(request.getContextPath()+"/sale/saleEditGoods.jsp");
		}
		else if(value.equals("delete")){
			String goodsID=request.getParameter("goodsID");
			
			deleteGoods(goodsID);
			goodslist=releaseOfGoods(sellerName);
			session.setAttribute("goodslist", goodslist);
			response.sendRedirect(request.getContextPath()+"/sale/saleReleaseOfGoods.jsp");
		}
		else if(value.equals("add")){
			String[] values=new String[14];
			values[0]=request.getParameter("addGoodsID");
			values[1]=request.getParameter("addGoodsName");
			values[1]= new String(values[1].getBytes("iso-8859-1"),"utf-8");  
			values[2]=request.getParameter("addGoodsCount");
			values[3]=request.getParameter("addGoodsPrice");
			values[4]=request.getParameter("addStoreWay");
			values[4]= new String(values[4].getBytes("iso-8859-1"),"utf-8");  
			values[5]=request.getParameter("addSourceArea");
			values[5]= new String(values[5].getBytes("iso-8859-1"),"utf-8");  
			
			Date dt=new Date();
		    values[6]=String.valueOf(dt);
			String sellername=request.getParameter("sellerName");
			System.out.println(sellername);
			values[7]=sellerID(sellername);
			
			values[8]=request.getParameter("addGoodsType");
			values[8]= new String(values[8].getBytes("iso-8859-1"),"utf-8");  
			values[9]=request.getParameter("addLeastAmount");
			values[10]=request.getParameter("addLargeAmount");
			values[11]=request.getParameter("addLargePrice");
			values[12]=request.getParameter("addGoodsSize");
			values[13]=request.getParameter("addGoodsIntro");
			values[13]= new String(values[13].getBytes("iso-8859-1"),"utf-8");  
			addGoods(values);
			session.setAttribute("addgoodsid",values[0] );
			response.sendRedirect(request.getContextPath()+"/sale/saleAddGoodsPic.jsp");
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
