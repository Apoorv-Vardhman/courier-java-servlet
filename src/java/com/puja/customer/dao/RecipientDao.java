/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.dao;

import com.puja.customer.models.Reciepient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RecipientDao {
    private Connection conn;

    public RecipientDao(Connection conn) {
        this.conn = conn;
    }
    
    public boolean register(String r_id,String r_name,String r_state,String r_district,String r_city,String r_pin,String r_address,String r_phone){
        boolean check = false;
        String sql = "INSERT INTO `recipient`(`r_id`, `r_name`, `r_state`, `r_district`, `r_city`, `r_pin`, `r_address`, `r_phone`) VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement statement;
        try {
            statement = conn.prepareStatement(sql);
            statement.setString(1, r_id);
            statement.setString(2,r_name);
            statement.setString(3,r_state);
            statement.setString(4,r_district);
            statement.setString(5,r_city);
            statement.setString(6,r_pin);
            statement.setString(7,r_address);
            statement.setString(8,r_phone);
            check = statement.execute();
            statement.close();
        } catch (SQLException ex) {
            Logger.getLogger(RecipientDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return check;
    }
    
    public Reciepient getReciepient(){
        Reciepient reciepient = new Reciepient();
        try {
            String sql = "SELECT * FROM `recipient` order by r_id desc limit 1 ";
            
            PreparedStatement statement = conn.prepareStatement(sql);
          
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                reciepient.setR_id(result.getString("r_id"));
                reciepient.setR_name(result.getString("r_name"));
                reciepient.setR_state(result.getString("r_state"));
                reciepient.setR_district(result.getString("r_district"));
                reciepient.setR_city(result.getString("r_city"));
                reciepient.setR_pin(result.getString("r_pin"));
                reciepient.setR_address(result.getString("r_address"));
                reciepient.setR_phone(result.getString("r_phone"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("com.puja.customer.dao.CustomerDao.getCustomer()"+customer.getC_city());
        return reciepient;
    }
    
    
    public Reciepient getReciepientById(String r_id){
        Reciepient reciepient = new Reciepient();
        try {
            String sql = "SELECT * FROM `recipient` where r_id = ? order by r_id desc limit 1 ";
            
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, r_id);
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                reciepient.setR_id(result.getString("r_id"));
                reciepient.setR_name(result.getString("r_name"));
                reciepient.setR_state(result.getString("r_state"));
                reciepient.setR_district(result.getString("r_district"));
                reciepient.setR_city(result.getString("r_city"));
                reciepient.setR_pin(result.getString("r_pin"));
                reciepient.setR_address(result.getString("r_address"));
                reciepient.setR_phone(result.getString("r_phone"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("com.puja.customer.dao.CustomerDao.getCustomer()"+customer.getC_city());
        return reciepient;
    }
    
}
