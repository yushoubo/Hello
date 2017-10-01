package com.demo.supermarketSale;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.demo.supermarket.Dao;

public class SellerInfo {

	public String[] SellerInfo(String sellerName){
		System.out.println(sellerName);
		String[] sellerInfo=new String[13];
		SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
		Dao dao=new Dao();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sellerID=null;
		String userID=null;
		
		String sqlstr="use onlineMarket select userID,registerDate,realName,IDnumber,Phone,Postcode,Province,City,District,Street,Address from [User]a  where a.userName='"+sellerName+"' ";
		 try{
			 conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
				pstmt= conn.prepareStatement(sqlstr);
				rs=pstmt.executeQuery();
				while(rs.next()){
					userID=rs.getString("userID");
					sellerInfo[1]=sdf.format(rs.getDate("registerDate"));
					sellerInfo[2]=sellerName;
					sellerInfo[3]=rs.getString("realName");
					if(sellerInfo[3]==null)sellerInfo[3]="";
					else sellerInfo[3]=sellerInfo[3].trim();
					sellerInfo[4]=rs.getString("IDnumber");
					if(sellerInfo[4]==null)sellerInfo[4]="";
					else sellerInfo[4]=sellerInfo[4].trim();
					sellerInfo[5]=rs.getString("Phone");
					if(sellerInfo[5]==null)sellerInfo[5]="";
					else sellerInfo[5]=sellerInfo[5].trim();
					sellerInfo[6]=rs.getString("Postcode");
					if(sellerInfo[6]==null)sellerInfo[6]="";
					else sellerInfo[6]=sellerInfo[6].trim();
					sellerInfo[7]=rs.getString("Province");
					if(sellerInfo[7]==null)sellerInfo[7]="";
					else sellerInfo[7]=sellerInfo[7].trim();
					sellerInfo[8]=rs.getString("City");
					if(sellerInfo[8]==null)sellerInfo[8]="";
					else sellerInfo[8]=sellerInfo[8].trim();
					sellerInfo[9]=rs.getString("District");
					if(sellerInfo[9]==null)sellerInfo[9]="";
					else sellerInfo[9]=sellerInfo[9].trim();
					sellerInfo[10]=rs.getString("Street");
					if(sellerInfo[10]==null)sellerInfo[10]="";
					else sellerInfo[10]=sellerInfo[10].trim();
					sellerInfo[11]=rs.getString("Address");
					if(sellerInfo[11]==null)sellerInfo[11]="";
					else sellerInfo[11]=sellerInfo[11].trim();
				}

			}catch (SQLException e){
				e.printStackTrace();
			}
		
		String sellerIntro=null;
		sqlstr="use onlineMarket select sellerID,sellerIntro from [User]a,[Seller]b where a.userName='"+sellerName+"' AND a.userID=b.userID";
		 try{
			 conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
				pstmt= conn.prepareStatement(sqlstr);
				rs=pstmt.executeQuery();
				while(rs.next()){
					sellerID=rs.getString("sellerID");
					sellerIntro=rs.getString("sellerIntro");
				}

			}catch (SQLException e){
				e.printStackTrace();
			}
	    if(sellerID==null){
	    	Date dt=new Date();
		    SimpleDateFormat matter1=new SimpleDateFormat("yyyyMMdd");
		    String date=matter1.format(dt);
		    String maxSellerID=new String("0000");
		    //System.out.println(maxGoodsID);
		    sqlstr="use onlineMarket select max(sellerID)maxSellerID from [Seller] where sellerID like '"+date+"%' ";
		 try{
			 conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
				pstmt= conn.prepareStatement(sqlstr);
				rs=pstmt.executeQuery();
				if(rs.next()){
					if(rs.getString("maxSellerID")!=null)
					{
					  maxSellerID=rs.getString("maxSellerID");
					  //System.out.println("卖家ID："+maxSellerID);
					}
					else {
						 maxSellerID=date+maxSellerID;
						// System.out.println("卖家ID："+maxSellerID);
				}
				}
			}catch (SQLException e){
				e.printStackTrace();
			}
		 System.out.println("卖家ID："+maxSellerID);
		 String s1=maxSellerID.substring(0,8);
		 String s2=maxSellerID.substring(8,12);
		// System.out.println(s1);
		// System.out.println(s2); 
		 int number=Integer.parseInt(s2)+1;
		 s2=String.valueOf(number);
		 while(s2.length()<4){
			 s2="0"+s2;
		 }
		 maxSellerID=s1+s2;
		 
		 sellerInfo[0]=maxSellerID;
		 sqlstr="use onlineMarket insert into [Seller] values('"+maxSellerID+"',null,'"+userID+"',null)";
		 try{
			 conn = DriverManager.getConnection(dao.getUrl(), dao.getUsname(), dao.getPassword());
				pstmt= conn.prepareStatement(sqlstr);
				rs=pstmt.executeQuery();
				if(rs.next()){
					
				}
			}catch (SQLException e){
				e.printStackTrace();
			}
		 
	    }
	    else sellerInfo[0]=sellerID;
	    if(sellerIntro==null){
		sellerInfo[12]="";}
	    else sellerInfo[12]=sellerIntro;
		 
		 
		 
		for(int i=0;i<sellerInfo.length;i++)System.out.println(sellerInfo[i]);
		return sellerInfo;
	}
}
