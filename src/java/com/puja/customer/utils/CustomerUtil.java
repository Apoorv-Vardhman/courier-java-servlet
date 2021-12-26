/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.utils;

import com.puja.customer.dao.DB;
import com.puja.customer.dao.FeedbackDao;
import com.puja.customer.models.Feedback;
import com.puja.customer.models.Parcel;
import com.puja.customer.models.ParcelItem;
import com.puja.customer.models.Reciepient;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class CustomerUtil {
    public static String getJsp(String file){
        return "/customer/"+file+".jsp";
    }
       
    public static String assets(String file){
        return Constants.base_url+"/customer/assets/"+file;
    }
    
    public static String getKey(){
        String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(Calendar.getInstance().getTime());
        return "p"+timeStamp;
    }
    
    public static String getCurrentDate(){
        String timeStamp = new SimpleDateFormat("yyyy/MM/dd").format(Calendar.getInstance().getTime());
        return timeStamp;
    }
    
    public static boolean isParcelCancel(ParcelItem parcel){
        return parcel.getP_status().equalsIgnoreCase("placed") || parcel.getP_status().equalsIgnoreCase("confirm")
                || parcel.getP_status().equalsIgnoreCase("picked");
    }
    
    public static boolean isParcelCompleted(ParcelItem parcel){
        return parcel.getP_status().equalsIgnoreCase("completed");
    }
    
    public static String recepientId(Reciepient reciepient){
        String id = "";
        if(reciepient==null){
            id = Constants.recepient_prefix+"1";
        }else{
            id = Constants.recepient_prefix+(Integer.parseInt(reciepient.getR_id().substring(Constants.recepient_prefix.length()))+1);
        }
        return id;
    }
    
    public static String feedbackId()
    {
        String f_id = "";
        FeedbackDao feedbackDao = new FeedbackDao(DB.getConnection());
        Feedback feedback = feedbackDao.getLastFeedback();
        if(feedback==null)
        {
            f_id = Constants.parcel_prefix;
        }else{
            f_id = feedback.getF_id().substring(Constants.parcel_prefix.length());
            f_id = Constants.parcel_prefix+(Integer.parseInt(f_id)+1);
        }
        return f_id;
    }
    
    public static ParcelUtil parcelKeys(Parcel parcel){
        ParcelUtil parcelutil = new ParcelUtil();
        String parcel_id = "";
        String parcelReceiptNo = "";
        String consignment = "";
        if(parcel==null){
            parcel_id =Constants.parcel_prefix+"1";
            parcelReceiptNo = Constants.parcel_receipt_prefix+"1";
            consignment = Constants.consignment_prefix+"1";
        }
        else{
            parcel_id =parcel.getP_id().substring(Constants.parcel_prefix.length());
            consignment = parcel.getP_consignment_no().substring(Constants.consignment_prefix.length());
            parcelReceiptNo = parcel.getP_receipt_no().substring(Constants.parcel_receipt_prefix.length());
            parcel_id = Constants.parcel_prefix+(Integer.parseInt(parcel_id)+1);
            parcelReceiptNo = Constants.parcel_receipt_prefix+(Integer.parseInt(parcelReceiptNo)+1);
            consignment = Constants.consignment_prefix+(Integer.parseInt(consignment)+1);
        }
        parcelutil.setP_id(parcel_id);
        parcelutil.setP_receipt_no(parcelReceiptNo);
        parcelutil.setP_consignment_no(consignment);
        return parcelutil;
    }
    
    public static Delivery getParcelCost(double weight){
        double parcel = 0;
        double delivery = 0;
        if(weight<50){
                parcel+= weight*Constants.parcel_cost_1;
                delivery+= weight*Constants.delivery_cost_1;
            }else if(weight>=50 && weight<150){
                parcel+= weight*Constants.parcel_cost_2;
                delivery+= weight*Constants.delivery_cost_2;
            }else{
                parcel+= weight*Constants.parcel_cost_3;
                delivery+= weight*Constants.delivery_cost_3;
            }
        return new Delivery(parcel,delivery);
    }
    
    public static Transport getTransportCost(double distance){
        String mode = "road";
        double cost = 0;
        if(distance>4000){
            mode = "air";
            cost = distance*Constants.transport_cost_air;
        }else if(distance>1000 && distance<=4000){
            mode = "railway";
            cost = distance*Constants.transport_cost_railway;
        }else{
            mode = "road";
            cost = distance*Constants.transport_cost_road;
        }
        return new Transport(mode,cost);
    }
}
