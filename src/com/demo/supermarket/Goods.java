package com.demo.supermarket;

public class Goods {
    private String goodsID;   //��Ʒ���
    private String goodsName;  //��Ʒ����
    private float goodsCount;  //�������
    private float goodsPrice; //����
    private String storeWay; //�����д���
    private String sourceArea;//ԭ����
    private String setDate;//�ϼ�ʱ��
    private String sellerID; //�̼ұ��
    private String goodsType;//��Ʒ���
    private float leastAmount;//������
    private float largeAmount;//�����ɹ�������
    private float largePrice;//�����ɹ���
    private String Picture; //��ƷͼƬ
    private String goodsSize;
    
    public String getgoodsSize() {
		return goodsSize;
	}
	public void setgoodsSize(String goodsSie) {
		this.goodsSize = goodsSie;
	}
	public String getgoodsIntro() {
		return goodsIntro;
	}
	public void setgoodsIntro(String goodsIntro) {
		this.goodsIntro = goodsIntro;
	}
	private String goodsIntro;
    public void setgoodsID(String  goodsID)
    {
    	this.goodsID=goodsID;
    }
    public void setgoodsName(String  goodsName)
    {
    	this.goodsName=goodsName;
    }
    public void setgoodsCount(float  goodsCount)
    {
    	this.goodsCount=goodsCount;
    } 
    public void setgoodsPrice(float  goodsPrice)
    {
    	this.goodsPrice=goodsPrice;
    }
    public void setstoreWay(String  storeWay)
    {
    	this.storeWay=storeWay;
    }
    public void setsourceArea(String  sourceArea)
    {
    	this.sourceArea=sourceArea;
    }
    public void setsetDate(String  setDate)
    {
    	this.setDate=setDate;
    }
    public void setsellerID(String  sellerID)
    {
    	this.sellerID=sellerID;
    }
    public void setgoodsType(String  goodsType)
    {
    	this.goodsType=goodsType;
    }
    public void setleastAmount(float  leastAmount)
    {
    	this.leastAmount=leastAmount;
    }
    public void setlargeAmount(float  largeAmount)
    {
    	this.largeAmount=largeAmount;
    }
    public  void setlargePrice(float  largePrice)
    {
    	this.largePrice=largePrice;
    }
    public String getgoodsID()
    {
    	return this.goodsID;
    }
    public String getgoodsName()
    {
    	return this.goodsName;
    }
    public  String getsourceArea()
    {
    	return this.sourceArea;
    }
    public  String getsetDate()
    {
    	return this.setDate;
    }
    public String getsellerID()
    {
    	return this.sellerID;
    }
    public  String getgoodsType()
    {
    	return this.goodsType;
    }
    public String getPicture()
    {
    	return this.Picture;
    }
    public  float getgoodsCount()
    {
    	return this.goodsCount;
    }
    public float getgoodsPrice()
    {
    	return this.goodsPrice;
    }
    public  String getstoreWay()
    {
    	return this.storeWay;
    }
    public  float getleastAmount()
    {
    	return this.leastAmount;
    }
    public float getlargeAmount()
    {
    	return this.largeAmount;
    }
    public  float getlargePrice()
    {
    	return this.largePrice;
    }
	public String getGoodsID() {
		return goodsID;
	}
	
	public String getGoodsName() {
		return goodsName;
	}
	
	public float getGoodsCount() {
		return goodsCount;
	}
	
	public float getGoodsPrice() {
		return goodsPrice;
	}
	public String getStoreWay() {
		return storeWay;
	}
	public String getSourceArea() {
		return sourceArea;
	}
	public String getSetDate() {
		return setDate;
	}
	public String getSellerID() {
		return sellerID;
	}
	public String getGoodsType() {
		return goodsType;
	}
	public float getLeastAmount() {
		return leastAmount;
	}
	public float getLargeAmount() {
		return largeAmount;
	}
	public float getLargePrice() {
		return largePrice;
	}
	public void setpicture(String picture) {
		Picture = picture;
	}
    
}
