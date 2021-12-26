/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.utils;

public class Constants {
    public static String base_url = "http://localhost:8080/cms";
    public static String login = base_url+"/login";
    
    public static String customer_url = base_url+"/customer";
    public static String paymentSuccess = customer_url+"/payment/success";
    public static String paymentCancel = customer_url+"/payment/cancel";
    public static String profileUrl = customer_url+"/profile";
    public static String logout = customer_url+"/logout";
    public static String orders = customer_url +"/orders";
    public static String orderShow = customer_url +"/orders/show?id=";
    public static String orderCreate = customer_url +"/orders/create";
    public static String orderCancel = customer_url +"/orders/cancel";
    public static String orderFeedback = customer_url+"/orders/feedback?id=";
    public static String orderPayment = customer_url+"/payment?id=";
    
    public static String delivery_charge = "delivery_charge";
    public static String transport_cost = "transport_cost";
    public static String parcel_cost = "parcel_cost";
    
    public static String parcel_prefix = "p";
    public static String feedback_prefix = "f";
    public static String parcel_receipt_prefix = "pr";
    public static String recepient_prefix = "r";
    public static String consignment_prefix = "pc";
    public static String payment_key = "rzp_test_MdcRHrYGTafup7";
    public static String payment_secret = "bKV1buK7dfLSjPTrutsyNY86";
    
    public static String DB_Name = "courier";
    public static String DB_Host = "localhost";
    public static String DB_Port = "3306";
    public static String DB_User = "root";
    public static String DB_Password = "";
    
    public static int transport_cost_air = 120;
    public static int transport_cost_railway = 80;
    public static int transport_cost_road = 40;
    
    public static int parcel_cost_1 = 30;
    public static int parcel_cost_2 = 40;
    public static int parcel_cost_3 = 50;
    
    public static int delivery_cost_1 = 5;
    public static int delivery_cost_2 = 10;
    public static int delivery_cost_3 = 15;
    
}
