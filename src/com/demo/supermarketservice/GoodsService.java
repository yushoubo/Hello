package com.demo.supermarketservice;
import com.demo.supermarket.Goods;
import com.demo.supermarket.Order;

import java.util.ArrayList;
import org.hibernate.SQLQuery;
import org.hibernate.Session;  
import org.hibernate.SessionFactory;  
import org.hibernate.cfg.Configuration;  
  
public class GoodsService {  
	ArrayList<Goods> allGoods=new ArrayList<>();
    public ArrayList<Goods> loadAllGoods() {  
        //��ȡ�����ļ�  
        Configuration cfg = new Configuration().configure();       
        SessionFactory factory = cfg.buildSessionFactory();  
        Session session = null;  
        try{  
            session = factory.openSession();  
            //��������  
            session.beginTransaction();  
           
            SQLQuery query = session.createSQLQuery("select * from [onlineMarket].[dbo].[Goods]");
            query.addEntity(Goods.class);           
            		       		
            for(Object item:query.list()){
            	Goods goods=(Goods)item;
            	allGoods.add(goods);
            }

            //�ύ����  
            session.getTransaction().commit();  
            
        }catch(Exception e){  
            e.printStackTrace();  
            //�ع�����  
            session.getTransaction().rollback();  
        }finally{  
            if(session != null){  
                if(session.isOpen()){  
                    //�ر�session  
                    session.close();  
                }  
            }  
        }  
        return allGoods;
    }  
    public static void main(String[] argv){
    	GoodsService svc=new GoodsService();
    	ArrayList<Goods> list=svc.loadAllGoods();
    	for(int i=0;i<list.size();i++){
    		Goods a=new Goods();
    		System.out.println(a.getGoodsID()+" "+a.getGoodsCount()+" "+a.getGoodsName());
    	}
    }
}  