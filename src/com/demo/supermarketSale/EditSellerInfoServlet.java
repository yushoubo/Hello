package com.demo.supermarketSale;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.supermarket.Dao;

/**
 * Servlet implementation class EditSellerInfoServlet
 */
public class EditSellerInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSellerInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void saveEdit(String[] name,String[] values){
	    Dao dao=new Dao();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sqlstr=null;
		for(int i=1;i<name.length-1;i++)
	{
		if(!(values[i].equals(""))&&!(values[i].equals(null)))
	  {
		sqlstr="use onlineMarket update [User] set "+name[i]+"='"+values[i]+"' where userName='"+values[0]+"'";
		
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
	}
		if(!(values[8].equals(""))&&!(values[8].equals(null)))
		  {
			sqlstr="use onlineMarket update [Seller] set sellerIntro='"+values[8]+"' where sellerID in (select sellerID from [User] a,[Seller]b where a.userID=b.userID AND a.userName='"+values[0]+"')";
			
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
		sqlstr="use onlineMarket update [User] set realName='"+values[9]+"' where  userName='"+values[0]+"'";
		try{
		    conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
			pstmt= conn.prepareStatement(sqlstr);
			rs=pstmt.executeQuery();
			while(rs.next()){	
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
	    sqlstr="use onlineMarket update [User] set IDnumber='"+values[10]+"' where  userName='"+values[0]+"'";
		
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
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("接收到编辑卖家信息请求");
		String[] name={"userName","Phone","PostCode","Province","City","District","Street","Address","sellerIntro"};
		String[] info=new String[11];
		info[0]=request.getParameter("userName");
		info[0]= new String(info[0].getBytes("iso-8859-1"),"utf-8");
		info[1]=request.getParameter("Phone");
		info[2]=request.getParameter("postCode");
		info[3]=request.getParameter("Province");
		info[3]= new String(info[3].getBytes("iso-8859-1"),"utf-8");
		info[4]=request.getParameter("City");
		info[4]= new String(info[4].getBytes("iso-8859-1"),"utf-8");
		info[5]=request.getParameter("District");
		info[5]= new String(info[5].getBytes("iso-8859-1"),"utf-8");
		info[6]=request.getParameter("Street");
		info[6]= new String(info[6].getBytes("iso-8859-1"),"utf-8");
		info[7]=request.getParameter("Address");
		info[7]= new String(info[7].getBytes("iso-8859-1"),"utf-8");
		info[8]=request.getParameter("sellerIntro");
		info[8]= new String(info[8].getBytes("iso-8859-1"),"utf-8");
		info[9]=request.getParameter("realName");
		info[9]= new String(info[9].getBytes("iso-8859-1"),"utf-8");
		info[10]=request.getParameter("idnumber");
		for(int i=0;i<info.length;i++){
			System.out.println(info[i]);
		}
		
		saveEdit(name,info);
		response.sendRedirect(request.getContextPath()+"/sale/saleMain.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
