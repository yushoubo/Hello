package com.demo.supermarketservice;
import com.demo.supermarket.Goods;
import com.demo.supermarket.Order;

import java.util.ArrayList;
import org.hibernate.SQLQuery;
import org.hibernate.Session;  
import org.hibernate.SessionFactory;  
import org.hibernate.cfg.Configuration;  
  
public class OrderService {  
	ArrayList<Order> allOrder=new ArrayList<>();
    public ArrayList<Order> loadAllOrder() {  
        //��ȡ�����ļ�  
        Configuration cfg = new Configuration().configure();       
        SessionFactory factory = cfg.buildSessionFactory();  
        Session session = null;  
        try{  
            session = factory.openSession();  
            //��������  
            session.beginTransaction();  
           
            SQLQuery query = session.createSQLQuery("select * from [onlineMarket].[dbo].[Order]");
            query.addEntity(Order.class);           
            		       		
            for(Object item:query.list()){
            	Order order=(Order)item;
            	allOrder.add(order);
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
        return allOrder;
    }  
    public static void main(String[] argv){
    	OrderService svc=new OrderService();
    	ArrayList<Order> list=svc.loadAllOrder();
    	for(int i=0;i<list.size();i++){
    		Order a=new Order();
    		System.out.println(a.getorderID()+" "+a.getorderStatus()+" "+a.getreceiverName());
    	}
    }
}  