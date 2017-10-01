package com.demo.supermarketSale;

public class Seller {
   private String sellerID; //卖家编号
   private String registerDate;  //注册时间
   private String userID;   //用户编号
   private String sellerIntro;  //卖家简介
   void setSellerID(String sellerID)
   {
	   this.sellerID=sellerID;
   }
   void setRegisterDate(String registerDate)
   {
	   this.registerDate=registerDate;
   }
   void setUserID(String userID)
   {
	   this.userID=userID;
   }
   void setSellerIntro(String sellerIntro)
   {
	   this.sellerIntro=sellerIntro;
   }
   String getSellerID()
   {
	   return this.sellerID;
   }
   String getRegisterDate()
   {
	   return this.registerDate;
   }
   String getUserID()
   {
	   return this.userID;
   }
   String getSellerIntro()
   {
	   return this.sellerIntro;
   }

   
}
