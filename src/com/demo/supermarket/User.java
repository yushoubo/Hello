package com.demo.supermarket;

public class User {
    private String userID;//用户编号
    private String registerDate;//	注册时间
    private String userName;//用户昵称
    private String password;//	用户密码
    private String realName;//	真实姓名
    private String IDnumber;//	身份证号
    private String Phone;//	联系电话
    private String userStatus;//	用户状态
    private String Postcode;//	邮编
    private String Province;//	省份
    private String City;//	城市
    private String District;//	区县
    private String Street;//	街道
    private String Address;//	详细地址
    private int isManager;//	是否是管理员0表示不是，1表示是
    void setuserID(String userID)
    {
    	this.userID=userID;
    }
    void setregisterDate(String registerDate)
    {
    	this.registerDate=registerDate;
    }
    void setuserName(String userName)
    {
    	this.userName=userName;
    }
    void setpassword(String password)
    {
    	this.password=password;
    }
    void setrealName(String realName)
    {
    	this.realName=realName;
    }
    void setIDnumber(String IDnumber)
    {
    	this.IDnumber=IDnumber;
    }
    void setPhone(String Phone)
    {
    	this.Phone=Phone;
    }
    void setuserStatus(String userStatus)
    {
    	this.userStatus=userStatus;
    }
    void setPostcode(String Postcode)
    {
    	this.Postcode=Postcode;
    }
    void setProvince(String Province)
    {
    	this.Province=Province;
    }
    void setCity(String City)
    {
    	this.City=City;
    }
    void setDistrict(String District)
    {
    	this.District=District;
    }
    
    void setStreet(String Street)
    {
    	this.Street=Street;
    }
    void setAddress(String Address)
    {
    	this.Address=Address;
    }
    void setisManager(int isManager)
    {
    	this.isManager=isManager;
    }
    String getuserID()
    {
    	return this.userID;
    }
    String getregisterDate()
    {
    	return this.registerDate;
    }
    String getuserName()
    {
    	return this.userName;
    }
    String getpassword()
    {
    	return this.password;
    }
    String getrealName()
    {
    	return this.realName;
    }
    String getIDnumber()
    {
    	return this.IDnumber;
    }
    String getPhone()
    {
    	return this.Phone;
    }
    String getuserStatus()
    {
    	return this.userStatus;
    }
    String getPostcode()
    {
    	return this.Postcode;
    }
    String getProvince()
    {
    	return this.Province;
    }
    String getCity()
    {
    	return this.City;
    }
    String getDistrict()
    {
    	return this.District;
    }
    String getStreet()
    {
    	return this.Street;
    }
    String getAddress()
    {
    	return this.Address;
    }
    int getisManager()
    {
    	return this.isManager;
    }
}
