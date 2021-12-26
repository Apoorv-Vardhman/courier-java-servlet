/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.dao;

import com.puja.customer.models.ParcelCancel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ParcelCancelDao {
    private Connection conn;

    public ParcelCancelDao(Connection conn) {
        this.conn = conn;
    }
    
    
    public boolean isCancelled(String p_id)
    {
        boolean check = false;
        String query = "select * from parcel_cancel where p_id=?";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, p_id);
            ResultSet result = statement.executeQuery();
            if(result.next())
            {
                check = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelCancelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
    
    public boolean insert(ParcelCancel parcelCancel)
    {
        boolean check= false;
        String query = "INSERT INTO `parcel_cancel`(`p_id`, `c_id`, `pc_reason`, `pc_isrefund`) VALUES(?,?,?,?)";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, parcelCancel.getP_id());
            statement.setString(2, parcelCancel.getC_id());
            statement.setString(3, parcelCancel.getPc_reason());
            statement.setString(4, parcelCancel.getPc_isrefund());
            int a = statement.executeUpdate();
            if(a>0)
            {
                check = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ParcelCancelDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return check;
    }
}
