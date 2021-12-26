/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.dao;

import com.puja.customer.models.Feedback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class FeedbackDao {
    private Connection conn;

    public FeedbackDao(Connection conn) {
        this.conn = conn;
    }
    
    public Feedback getLastFeedback()
    {
        String query = "select * from feedback order by f_id desc limit 1";
        Feedback feedback = new Feedback();
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            ResultSet result = statement.executeQuery();
            if(result.next())
            {
                feedback.setF_id(result.getString("f_id"));
                feedback.setC_id(result.getString("c_id"));
                feedback.setF_feedback(result.getString("f_feedback"));
                feedback.setF_rating(result.getInt("f_rating"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return feedback;
    }
    
    public boolean insert(Feedback feedback)
    {
        boolean check = false;
        String query = "INSERT INTO `feedback`(`f_id`, `c_id`, `f_feedback`, `f_rating`) VALUES (?,?,?,?)";
        try {
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, feedback.getF_id());
            statement.setString(2, feedback.getC_id());
            statement.setString(3, feedback.getF_feedback());
            statement.setInt(4, feedback.getF_rating());
            int a = statement.executeUpdate();
            if(a>0)
            {
                check = true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
}
