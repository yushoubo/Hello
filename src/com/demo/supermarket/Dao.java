package com.demo.supermarket;

public class Dao {
     private String jdString = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	 private String url = "jdbc:sqlserver://123.206.116.122:1433;DatabaseName=onlineMarket";
	 private String usname = "sa";
	 private String password = "ECUSTJ143@software";
		//static String url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=onlinemarket";
		//static String usname="User1";
		//static String password="123456";
	 public String getJdString() {
		return jdString;
	}
	public String getUrl() {
		return url;
	}
	public String getUsname() {
		return usname;
	}
	public String getPassword() {
		return password;
	}
}
