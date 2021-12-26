/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puja.customer.models;

public class Feedback {
    private String f_id;
    private String c_id;
    private String f_feedback;
    private int f_rating;

    public String getF_id() {
        return f_id;
    }

    public void setF_id(String f_id) {
        this.f_id = f_id;
    }

    public String getC_id() {
        return c_id;
    }

    public void setC_id(String c_id) {
        this.c_id = c_id;
    }

    public String getF_feedback() {
        return f_feedback;
    }

    public void setF_feedback(String f_feedback) {
        this.f_feedback = f_feedback;
    }

    public int getF_rating() {
        return f_rating;
    }

    public void setF_rating(int f_rating) {
        this.f_rating = f_rating;
    }

    public Feedback(String f_id, String c_id, String f_feedback, int f_rating) {
        this.f_id = f_id;
        this.c_id = c_id;
        this.f_feedback = f_feedback;
        this.f_rating = f_rating;
    }

    public Feedback() {
    }
    
}
