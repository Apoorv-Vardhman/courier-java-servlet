/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.dao;

import com.puja.customer.models.Feedback;
import com.puja.customer.models.Parcel;
import com.puja.customer.models.ParcelItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ParcelDao {
    private Connection conn;

    public ParcelDao(Connection conn) {
        this.conn = conn;
    }
    
    public boolean updatePayment(String parcel_id,String payment_id){
        boolean check = false;
        String query = "UPDATE `parcel` SET `payment_details`=? WHERE `p_id`=? ";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, payment_id);
            statement.setString(2, parcel_id);
            int ab = statement.executeUpdate();
            if(ab!= -1){
                check = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
    
    public boolean insert(String p_id,String p_consignment_no,String c_id,String p_sender_address,String r_id,String p_registered_date,int p_cost,int p_transport_cost,int p_parcel_cost,int p_delivery_charges,String p_payment_mode,String p_receipt_no){
        boolean check = false;
        String query = "INSERT INTO `parcel`(`p_id`, `p_consignment_no`, `c_id`, `p_sender_address`, `r_id`, `p_registered_date`,  `p_cost`, `p_transport_cost`, `p_parcel_cost`, `p_delivery_charges`, `p_payment_mode`, `p_receipt_no`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, p_id);
            statement.setString(2, p_consignment_no);
            statement.setString(3, c_id);
            statement.setString(4, p_sender_address);
            statement.setString(5, r_id);
            statement.setString(6, p_registered_date);
            statement.setInt(7, p_cost);
            statement.setInt(8, p_transport_cost);
            statement.setInt(9, p_parcel_cost);
            statement.setInt(10, p_delivery_charges);
            statement.setString(11, p_payment_mode);
            statement.setString(12, p_receipt_no);
            int ab = statement.executeUpdate();
            if(ab!= -1){
                check = true;
            }
            System.out.println("com.puja.customer.dao.ParcelDao.insert()"+ab);
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
    
    public boolean cancelParcel(String p_id,String c_id,String pc_reason,String pc_isrefund){
        boolean check = false;
        String sql = "INSERT INTO `parcel_cancel`(`p_id`, `c_id`, `pc_reason`, `pc_isrefund`) VALUES (?,?,?,?)";
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, p_id);
            preparedStatement.setString(2, c_id);
            preparedStatement.setString(3, pc_reason);
            preparedStatement.setString(4, pc_isrefund);
            int ab = preparedStatement.executeUpdate();
            if(ab != -1){
                check = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
    
    public Parcel getLastParcel(){
        Parcel parcel = new Parcel();
        String query = ("SELECT * FROM parcel ORDER BY p_id DESC LIMIT 1");
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            ResultSet result = statement.executeQuery();
            if(result.next()){
                parcel.setP_id(result.getString("p_id"));
                parcel.setP_consignment_no(result.getString("p_consignment_no"));
                parcel.setC_id(result.getString("c_id"));
                parcel.setP_sender_address(result.getString("p_sender_address"));
                parcel.setR_id(result.getString("r_id"));
                
                parcel.setP_registered_date(result.getString("p_registered_date"));
                parcel.setP_approved_date(result.getString("p_approved_date"));
                
                parcel.setP_picked_date(result.getString("p_picked_date"));
                parcel.setP_instock_date(result.getString("p_instock_date"));
                parcel.setP_outfordelivery(result.getString("p_outfordelivery"));
                parcel.setP_date_to_reach(result.getString("p_date_to_reach"));
                parcel.setP_reached_date(result.getString("p_reached_date"));
                parcel.setP_transport_medium(result.getString("p_transport_medium"));
                parcel.setP_cost(result.getInt("p_cost"));
                
                parcel.setP_transport_cost(result.getInt("p_transport_cost"));
                parcel.setP_parcel_cost(result.getInt("p_parcel_cost"));
                parcel.setP_delivery_charges(result.getInt("p_delivery_charges"));
                parcel.setP_payment_mode(result.getString("p_payment_mode"));
                parcel.setP_receipt_no(result.getString("p_receipt_no"));
                parcel.setPayment_details(result.getString("payment_details"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return parcel;
    }
    
    public String LastId(){
        String id = "";
        String query = ("SELECT * FROM parcel ORDER BY p_id DESC LIMIT 1");
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                id = resultSet.getString("p_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
    public boolean insertParcelItem(String p_id,String p_details,int p_no_of_item,String p_status,String p_location,int p_weight,int p_length,int p_width,int p_height){
        boolean check = false;
        String query = "INSERT INTO `parcel_details`(`p_id`, `p_details`, `p_no_of_item`, `p_status`, `p_location`, `p_weight`, `p_length`, `p_width`, `p_height`) VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, p_id);
            statement.setString(2, p_details);
            statement.setInt(3, p_no_of_item);
            statement.setString(4, p_status);
            statement.setString(5, p_location);
            statement.setInt(6,p_weight);
            statement.setInt(7,p_length);
            statement.setInt(8,p_width);
            statement.setInt(9,p_height);
            check = statement.execute();
            statement.close();
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return check;
    }
    
    public ParcelItem getParcelItem(String p_id)
    {
        ParcelItem parcelItem = new ParcelItem();
        try {
            String sql = "SELECT * from parcel_details where `p_id`= ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, p_id);
            ResultSet result = statement.executeQuery();
            while(result.next()){
                parcelItem.setP_id(result.getString("p_id"));
                parcelItem.setP_details(result.getString("p_details"));
                parcelItem.setP_no_of_item(result.getInt("p_no_of_item"));
                parcelItem.setP_status(result.getString("p_status"));
                parcelItem.setP_location(result.getString("p_location"));
                parcelItem.setB_id(result.getString("b_id"));
                
                parcelItem.setBs_id(result.getString("bs_id"));
                parcelItem.setP_weight(result.getInt("p_weight"));
                parcelItem.setP_length(result.getInt("p_length"));
                parcelItem.setP_width(result.getInt("p_width"));
                parcelItem.setP_height(result.getInt("p_height"));
                                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return parcelItem;
    }
    
    public boolean isParcelReached(String p_id)
    {
        boolean check = false;
        String query = "select * from parcel_details where p_id=? and p_status='Reached'";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, p_id);
            ResultSet result = statement.executeQuery();
            if(result.next())
            {
                check = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
    
    public Parcel getParcel(String p_id){
        Parcel parcel = new Parcel();
        try {
            String sql = "SELECT * from parcel where `p_id`= ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, p_id);
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                parcel.setP_id(result.getString("p_id"));
                parcel.setP_consignment_no(result.getString("p_consignment_no"));
                parcel.setC_id(result.getString("c_id"));
                parcel.setP_sender_address(result.getString("p_sender_address"));
                parcel.setR_id(result.getString("r_id"));
                
                parcel.setP_registered_date(result.getString("p_registered_date"));
                parcel.setP_approved_date(result.getString("p_approved_date"));
                
                parcel.setP_picked_date(result.getString("p_picked_date"));
                parcel.setP_instock_date(result.getString("p_instock_date"));
                parcel.setP_outfordelivery(result.getString("p_outfordelivery"));
                parcel.setP_date_to_reach(result.getString("p_date_to_reach"));
                parcel.setP_reached_date(result.getString("p_reached_date"));
                parcel.setP_transport_medium(result.getString("p_transport_medium"));
                parcel.setP_cost(result.getInt("p_cost"));
                
                parcel.setP_transport_cost(result.getInt("p_transport_cost"));
                parcel.setP_parcel_cost(result.getInt("p_parcel_cost"));
                parcel.setP_delivery_charges(result.getInt("p_delivery_charges"));
                parcel.setP_payment_mode(result.getString("p_payment_mode"));
                parcel.setP_receipt_no(result.getString("p_receipt_no"));
                parcel.setPayment_details(result.getString("payment_details"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return parcel;
    }
    
    public List<Parcel> getAllParcel(){
        List<Parcel> listParcel = new ArrayList();
        String query = "select * from parcel";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Parcel parcel = new Parcel();
                parcel.setP_id(result.getString("p_id"));
                parcel.setC_id(result.getString("c_id"));
                parcel.setR_id(result.getString("r_id"));
                parcel.setP_registered_date(result.getString("p_registered_date"));
                listParcel.add(parcel);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RecipientDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listParcel;
    }
    
    public boolean isnertFeedback(Feedback feedback){
        boolean check = false;
        String sql = "INSERT INTO `feedback`(`f_id`, `c_id`, `f_feedback`, `f_rating`) VALUES (?,?,?,?)";
        try {
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, feedback.getF_id());
            statement.setString(2, feedback.getC_id());
            statement.setString(3, feedback.getF_feedback());
            statement.setInt(4, feedback.getF_rating());
            int ab = statement.executeUpdate();
            if(ab != -1){
                check = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
}
