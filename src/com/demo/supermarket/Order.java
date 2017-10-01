package com.demo.supermarket;

import java.util.Date;

public class Order {
     private String orderID;//�������
     private String receiverName;//�ջ�������
     private String Phone;//��ϵ��ʽ
     private String orderStatus;//����״̬
     private String payTime;//����ʱ��
     private String deliveryTime;//����ʱ��
     private String confirmTime;//ȷ��/ȡ��ʱ��
     private String Postcode;//�ʱ�
     private String Address;//��ϸ��ַ
     private String creatTime;//����ʱ��
     private String userID;//�û����
     private String sellerID;//���ұ��
     private float shipCost;//�˷�
     private float allPrice;//��Ʒ�ܼ�
     public String getProvince() {
		return Province;
	}
	public void setProvince(String province) {
		Province = province;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getDistrict() {
		return District;
	}
	public void setDistrict(String district) {
		District = district;
	}
	public String getStreet() {
		return Street;
	}
	public void setStreet(String street) {
		Street = street;
	}
	private String Province;
     private String City;
     private String District;
     private String Street;
     public void setorderID(String orderID)
     {
    	 this.orderID=orderID;
     }
     public void setreceiverName(String receiverName)
     {
    	 this.receiverName=receiverName;
     }
     public void setPhone(String Phone)
     {
    	 this.Phone=Phone;
     }
     public void setorderStatus(String orderStatus)
     {
    	 this.orderStatus=orderStatus;
     }
     public void setpayTime(String payTime)
     {
    	 this.payTime=payTime;
     }
     public void setdeliveryTime(String deliveryTime)
     {
    	 this.deliveryTime=deliveryTime;
     }
     public void setconfirmTime(String confirmTime)
     {
    	 this.confirmTime=confirmTime;
     }
     public void setPostcode(String Postcode)
     {
    	 this.Postcode=Postcode;
     }
     public void setAddress(String Address)
     {
    	 this.Address=Address;
     }
     public void setcreatTime(String creatTime)
     {
    	 this.creatTime=creatTime;
     }
     public void setuserID(String userID)
     {
    	 this.userID=userID;
     }
     public void setsellerID(String sellerID)
     {
    	 this.sellerID=sellerID;
     }
     public void setshipCost(float shipCost)
     {
    	 this.shipCost=shipCost;
     }
     void setallPrice(float allPrice)
     {
    	 this.allPrice=allPrice;
     }
    public String getorderID()
     {
    	 return this.orderID;
     }
    public String getreceiverName()
     {
    	 return this.receiverName;
     }
    public String getPhone()
     {
    	 return this.Phone;
     }
    public String getorderStatus()
     {
    	 return this.orderStatus;
     }
   public  String getpayTime()
     {
    	 return this.payTime;
     }
    public String getdeliveryTime()
     {
    	 return this.deliveryTime;
     }
    public String getconfirmTime()
     {
    	 return this.confirmTime;
     }
    public String getPostcode()
     {
    	 return this.Postcode;
     }
     public String getAddress()
     {
    	 return this.Address;
     }
   public  String getcreatTime()
     {
    	 return this.creatTime;
     }
    public String getuserID()
     {
    	 return this.userID;
     }
    public String getsellerID()
     {
    	 return this.sellerID;
     }
    public float getshipCost()
     {
    	 return this.shipCost;
     }
    public float getallPrice()
     {
    	 return this.allPrice;
     }
}
